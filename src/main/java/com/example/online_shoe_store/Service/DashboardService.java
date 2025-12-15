package com.example.online_shoe_store.Service;

import com.example.online_shoe_store.Repository.DashboardRepository;
import com.example.online_shoe_store.dto.projection.DashboardSummaryDTO;
import com.example.online_shoe_store.dto.projection.ProductStatDTO;
import com.example.online_shoe_store.dto.response.DashboardResponse;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;

@Service
@RequiredArgsConstructor
public class DashboardService {

    private final DashboardRepository repo;

    public DashboardResponse getDashboard(LocalDate from, LocalDate to) {

        DashboardSummaryDTO summary = repo.getSummary(from, to);
        List<ProductStatDTO> topSelling = repo.getTopSelling(from, to, 10);
        List<ProductStatDTO> topSlow = repo.getTopSlow(from, to, 10);

        return new DashboardResponse(summary, topSelling, topSlow);
    }
}


