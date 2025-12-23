package com.example.online_shoe_store.Repository;

import com.example.online_shoe_store.Entity.ProductVariant;
import com.example.online_shoe_store.Entity.Review;
import com.example.online_shoe_store.Entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ReviewRepository extends JpaRepository<Review, String> {
    /**
     * Lấy danh sách đánh giá của user, sắp xếp theo ngày mới nhất
     */
    @Query("SELECT DISTINCT r FROM Review r LEFT JOIN FETCH r.reviewImages WHERE r.user = :user ORDER BY r.reviewDate DESC")
    List<Review> findByUserOrderByReviewDateDesc(@Param("user") User user);

    /**
     * Kiểm tra user đã đánh giá variant này chưa
     */
    boolean existsByUserAndProductVariant(User user, ProductVariant productVariant);

    /**
     * Lấy danh sách đánh giá của sản phẩm variant
     */
    @Query("SELECT DISTINCT r FROM Review r LEFT JOIN FETCH r.reviewImages WHERE r.productVariant = :variant ORDER BY r.reviewDate DESC")
    List<Review> findByProductVariantOrderByReviewDateDesc(@Param("variant") ProductVariant productVariant);

    /**
     * Lấy tất cả đánh giá của sản phẩm (qua tất cả variants)
     */
    @Query("SELECT DISTINCT r FROM Review r LEFT JOIN FETCH r.reviewImages WHERE r.productVariant.product.productId = :productId ORDER BY r.reviewDate DESC")
    List<Review> findByProductIdOrderByReviewDateDesc(@Param("productId") String productId);

    /**
     * Lấy đánh giá theo rating cho sản phẩm
     */
    @Query("SELECT DISTINCT r FROM Review r LEFT JOIN FETCH r.reviewImages WHERE r.productVariant.product.productId = :productId AND r.rating = :rating ORDER BY r.reviewDate DESC")
    List<Review> findByProductIdAndRatingOrderByReviewDateDesc(@Param("productId") String productId,
            @Param("rating") Integer rating);

    /**
     * Đếm số lượng đánh giá theo từng mức rating
     */
    @Query("SELECT r.rating, COUNT(r) FROM Review r WHERE r.productVariant.product.productId = :productId GROUP BY r.rating")
    List<Object[]> countByProductIdGroupByRating(@Param("productId") String productId);

    /**
     * Lấy danh sách đánh giá theo userId (cho admin)
     */
    @Query("SELECT DISTINCT r FROM Review r LEFT JOIN FETCH r.reviewImages WHERE r.user.userId = :userId ORDER BY r.reviewDate DESC")
    List<Review> findByUserIdOrderByReviewDateDesc(@Param("userId") String userId);

}
