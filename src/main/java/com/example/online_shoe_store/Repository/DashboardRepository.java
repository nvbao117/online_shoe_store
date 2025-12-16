package com.example.online_shoe_store.Repository;

import com.example.online_shoe_store.Entity.Order;
import com.example.online_shoe_store.dto.projection.DashboardSummaryDTO;
import com.example.online_shoe_store.dto.projection.ProductStatDTO;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@Repository
public interface DashboardRepository extends JpaRepository<Order, String> {

    // ===== SUMMARY ===== co du doanh thu tong don sl sp
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

    // bieu do thong ke don hang theo trang thai
    @Query(value = """
    SELECT
        COUNT(o.id) AS totalOrders,
        COALESCE(SUM(o.total_amount), 0) AS revenue,
        COUNT(DISTINCT oi.product_id) AS totalProducts,

        SUM(CASE WHEN o.status IN ('DRAFT','PENDING','AWAITING_PAYMENT','PAYMENT_FAILED','CONFIRMED') THEN 1 ELSE 0 END) AS newOrders,
        SUM(CASE WHEN o.status IN ('PROCESSING','READY_FOR_SHIPMENT','SHIPPED','IN_TRANSIT','OUT_FOR_DELIVERY') THEN 1 ELSE 0 END) AS processingOrders,
        SUM(CASE WHEN o.status IN ('DELIVERED','COMPLETED') THEN 1 ELSE 0 END) AS completedOrders,
        SUM(CASE WHEN o.status IN ('CANCELLED','EXPIRED','FAILED') THEN 1 ELSE 0 END) AS cancelledOrders,
        SUM(CASE WHEN o.status LIKE 'RETURN%' OR o.status LIKE '%REFUND%' THEN 1 ELSE 0 END) AS returnedOrders

    FROM orders o
    LEFT JOIN order_items oi ON oi.order_id = o.id
    WHERE o.created_at BETWEEN :from AND :to
""", nativeQuery = true)
    DashboardSummaryDTO getDashboardSummary(
            @Param("from") LocalDate from,
            @Param("to") LocalDate to
    );


    // Bieu do thong ke donhang, sp da ban, doanh thu theo thoi gian
    @Query("""
SELECT FUNCTION('DATE_FORMAT', o.orderDate, :format), SUM(o.totalAmount)
FROM Order o
WHERE o.orderDate BETWEEN :from AND :to
GROUP BY FUNCTION('DATE_FORMAT', o.orderDate, :format)
ORDER BY MIN(o.orderDate)
""")
    List<Object[]> revenueByPeriod(
            @Param("from") LocalDateTime from,
            @Param("to") LocalDateTime to,
            @Param("format") String format // '%d/%m/%Y' | '%m/%Y' | '%Y'
    );

    @Query("""
SELECT FUNCTION('DATE_FORMAT', o.orderDate, :format), COUNT(o.orderId)
FROM Order o
WHERE o.orderDate BETWEEN :from AND :to
GROUP BY FUNCTION('DATE_FORMAT', o.orderDate, :format)
ORDER BY MIN(o.orderDate)
""")
    List<Object[]> ordersByPeriod(
            @Param("from") LocalDateTime from,
            @Param("to") LocalDateTime to,
            @Param("format") String format // '%d/%m/%Y' | '%m/%Y' | '%Y'
    );


    @Query("""
SELECT FUNCTION('DATE_FORMAT', o.orderDate, :format), SUM(oi.quantity)
FROM Order o
JOIN o.orderItems oi
WHERE o.orderDate BETWEEN :from AND :to
GROUP BY FUNCTION('DATE_FORMAT', o.orderDate, :format)
ORDER BY MIN(o.orderDate)
""")
    List<Object[]> productsByPeriod(
            @Param("from") LocalDateTime from,
            @Param("to") LocalDateTime to,
            @Param("format") String format // '%d/%m/%Y' | '%m/%Y' | '%Y'
    );




}


