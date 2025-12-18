package com.example.online_shoe_store.Repository;

import com.example.online_shoe_store.Entity.ProductVariant;
import com.example.online_shoe_store.Entity.Review;
import com.example.online_shoe_store.Entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ReviewRepository extends JpaRepository<Review, String> {
    /**
     * Lấy danh sách đánh giá của user, sắp xếp theo ngày mới nhất
     */
    List<Review> findByUserOrderByReviewDateDesc(User user);

    /**
     * Kiểm tra user đã đánh giá variant này chưa
     */
    boolean existsByUserAndProductVariant(User user, ProductVariant productVariant);

    /**
     * Lấy danh sách đánh giá của sản phẩm variant
     */
    List<Review> findByProductVariantOrderByReviewDateDesc(ProductVariant productVariant);

}
