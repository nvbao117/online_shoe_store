package com.example.online_shoe_store.Service;

import com.example.online_shoe_store.Entity.User;
import com.example.online_shoe_store.dto.response.PendingReviewResponse;
import com.example.online_shoe_store.dto.response.ProductReviewSummaryResponse;
import com.example.online_shoe_store.dto.response.ReviewResponse;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface ReviewService {

    /**
     * Lấy danh sách đánh giá của user
     */
    List<ReviewResponse> getMyReviews(User user);

    /**
     * Lấy danh sách sản phẩm chờ đánh giá (từ đơn hàng đã giao)
     */
    List<PendingReviewResponse> getPendingReviewItems(User user);

    /**
     * Tạo đánh giá mới
     */
    ReviewResponse createReview(User user, String variantId, Integer rating, String comment,
            List<MultipartFile> images);

    /**
     * Lấy tất cả reviews của sản phẩm (có thể lọc theo rating)
     */
    List<ReviewResponse> getReviewsByProduct(String productId, Integer rating);

    /**
     * Lấy tổng quan đánh giá sản phẩm
     */
    ProductReviewSummaryResponse getReviewSummary(String productId);
}
