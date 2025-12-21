package com.example.online_shoe_store.Entity.enums;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

/**
 * Mức độ khẩn cấp của request
 */
@Getter
@RequiredArgsConstructor
public enum UrgencyLevel {
    LOW(1, "Không gấp"),
    NORMAL(2, "Bình thường"),
    HIGH(3, "Khẩn cấp"),
    CRITICAL(4, "Rất khẩn cấp - cần xử lý ngay");

    private final int priority;
    private final String description;

    public static UrgencyLevel fromString(String value) {
        if (value == null) return NORMAL;
        try {
            return valueOf(value.toUpperCase());
        } catch (IllegalArgumentException e) {
            return NORMAL;
        }
    }
    public boolean needsPriority() {
        return this == HIGH || this == CRITICAL;

    }
}