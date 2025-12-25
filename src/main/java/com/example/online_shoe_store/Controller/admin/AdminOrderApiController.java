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
    public ResponseEntity<List<OrderAdminResponse>> getAllOrders(
            @RequestParam(required = false) String keyword,
            @RequestParam(required = false) String status,
            @RequestParam(required = false) String paymentStatus,
            @RequestParam(required = false) String paymentMethod) {

        List<Order> orders = orderRepository.findAll();

        // Filter by keyword (search in customer name and order ID)
        if (keyword != null && !keyword.trim().isEmpty()) {
            String searchKeyword = keyword.trim().toLowerCase();
            orders = orders.stream()
                    .filter(order -> {
                        String customerName = order.getUser() != null ? order.getUser().getName() : "";
                        String orderId = order.getOrderId() != null ? order.getOrderId() : "";
                        return customerName.toLowerCase().contains(searchKeyword) ||
                                orderId.toLowerCase().contains(searchKeyword);
                    })
                    .collect(Collectors.toList());
        }

        // Filter by order status
        if (status != null && !status.trim().isEmpty()) {
            try {
                OrderStatus statusEnum = OrderStatus.valueOf(status.toUpperCase());
                orders = orders.stream()
                        .filter(order -> order.getStatus() == statusEnum)
                        .collect(Collectors.toList());
            } catch (IllegalArgumentException ignored) {
                // Invalid status, skip filter
            }
        }

        // Filter by payment status (isPaid: true/false)
        if (paymentStatus != null && !paymentStatus.trim().isEmpty()) {
            boolean isPaid = "PAID".equalsIgnoreCase(paymentStatus);
            orders = orders.stream()
                    .filter(order -> order.isPaid() == isPaid)
                    .collect(Collectors.toList());
        }

        // Filter by payment method
        if (paymentMethod != null && !paymentMethod.trim().isEmpty()) {
            orders = orders.stream()
                    .filter(order -> {
                        Payment payment = order.getSuccessfulPayment();
                        if (payment == null) {
                            payment = order.getActivePayment();
                        }
                        if (payment != null && payment.getPaymentMethod() != null) {
                            return payment.getPaymentMethod().getMethodName().equalsIgnoreCase(paymentMethod);
                        }
                        return false;
                    })
                    .collect(Collectors.toList());
        }

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
        order.updateStatus(OrderStatus.SHIPPED, "Admin confirmed & shipped", "ADMIN");
        orderRepository.save(order);
        return ResponseEntity.ok("Đã xác nhận đơn hàng");
    }

    @PostMapping("/{id}/mark-delivered")
    public ResponseEntity<?> markAsDelivered(@PathVariable String id) {
        Order order = orderRepository.findById(id).orElse(null);
        if (order == null) {
            return ResponseEntity.badRequest().body("Đơn hàng không tồn tại");
        }
        if (!List.of(OrderStatus.SHIPPED, OrderStatus.IN_TRANSIT, OrderStatus.OUT_FOR_DELIVERY)
                .contains(order.getStatus())) {
            return ResponseEntity.badRequest().body("Chỉ có thể xác nhận giao hàng cho đơn đang vận chuyển");
        }
        order.updateStatus(OrderStatus.COMPLETED, "Admin marked as delivered", "ADMIN");
        orderRepository.save(order);
        return ResponseEntity.ok("Đã xác nhận giao hàng thành công");
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteOrder(@PathVariable String id) {
        if (!orderRepository.existsById(id)) {
            return ResponseEntity.badRequest().body("Đơn hàng không tồn tại");
        }
        orderRepository.deleteById(id);
        return ResponseEntity.ok("Đã xoá đơn hàng");
    }

    @GetMapping("/returns")
    public ResponseEntity<List<OrderAdminResponse>> getReturnOrders() {
        List<Order> orders = orderRepository.findAll().stream()
                .filter(order -> order.getStatus() == OrderStatus.RETURN_REQUESTED ||
                        order.getStatus() == OrderStatus.RETURN_IN_PROGRESS ||
                        order.getStatus() == OrderStatus.RETURNED ||
                        order.getStatus() == OrderStatus.REFUNDED ||
                        order.getStatus() == OrderStatus.PARTIALLY_REFUNDED)
                .sorted((o1, o2) -> o2.getOrderDate().compareTo(o1.getOrderDate()))
                .collect(Collectors.toList());

        List<OrderAdminResponse> response = orders.stream()
                .map(this::mapToResponse)
                .collect(Collectors.toList());
        return ResponseEntity.ok(response);
    }

    @PostMapping("/{id}/accept-return")
    public ResponseEntity<?> acceptReturn(@PathVariable String id) {
        Order order = orderRepository.findById(id).orElse(null);
        if (order == null) {
            return ResponseEntity.badRequest().body("Đơn hàng không tồn tại");
        }
        if (order.getStatus() != OrderStatus.RETURN_REQUESTED) {
            return ResponseEntity.badRequest().body("Đơn hàng không ở trạng thái yêu cầu trả hàng");
        }
        order.updateStatus(OrderStatus.RETURN_IN_PROGRESS, "Admin accepted return request", "ADMIN");
        orderRepository.save(order);
        return ResponseEntity.ok("Đã chấp nhận yêu cầu hoàn trả");
    }

    @PostMapping("/{id}/reject-return")
    public ResponseEntity<?> rejectReturn(@PathVariable String id) {
        Order order = orderRepository.findById(id).orElse(null);
        if (order == null) {
            return ResponseEntity.badRequest().body("Đơn hàng không tồn tại");
        }
        if (order.getStatus() != OrderStatus.RETURN_REQUESTED) {
            return ResponseEntity.badRequest().body("Đơn hàng không ở trạng thái yêu cầu trả hàng");
        }
        order.updateStatus(OrderStatus.COMPLETED, "Admin rejected return request", "ADMIN");
        orderRepository.save(order);
        return ResponseEntity.ok("Đã từ chối yêu cầu hoàn trả");
    }

    @PostMapping("/{id}/complete-return")
    public ResponseEntity<?> completeReturn(@PathVariable String id) {
        Order order = orderRepository.findById(id).orElse(null);
        if (order == null) {
            return ResponseEntity.badRequest().body("Đơn hàng không tồn tại");
        }
        if (order.getStatus() != OrderStatus.RETURN_IN_PROGRESS) {
            return ResponseEntity.badRequest().body("Đơn hàng không ở trạng thái đang xử lý trả hàng");
        }
        order.updateStatus(OrderStatus.REFUNDED, "Return completed and refunded", "ADMIN");
        orderRepository.save(order);
        return ResponseEntity.ok("Đã hoàn thành xử lý hoàn trả");
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
                                        item.getProductVariant().getImageUrl() != null
                                                && !item.getProductVariant().getImageUrl().isEmpty()
                                                        ? item.getProductVariant().getImageUrl()
                                                        : item.getProductVariant().getProduct().getImageUrl()))
                        .build())
                .collect(Collectors.toList());

        Payment payment = order.getSuccessfulPayment();
        if (payment == null)
            payment = order.getActivePayment();

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
                        ? order.getShipDetail().getDetail() + ", " + order.getShipDetail().getWard() + ", "
                                + order.getShipDetail().getDistrict() + ", " + order.getShipDetail().getProvince()
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
        if (raw == null || raw.isEmpty())
            return "/images/no-image.png";
        String v = raw.replace("\\", "/").trim();
        if (v.startsWith("http"))
            return v;
        if (v.contains("/images/products/")) {
            return "/images/products/" + v.substring(v.lastIndexOf("/images/products/") + 17);
        }
        if (v.startsWith("src/data/"))
            return "/images/products/" + v.substring(9);
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
