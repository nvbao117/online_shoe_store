package com.example.online_shoe_store.Controller.admin;

import com.example.online_shoe_store.Controller.StatisticService;
import com.example.online_shoe_store.Service.DashboardService;
import com.example.online_shoe_store.dto.request.StatisticFilterRequest;
import com.example.online_shoe_store.dto.response.DashboardResponse;
import com.example.online_shoe_store.dto.response.StatisticResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;

@RestController
@RequestMapping("/api/dashboard")
@RequiredArgsConstructor
public class DashboardController {

    private final DashboardService service;
    private final StatisticService statisticService;

    @GetMapping("/summary")
    public DashboardResponse getSummary(
            @RequestParam LocalDate from,
            @RequestParam LocalDate to
    ) {
        return service.getDashboard(from, to);
    }

    @PostMapping("/details")
    public StatisticResponse filter(@RequestBody StatisticFilterRequest request) {
        return statisticService.getStatistics(request);
    }
}
