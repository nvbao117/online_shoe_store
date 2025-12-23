package com.example.online_shoe_store.Service.notification;

import com.example.online_shoe_store.Entity.Order;
import com.example.online_shoe_store.Entity.OrderItem;
import com.example.online_shoe_store.Entity.Payment;
import com.example.online_shoe_store.Entity.ShipDetail;
import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.Context;

import java.math.BigDecimal;
import java.text.NumberFormat;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Locale;
import java.util.stream.Collectors;

@Service
@Slf4j
@RequiredArgsConstructor
public class OrderConfirmationEmailService {

    private final JavaMailSender mailSender;
    private final TemplateEngine templateEngine;

    @Value("${spring.mail.username:no-reply@5astore.vn}")
    private String fromEmail;

    @Value("${app.base-url:http://localhost:8080}")
    private String baseUrl;

    private static final NumberFormat VND_FORMAT = NumberFormat.getInstance(new Locale("vi", "VN"));
    private static final DateTimeFormatter DATE_FORMAT = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm");

    /**
     * Gửi email xác nhận đơn hàng (async để không block main thread)
     */
    @Async
    public void sendOrderConfirmationEmail(Order order, Payment payment) {
        try {
            if (order == null || order.getUser() == null) {
                log.warn("Cannot send order confirmation email: order or user is null");
                return;
            }

            String customerEmail = order.getUser().getEmail();
            if (customerEmail == null || customerEmail.isBlank()) {
                log.warn("Cannot send order confirmation email: customer email is empty for order {}", order.getOrderId());
                return;
            }

            MimeMessage mimeMessage = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");

            helper.setFrom(fromEmail);
            helper.setTo(customerEmail);
            helper.setSubject("✅ Xác nhận đơn hàng #" + order.getOrderId().substring(0, 8).toUpperCase());

            String htmlContent = buildEmailContent(order, payment);
            helper.setText(htmlContent, true);

            mailSender.send(mimeMessage);
            log.info("📧 Order confirmation email sent successfully to {} for order {}", 
                customerEmail, order.getOrderId());

        } catch (MessagingException e) {
            log.error("❌ Failed to send order confirmation email: {}", e.getMessage());
        } catch (Exception e) {
            // Catch all exceptions to prevent email issues from affecting order creation
            log.error("❌ Unexpected error sending order confirmation email: {}", e.getMessage(), e);
        }
    }

    private String buildEmailContent(Order order, Payment payment) {
        Context context = new Context();

        // Order info
        context.setVariable("orderId", "#" + order.getOrderId().substring(0, 8).toUpperCase());
        context.setVariable("orderDate", order.getCreatedAt() != null 
            ? order.getCreatedAt().format(DATE_FORMAT) 
            : "N/A");
        context.setVariable("paymentMethod", payment != null && payment.getPaymentMethod() != null 
            ? payment.getPaymentMethod().getMethodName() 
            : "COD");

        // Shipping info
        ShipDetail shipDetail = order.getShipDetail();
        if (shipDetail != null) {
            context.setVariable("customerName", shipDetail.getRecipientName());
            context.setVariable("phone", shipDetail.getPhone());
            
            String address = String.format("%s, %s, %s, %s",
                shipDetail.getDetail() != null ? shipDetail.getDetail() : "",
                shipDetail.getWard(),
                shipDetail.getDistrict(),
                shipDetail.getProvince()
            ).replaceAll("^, ", "");
            context.setVariable("address", address);
        } else {
            context.setVariable("customerName", order.getUser().getName());
            context.setVariable("phone", "N/A");
            context.setVariable("address", "N/A");
        }

        // Order items
        List<EmailOrderItem> items = order.getOrderItems().stream()
            .map(this::mapToEmailOrderItem)
            .collect(Collectors.toList());
        context.setVariable("items", items);

        // Pricing
        BigDecimal subtotal = order.getTotalAmount() != null ? order.getTotalAmount() : BigDecimal.ZERO;
        BigDecimal shippingFee = order.getShippingFee() != null ? order.getShippingFee() : BigDecimal.ZERO;
        BigDecimal discount = order.getDiscountAmount() != null ? order.getDiscountAmount() : BigDecimal.ZERO;
        BigDecimal total = order.getFinalAmount() != null ? order.getFinalAmount() : subtotal.add(shippingFee).subtract(discount);

        context.setVariable("subtotal", formatPrice(subtotal));
        context.setVariable("shippingFee", formatPrice(shippingFee));
        context.setVariable("discount", formatPrice(discount));
        context.setVariable("total", formatPrice(total));

        // Tracking URL
        context.setVariable("orderTrackingUrl", baseUrl + "/orders/" + order.getOrderId());

        return templateEngine.process("email/order-confirmation-email", context);
    }

    private EmailOrderItem mapToEmailOrderItem(OrderItem item) {
        String imageUrl = "/images/placeholder.png";
        String productName = "Sản phẩm";
        String color = "N/A";
        String size = "N/A";

        if (item.getProductVariant() != null) {
            if (item.getProductVariant().getImageUrl() != null) {
                imageUrl = item.getProductVariant().getImageUrl();
                if (imageUrl.startsWith("src/data")) {
                    imageUrl = imageUrl.replace("src/data", "");
                }
                // Make absolute URL for email
                if (!imageUrl.startsWith("http")) {
                    imageUrl = baseUrl + imageUrl;
                }
            }
            if (item.getProductVariant().getProduct() != null) {
                productName = item.getProductVariant().getProduct().getName();
            }
            color = item.getProductVariant().getColor();
            size = item.getProductVariant().getSize();
        }

        BigDecimal totalPrice = item.getPrice() != null 
            ? item.getPrice().multiply(BigDecimal.valueOf(item.getQuantity()))
            : BigDecimal.ZERO;

        return new EmailOrderItem(
            productName,
            color,
            size,
            item.getQuantity(),
            formatPrice(totalPrice),
            imageUrl
        );
    }

    private String formatPrice(BigDecimal price) {
        if (price == null) return "0đ";
        return VND_FORMAT.format(price) + "đ";
    }

    /**
     * DTO for email template
     */
    public record EmailOrderItem(
        String productName,
        String color,
        String size,
        int quantity,
        String totalPrice,
        String imageUrl
    ) {}
}
