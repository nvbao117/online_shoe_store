package com.example.online_shoe_store.Controller;

import com.example.online_shoe_store.Service.DashboardService;
import com.example.online_shoe_store.dto.response.DashboardResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDate;

@RestController
@RequestMapping("/api/dashboard")
@RequiredArgsConstructor
public class DashboardController {

    private final DashboardService service;

    @GetMapping
    public DashboardResponse dashboard(
            @RequestParam LocalDate from,
            @RequestParam LocalDate to
    ) {
        return service.getDashboard(from, to);
    }
}
