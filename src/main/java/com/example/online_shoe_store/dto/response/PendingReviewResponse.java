package com.example.online_shoe_store.dto.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

/**
 * DTO cho sản phẩm chờ đánh giá (từ OrderItem đã DELIVERED)
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PendingReviewResponse {
    private String orderItemId;
    private String orderId;
    private String variantId;
    private String productName;
    private String variantColor;
    private String variantSize;
    private String productImage;
    private LocalDateTime deliveredDate;
}
