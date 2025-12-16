package com.example.online_shoe_store.Controller;

import com.example.online_shoe_store.Entity.enums.StatisticType;
import com.example.online_shoe_store.Repository.DashboardRepository;
import com.example.online_shoe_store.dto.request.StatisticFilterRequest;
import com.example.online_shoe_store.dto.response.StatisticResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.YearMonth;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class StatisticService {

    private final DashboardRepository repo;

    public StatisticResponse getStatistics(StatisticFilterRequest req) {

        String format;
        List<LocalDate> allDates = new ArrayList<>();

        switch (req.unit()) {
            case DAY -> {
                format = "%d/%m/%Y";
                LocalDate date = req.fromDate();
                while (!date.isAfter(req.toDate())) {
                    allDates.add(date);
                    date = date.plusDays(1);
                }
            }
            case MONTH -> {
                format = "%m/%Y";
                YearMonth start = YearMonth.from(req.fromDate());
                YearMonth end = YearMonth.from(req.toDate());
                while (!start.isAfter(end)) {
                    allDates.add(start.atDay(1));
                    start = start.plusMonths(1);
                }
            }
            case YEAR -> {
                format = "%Y";
                int start = req.fromDate().getYear();
                int end = req.toDate().getYear();
                for (int y = start; y <= end; y++) {
                    allDates.add(LocalDate.of(y, 1, 1));
                }
            }
            default -> throw new IllegalArgumentException("Unknown unit");
        }

        // Chuyển LocalDate sang LocalDateTime để repo không lỗi
        LocalDateTime fromDateTime = req.fromDate().atStartOfDay();
        LocalDateTime toDateTime = req.toDate().atTime(23, 59, 59);

        // Lấy dữ liệu từ DB
        List<Object[]> rawData;
        if (req.type() == StatisticType.REVENUE) {
            rawData = repo.revenueByPeriod(fromDateTime, toDateTime, format);
        } else if (req.type() == StatisticType.ORDER) {
            rawData = repo.ordersByPeriod(fromDateTime, toDateTime, format);
        } else {
            rawData = repo.productsByPeriod(fromDateTime, toDateTime, format);
        }

        // Map data
        Map<String, Long> dataMap = rawData.stream()
                .collect(Collectors.toMap(
                        r -> r[0].toString(),
                        r -> ((Number) r[1]).longValue()
                ));

        List<String> labels = new ArrayList<>();
        List<Long> values = new ArrayList<>();

        DateTimeFormatter formatter;
        switch (req.unit()) {
            case DAY -> formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
            case MONTH -> formatter = DateTimeFormatter.ofPattern("MM/yyyy");
            case YEAR -> formatter = DateTimeFormatter.ofPattern("yyyy");
            default -> throw new IllegalArgumentException("Unknown unit");
        }

        for (LocalDate d : allDates) {
            String label = d.format(formatter);
            labels.add(label);
            values.add(dataMap.getOrDefault(label, 0L));
        }

        return new StatisticResponse(labels, values);
    }
}
