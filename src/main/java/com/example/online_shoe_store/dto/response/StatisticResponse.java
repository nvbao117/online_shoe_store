package com.example.online_shoe_store.dto.response;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.util.List;
public record StatisticResponse(
        List<String> labels,
        List<Long> values
) {}
