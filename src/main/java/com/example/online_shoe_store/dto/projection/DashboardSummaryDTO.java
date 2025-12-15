package com.example.online_shoe_store.dto.projection;

import java.math.BigDecimal;

public interface DashboardSummaryDTO {

    Long getTotalOrders();
    BigDecimal getRevenue();
    Long getTotalProducts();
}
