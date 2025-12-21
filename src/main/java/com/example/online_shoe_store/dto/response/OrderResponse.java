package com.example.online_shoe_store.dto.response;

import lombok.Builder;
import lombok.Data;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

@Data
@Builder
public class OrderResponse {
    private String orderId;
    private LocalDateTime createdAt;
    private BigDecimal totalAmount;
    private BigDecimal shippingFee;
    private BigDecimal finalAmount;
    private String status;
    private String paymentMethod;
    private String paymentStatus;
    private String customerName;
    private String phone;
    private String shippingAddress; // Formatted address
    private List<OrderItemResponse> items;

    @Data
    @Builder
    public static class OrderItemResponse {
        private String productName;
        private String productEmoji; // Optional, if you have it
        private String color;
        private String size;
        private Integer quantity;
        private BigDecimal price;
        private BigDecimal totalPrice;
        private String imageUrl;
    }
}
