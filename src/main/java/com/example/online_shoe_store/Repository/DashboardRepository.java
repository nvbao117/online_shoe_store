package com.example.online_shoe_store.Repository;

import com.example.online_shoe_store.Entity.Order;
import com.example.online_shoe_store.dto.projection.DashboardSummaryDTO;
import com.example.online_shoe_store.dto.projection.ProductStatDTO;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;

@Repository
public interface DashboardRepository extends JpaRepository<Order, String> {

    // ===== SUMMARY =====
    @Query(value = """
        SELECT
            COUNT(DISTINCT o.order_id)      AS totalOrders,
            COALESCE(SUM(o.total_amount),0) AS revenue,
            COALESCE(SUM(oi.quantity),0)    AS totalProducts
        FROM orders o
        JOIN order_items oi ON o.order_id = oi.order_id
        WHERE o.status = 'COMPLETED'
          AND o.created_at BETWEEN :from AND :to
    """, nativeQuery = true)
    DashboardSummaryDTO getSummary(
            @Param("from") LocalDate from,
            @Param("to") LocalDate to
    );

    // ===== TOP BÁN CHẠY =====
    @Query(value = """
        SELECT
            pv.variant_id    AS variantId,
            p.name           AS productName,
            SUM(oi.quantity) AS totalSold
        FROM orders o
        JOIN order_items oi ON o.order_id = oi.order_id
        JOIN product_variants pv ON oi.variant_id = pv.variant_id
        JOIN products p ON pv.product_id = p.product_id
        WHERE o.status = 'COMPLETED'
          AND o.created_at BETWEEN :from AND :to
        GROUP BY pv.variant_id, p.name
        ORDER BY totalSold DESC
        LIMIT :limit
    """, nativeQuery = true)
    List<ProductStatDTO> getTopSelling(
            @Param("from") LocalDate from,
            @Param("to") LocalDate to,
            @Param("limit") int limit
    );

    // ===== TOP BÁN Ế =====
    @Query(value = """
        SELECT
            pv.variant_id    AS variantId,
            p.name           AS productName,
            COALESCE(SUM(oi.quantity),0) AS totalSold
        FROM product_variants pv
        JOIN products p ON pv.product_id = p.product_id
        LEFT JOIN order_items oi ON oi.variant_id = pv.variant_id
        LEFT JOIN orders o ON o.order_id = oi.order_id
            AND o.status = 'COMPLETED'
            AND o.created_at BETWEEN :from AND :to
        GROUP BY pv.variant_id, p.name
        ORDER BY totalSold ASC
        LIMIT :limit
    """, nativeQuery = true)
    List<ProductStatDTO> getTopSlow(
            @Param("from") LocalDate from,
            @Param("to") LocalDate to,
            @Param("limit") int limit
    );
}


