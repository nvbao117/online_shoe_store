package com.example.online_shoe_store.Entity.enums;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

/**
 * Mức độ rủi ro của thao tác
 */
@Getter
@RequiredArgsConstructor
public enum RiskLevel {
    LOW("Thao tác thông thường, không cần xác nhận"),
    MEDIUM("Cần xác nhận từ user"),
    HIGH("Cần human review hoặc escalation");
    private final String description;
    public boolean needsHumanReview() {
        return this == HIGH;
    }
    public boolean needsConfirmation() {
        return this == MEDIUM || this == HIGH;
    }
}
