package com.example.online_shoe_store.Controller.admin;

import com.example.online_shoe_store.Entity.Order;
import com.example.online_shoe_store.Entity.OrderItem;
import com.example.online_shoe_store.Entity.Payment;
import com.example.online_shoe_store.Entity.enums.OrderStatus;
import com.example.online_shoe_store.Entity.enums.PaymentStatus;
import com.example.online_shoe_store.Repository.OrderRepository;
import lombok.Builder;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/admin/orders")
@RequiredArgsConstructor
public class AdminOrderApiController {

    private final OrderRepository orderRepository;

    @GetMapping
    public ResponseEntity<List<OrderAdminResponse>> getAllOrders() {
        List<Order> orders = orderRepository.findAll();
        // Sort by date desc
        orders.sort((o1, o2) -> o2.getOrderDate().compareTo(o1.getOrderDate()));

        List<OrderAdminResponse> response = orders.stream()
                .map(this::mapToResponse)
                .collect(Collectors.toList());
        return ResponseEntity.ok(response);
    }

    @PostMapping("/{id}/confirm")
    public ResponseEntity<?> confirmOrder(@PathVariable String id) {
        Order order = orderRepository.findById(id).orElse(null);
        if (order == null) {
            return ResponseEntity.badRequest().body("Đơn hàng không tồn tại");
        }
        order.updateStatus(OrderStatus.CONFIRMED, "Admin confirmed", "ADMIN");
        orderRepository.save(order);
        return ResponseEntity.ok("Đã xác nhận đơn hàng");
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteOrder(@PathVariable String id) {
        if (!orderRepository.existsById(id)) {
            return ResponseEntity.badRequest().body("Đơn hàng không tồn tại");
        }
        orderRepository.deleteById(id);
        return ResponseEntity.ok("Đã xoá đơn hàng");
    }

    private OrderAdminResponse mapToResponse(Order order) {
        String productNames = order.getOrderItems().stream()
                .map(item -> item.getProductVariant().getProduct().getName())
                .collect(Collectors.joining(", "));

        Payment payment = order.getSuccessfulPayment();
        if (payment == null) {
            payment = order.getActivePayment();
        }
        
        String paymentMethod = payment != null && payment.getPaymentMethod() != null 
                ? payment.getPaymentMethod().getMethodName() 
                : "N/A";
        // Map ENUM to readable string if needed, or handle in frontend
        // Assuming frontend will handle translation or we send basic string

        boolean isPaid = order.isPaid();

        return OrderAdminResponse.builder()
                .orderId(order.getOrderId())
                .orderDate(order.getOrderDate().format(DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm")))
                .customerName(order.getUser() != null ? order.getUser().getName() : "Khách lẻ")
                .products(productNames)
                .totalAmount(order.getFinalAmount() != null ? order.getFinalAmount() : BigDecimal.ZERO)
                .paymentMethod(paymentMethod)
                .isPaid(isPaid)
                .status(order.getStatus().name())
                .build();
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> getOrderDetail(@PathVariable String id) {
        try {
            Order order = orderRepository.findById(id).orElse(null);
            if (order == null) {
                return ResponseEntity.badRequest().body("Đơn hàng không tồn tại");
            }
            return ResponseEntity.ok(mapToDetailResponse(order));
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.internalServerError().body("Error: " + e.getMessage());
        }
    }

    private OrderAdminDetailResponse mapToDetailResponse(Order order) {
        List<OrderItemDetail> items = order.getOrderItems().stream()
                .map(item -> OrderItemDetail.builder()
                        .productName(item.getProductVariant().getProduct().getName())
                        .variantInfo(item.getProductVariant().getSize() + " - " + item.getProductVariant().getColor())
                        .quantity(item.getQuantity())
                        .price(item.getPrice())
                        .totalPrice(item.getTotalPrice())
                        .imageUrl(
                            getPublicImageUrl(
                                item.getProductVariant().getImageUrl() != null && !item.getProductVariant().getImageUrl().isEmpty()
                                    ? item.getProductVariant().getImageUrl()
                                    : item.getProductVariant().getProduct().getImageUrl()
                            )
                        )
                        .build())
                .collect(Collectors.toList());

        Payment payment = order.getSuccessfulPayment();
        if (payment == null) payment = order.getActivePayment();

        String paymentMethod = payment != null && payment.getPaymentMethod() != null
                ? payment.getPaymentMethod().getMethodName()
                : "N/A";

        return OrderAdminDetailResponse.builder()
                .orderId(order.getOrderId())
                .orderDate(order.getOrderDate().format(DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm")))
                .status(order.getStatus().name())
                .customerName(order.getUser() != null ? order.getUser().getName() : "Khách lẻ")
                .customerPhone(order.getUser() != null ? order.getUser().getPhone() : "")
                .customerEmail(order.getUser() != null ? order.getUser().getEmail() : "")
                .shippingAddress(order.getShipDetail() != null
                        ? order.getShipDetail().getDetail() + ", " + order.getShipDetail().getWard() + ", " + order.getShipDetail().getDistrict() + ", " + order.getShipDetail().getProvince()
                        : "")
                .paymentMethod(paymentMethod)
                .isPaid(order.isPaid())
                .shippingFee(order.getShippingFee())
                .discountAmount(order.getDiscountAmount())
                .totalAmount(order.getFinalAmount())
                .items(items)
                .build();
    }

    @Data
    @Builder
    public static class OrderAdminDetailResponse {
        private String orderId;
        private String orderDate;
        private String status;
        private String customerName;
        private String customerPhone;
        private String customerEmail;
        private String shippingAddress;
        private String paymentMethod;
        private boolean isPaid;
        private BigDecimal shippingFee;
        private BigDecimal discountAmount;
        private BigDecimal totalAmount;
        private List<OrderItemDetail> items;
    }

    private String getPublicImageUrl(String raw) {
        if (raw == null || raw.isEmpty()) return "/images/no-image.png";
        String v = raw.replace("\\", "/").trim();
        if (v.startsWith("http")) return v;
        if (v.contains("/images/products/")) {
            return "/images/products/" + v.substring(v.lastIndexOf("/images/products/") + 17);
        }
        if (v.startsWith("src/data/")) return "/images/products/" + v.substring(9);
        return "/images/products/" + v;
    }

    @Data
    @Builder
    public static class OrderItemDetail {
        private String productName;
        private String variantInfo;
        private int quantity;
        private BigDecimal price;
        private BigDecimal totalPrice;
        private String imageUrl;
    }

    @Data
    @Builder
    public static class OrderAdminResponse {
        private String orderId;
        private String orderDate;
        private String customerName;
        private String products;
        private BigDecimal totalAmount;
        private String paymentMethod;
        private boolean isPaid;
        private String status;
    }
}
