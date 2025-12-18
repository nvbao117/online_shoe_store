package com.example.online_shoe_store.dto.orchestrator;

import com.example.online_shoe_store.Entity.enums.AgentType;
import com.example.online_shoe_store.Entity.enums.RiskLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;

/**
 * Cấu hình routing cho mỗi intent type
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class RoutingConfig {
    //agent xu ly intent nay
    private AgentType primary;

    // danh sach cac agents phu
    @Builder.Default
    private List<AgentType> secondary = new ArrayList<>();

    // Co the chay song song ko ? 
    @Builder.Default
    private boolean parallel = true;

    // A2A flow
    private String a2aFlow;

    // muc do rui ro
    @Builder.Default
    private RiskLevel riskLevel = RiskLevel.LOW;

    // can escalation ko
    @Builder.Default
    private boolean requiresEscalation = false;

    // can human review ko
    @Builder.Default
    private boolean requiresHumanReview = false;
}