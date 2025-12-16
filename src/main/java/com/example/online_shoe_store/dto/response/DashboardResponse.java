package com.example.online_shoe_store.dto.response;

import com.example.online_shoe_store.dto.projection.DashboardSummaryDTO;
import com.example.online_shoe_store.dto.projection.ProductStatDTO;

import java.util.List;

public record DashboardResponse(
        DashboardSummaryDTO summary,
        List<ProductStatDTO> topSelling,
        List<ProductStatDTO> topSlow
) {}