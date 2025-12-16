package com.example.online_shoe_store.Repository;

import com.example.online_shoe_store.Entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;

@Repository
public interface ProductRepository extends JpaRepository<Product, String>, JpaSpecificationExecutor<Product> {

    Optional<Product> findByName(String name);

    @Query("""
                select distinct p
                from Product p
                left join fetch p.productVariants pv
                left join fetch p.brand b
                left join fetch p.category c
                where p.productId = :id
            """)
    Optional<Product> findDetailById(@Param("id") String id);

    List<Product> findByCategoryCategoryId(String categoryId);

    // --- SỬA CHO KHỚP VỚI ENTITY CỦA BẠN ---
    // 1. Dùng BigDecimal cho giá
    // 2. Bỏ lọc theo gender (vì Entity không có)
    @Query("SELECT p FROM Product p " +
            "WHERE (:keyword IS NULL OR LOWER(p.name) LIKE LOWER(CONCAT('%', :keyword, '%')) " +
            "OR LOWER(p.category.name) LIKE LOWER(CONCAT('%', :keyword, '%'))) " +
            "AND (:brand IS NULL OR LOWER(p.brand.name) LIKE LOWER(CONCAT('%', :brand, '%'))) " +
            "AND (:minPrice IS NULL OR p.price >= :minPrice) " +
            "AND (:maxPrice IS NULL OR p.price <= :maxPrice)")
    List<Product> searchProductsDynamic(@Param("keyword") String keyword,
            @Param("brand") String brand,
            @Param("minPrice") BigDecimal minPrice,
            @Param("maxPrice") BigDecimal maxPrice);

    List<Product> findByNameContainingIgnoreCase(String keyword);

    // Tìm sản phẩm bán chạy (Best Sellers)
    List<Product> findTop5ByStatusOrderBySoldCountDesc(com.example.online_shoe_store.Entity.enums.ProductStatus status);

    // Tìm sản phẩm mới nhất (New Arrivals)
    List<Product> findTop5ByStatusOrderByCreatedAtDesc(com.example.online_shoe_store.Entity.enums.ProductStatus status);
}