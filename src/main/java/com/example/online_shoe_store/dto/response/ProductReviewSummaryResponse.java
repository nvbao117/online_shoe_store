package com.example.online_shoe_store.dto.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * DTO cho thông tin tổng quan đánh giá sản phẩm
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ProductReviewSummaryResponse {
    private Double averageRating;
    private Integer totalReviews;
    private Integer fiveStarCount;
    private Integer fourStarCount;
    private Integer threeStarCount;
    private Integer twoStarCount;
    private Integer oneStarCount;
}
