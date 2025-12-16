package com.example.online_shoe_store.dto.request;

import com.example.online_shoe_store.Entity.enums.StatisticType;
import com.example.online_shoe_store.Entity.enums.StatisticUnit;
import lombok.Data;

import java.time.LocalDate;
import java.time.LocalDateTime;

public record StatisticFilterRequest(
        LocalDate fromDate,
        LocalDate toDate,
        StatisticUnit unit,    // DAY / MONTH / YEAR
        StatisticType type     // REVENUE / ORDER / PRODUCT
) {}
