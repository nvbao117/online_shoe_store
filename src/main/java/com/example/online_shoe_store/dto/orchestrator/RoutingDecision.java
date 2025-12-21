package com.example.online_shoe_store.dto.orchestrator;

import com.example.online_shoe_store.Entity.enums.RiskLevel;
import dev.langchain4j.model.output.structured.Description;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;

/**
 * Quyết định routing từ Routing Module
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class RoutingDecision {

    //=========================================
    // DIRECT RESPONSE (khi không cần gọi agent)
    //=========================================

    @Description("Phản hồi trực tiếp từ Orchestrator. Dùng khi: chào hỏi, thiếu thông tin, không cần agent.")
    private String directResponse;

    @Description("Agent cần gọi: PRODUCT hoặc SUPPORT. PRODUCT=tìm/tư vấn sản phẩm. SUPPORT=FAQ/đổi trả/khiếu nại.")
    private String targetAgent;

    //=========================================
    // DEPRECATED - KHÔNG SỬ DỤNG
    //=========================================

    @Description("DEPRECATED - Không sử dụng. Luôn để null.")
    private String primaryAgent;

    @Description("DEPRECATED - Không sử dụng. Luôn để rỗng [].")
    @Builder.Default
    private List<String> secondaryAgents = new ArrayList<>();

    //=========================================
    // EXECUTION MODE
    //=========================================

    @Description("DEPRECATED - Không sử dụng. Luôn để false.")
    @Builder.Default
    private Boolean parallel = false;

    @Description("Độ ưu tiên 1-10. Mặc định 5.")
    @Builder.Default
    private Integer priority = 5;

    //=========================================
    // DEPRECATED - A2A KHÔNG SỬ DỤNG
    //=========================================

    @Description("DEPRECATED - Không sử dụng. Luôn để false.")
    @Builder.Default
    private Boolean requiresA2A = false;

    @Description("DEPRECATED - Không sử dụng. Luôn để null.")
    private String a2aFlow;

    //=========================================
    // RISK ASSESSMENT
    //=========================================

    @Description("Mức rủi ro. LOW| MEDIUM| HIGH")
    @Builder.Default
    private RiskLevel riskLevel = RiskLevel.LOW;

    @Description("Lý do rủi ro cao. VD: 'Khách yêu cầu hoàn tiền 5 triệu'")
    private String riskReason;

    //=========================================
    // ESCALATION
    //=========================================

    @Description("TRUE = chuyển cho nhân viên thật xử lý (AI không đủ khả năng hoặc khách yêu cầu)")
    @Builder.Default
    private Boolean requiresEscalation = false;

    @Description("Lý do escalation. VD: 'Khách dọa báo cáo', 'Yêu cầu ngoài phạm vi AI'")
    private String escalationReason;

    @Description("TRUE = AI có draft nhưng cần nhân viên duyệt trước khi gửi (sensitive case)")
    @Builder.Default
    private Boolean requiresHumanReview = false;

    public Boolean hasSecondaryAgents() {
        return secondaryAgents != null && !secondaryAgents.isEmpty();
    }

    public List<String> getAllAgents() {
        List<String> all = new ArrayList<>();
        if (primaryAgent != null && !primaryAgent.isBlank()) {
            all.add(primaryAgent);
        }
        if (secondaryAgents != null) {
            all.addAll(secondaryAgents);
        }
        return all;
    }

    /**
     * Kiểm tra có phải high risk không
     */
    public Boolean isHighRisk() {
        return riskLevel == RiskLevel.HIGH;
    }
}