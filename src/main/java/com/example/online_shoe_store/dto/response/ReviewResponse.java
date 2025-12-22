package com.example.online_shoe_store.dto.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.List;

/**
 * DTO cho thông tin đánh giá đã viết
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ReviewResponse {
    private String reviewId;
    private Integer rating;
    private String comment;
    private LocalDateTime reviewDate;

    // User info
    private String username;

    // Product info
    private String variantId;
    private String productName;
    private String variantColor;
    private String variantSize;
    private String productImage;

    // Review images
    private List<String> imageUrls;
}
