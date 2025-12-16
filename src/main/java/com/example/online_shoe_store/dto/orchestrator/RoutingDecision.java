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

    @Description("Tên agent cần gọi: SEARCH, SALES, RECOMMEND, CART, SUPPORT, LOGISTICS, INVENTORY, MARKETING")
    private String targetAgent;

    //=========================================
    // AGENT ASSIGNMENT
    //=========================================

    @Description("Agent chính xử lý. VD: SEARCH, SALES, SUPPORT, RECOMMEND, CART, LOGISTICS, INVENTORY, MARKETING")
    private String primaryAgent;

    @Description("Agents phụ hỗ trợ. VD: ['INVENTORY'] nếu cần check kho")
    @Builder.Default
    private List<String> secondaryAgents = new ArrayList<>();

    //=========================================
    // EXECUTION MODE
    //=========================================

    @Description("TRUE = agents chạy song song (nhanh hơn). FALSE = chạy tuần tự (có dependency)")
    @Builder.Default
    private Boolean parallel = false;

    @Description("Độ ưu tiên 1-10. 1-3: thấp | 4-6: bình thường | 7-8: cao | 9-10: khẩn cấp")
    @Builder.Default
    private Integer priority = 5;

    //=========================================
    // AGENT-TO-AGENT (A2A)
    //=========================================

    @Description("TRUE nếu primary agent cần kết quả từ secondary agent trước khi trả lời")
    @Builder.Default
    private Boolean requiresA2A = false;

    @Description("Mô tả luồng A2A. VD: 'SALES chờ INVENTORY check tồn kho trước khi báo giá'")
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