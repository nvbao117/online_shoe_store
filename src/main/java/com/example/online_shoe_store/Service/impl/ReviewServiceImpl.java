package com.example.online_shoe_store.Service.impl;

import com.example.online_shoe_store.Entity.*;
import com.example.online_shoe_store.Entity.enums.OrderStatus;
import com.example.online_shoe_store.Repository.*;
import com.example.online_shoe_store.Service.ReviewService;
import com.example.online_shoe_store.dto.response.PendingReviewResponse;
import com.example.online_shoe_store.dto.response.ProductReviewSummaryResponse;
import com.example.online_shoe_store.dto.response.ReviewResponse;
import com.example.online_shoe_store.mapper.ReviewMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Service
@RequiredArgsConstructor
@Slf4j
public class ReviewServiceImpl implements ReviewService {

    private final ReviewRepository reviewRepository;
    private final ReviewImageRepository reviewImageRepository;
    private final ProductVariantRepository productVariantRepository;
    private final OrderRepository orderRepository;
    private final ReviewMapper reviewMapper;

    private static final String REVIEW_IMAGES_DIR = "data/images/reviews";

    @Override
    public List<ReviewResponse> getMyReviews(User user) {
        List<Review> reviews = reviewRepository.findByUserOrderByReviewDateDesc(user);
        return reviewMapper.toReviewResponseList(reviews);
    }

    @Override
    public List<PendingReviewResponse> getPendingReviewItems(User user) {
        // Lấy tất cả đơn hàng đã giao (DELIVERED hoặc COMPLETED) của user
        List<Order> orders = orderRepository.findByUserOrderByCreatedAtDesc(user);

        List<PendingReviewResponse> pendingItems = new ArrayList<>();

        for (Order order : orders) {
            // Chỉ lấy đơn hàng đã giao
            if (order.getStatus() == OrderStatus.DELIVERED || order.getStatus() == OrderStatus.COMPLETED) {
                for (OrderItem item : order.getOrderItems()) {
                    ProductVariant variant = item.getProductVariant();

                    // Kiểm tra xem user đã đánh giá variant này chưa
                    boolean alreadyReviewed = reviewRepository.existsByUserAndProductVariant(user, variant);

                    if (!alreadyReviewed) {
                        pendingItems.add(reviewMapper.mapToPendingReview(item, order));
                    }
                }
            }
        }

        return pendingItems;
    }

    @Override
    @Transactional
    public ReviewResponse createReview(User user, String variantId, Integer rating, String comment,
            List<MultipartFile> images) {
        // Tìm variant
        ProductVariant variant = productVariantRepository.findById(variantId)
                .orElseThrow(() -> new RuntimeException("Không tìm thấy sản phẩm"));

        // Kiểm tra đã đánh giá chưa
        if (reviewRepository.existsByUserAndProductVariant(user, variant)) {
            throw new RuntimeException("Bạn đã đánh giá sản phẩm này rồi");
        }

        // Tạo review
        Review review = Review.builder()
                .user(user)
                .productVariant(variant)
                .rating(rating)
                .comment(comment)
                .build();

        review = reviewRepository.save(review);

        // Upload và lưu ảnh
        if (images != null && !images.isEmpty()) {
            List<ReviewImage> reviewImages = uploadReviewImages(review, images);
            review.setReviewImages(reviewImages);
        }

        return reviewMapper.toReviewResponse(review);
    }

    @Override
    public List<ReviewResponse> getReviewsByProduct(String productId, Integer rating) {
        List<Review> reviews;
        if (rating != null && rating >= 1 && rating <= 5) {
            reviews = reviewRepository.findByProductIdAndRatingOrderByReviewDateDesc(productId, rating);
        } else {
            reviews = reviewRepository.findByProductIdOrderByReviewDateDesc(productId);
        }
        return reviewMapper.toReviewResponseList(reviews);
    }

    @Override
    public ProductReviewSummaryResponse getReviewSummary(String productId) {
        // Lấy số lượng đánh giá theo từng mức rating
        List<Object[]> ratingCounts = reviewRepository.countByProductIdGroupByRating(productId);

        // Map rating -> count
        Map<Integer, Long> countMap = new HashMap<>();
        long total = 0;
        double sum = 0;

        for (Object[] row : ratingCounts) {
            Integer rating = (Integer) row[0];
            Long count = (Long) row[1];
            countMap.put(rating, count);
            total += count;
            sum += rating * count;
        }

        // Tính điểm trung bình
        Double avg = total > 0 ? Math.round(sum / total * 10.0) / 10.0 : 0.0;

        return ProductReviewSummaryResponse.builder()
                .averageRating(avg)
                .totalReviews((int) total)
                .fiveStarCount(countMap.getOrDefault(5, 0L).intValue())
                .fourStarCount(countMap.getOrDefault(4, 0L).intValue())
                .threeStarCount(countMap.getOrDefault(3, 0L).intValue())
                .twoStarCount(countMap.getOrDefault(2, 0L).intValue())
                .oneStarCount(countMap.getOrDefault(1, 0L).intValue())
                .build();
    }

    private List<ReviewImage> uploadReviewImages(Review review, List<MultipartFile> images) {
        List<ReviewImage> savedImages = new ArrayList<>();

        try {
            // Tạo thư mục nếu chưa có
            Path uploadDir = Paths.get(REVIEW_IMAGES_DIR);
            if (!Files.exists(uploadDir)) {
                Files.createDirectories(uploadDir);
            }

            for (MultipartFile file : images) {
                if (file != null && !file.isEmpty()) {
                    // Tạo tên file unique
                    String originalFilename = file.getOriginalFilename();
                    String extension = originalFilename != null && originalFilename.contains(".")
                            ? originalFilename.substring(originalFilename.lastIndexOf("."))
                            : ".jpg";
                    String newFilename = UUID.randomUUID().toString() + extension;

                    // Lưu file
                    Path filePath = uploadDir.resolve(newFilename);
                    Files.copy(file.getInputStream(), filePath);

                    // Tạo record trong database
                    ReviewImage reviewImage = ReviewImage.builder()
                            .review(review)
                            .imageUrl("/images/reviews/" + newFilename)
                            .altText("Review image")
                            .build();

                    savedImages.add(reviewImageRepository.save(reviewImage));
                }
            }
        } catch (IOException e) {
            log.error("Error uploading review images: {}", e.getMessage());
        }

        return savedImages;
    }
}
