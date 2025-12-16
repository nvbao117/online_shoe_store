package com.example.online_shoe_store.dto.projection;

import java.math.BigDecimal;

public interface DashboardSummaryDTO {

    Long getTotalOrders();
    BigDecimal getRevenue();
    Long getTotalProducts();
// biểu đồ trạng thái đơn hàng
    Long getNewOrders();        // NEW
    Long getProcessingOrders(); // PROCESSING
    Long getCompletedOrders();  // COMPLETED
    Long getCancelledOrders();  // CANCELLED
    Long getReturnedOrders();   // RETURNED
}
