package com.example.online_shoe_store.dto.orchestrator;

import com.example.online_shoe_store.Entity.enums.IntentType;
import com.example.online_shoe_store.Entity.enums.RiskLevel;
import com.example.online_shoe_store.Entity.enums.UrgencyLevel;
import dev.langchain4j.model.output.structured.Description;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;

/**
 * Kết quả từ Intent Classification Module
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class IntentClassificationResult {
    //=========================================
    // INTENT DETECTION 
    //=========================================

    @Description("Intent chính của user. Enum: SEARCH, PURCHASE, RECOMMENDATION, SUPPORT, COMPLAINT, TRACK_ORDER, REFUND, RETURN, SIZE_ADVICE, STOCK_CHECK, PRICE_CHECK, FEEDBACK, GREETING, UNKNOWN")
    private IntentType primaryIntent;

    @Description("Danh sách các intent phụ (List of Enum Names). CHỈ chứa Strings, KHÔNG chứa Objects. VD: ['PRICE_CHECK', 'SEARCH']")
    @Builder.Default
    private List<IntentType> secondaryIntents = new ArrayList<>();
    //=========================================
    // ENTITIES
    //=========================================

    @Description("Thông tin trích xuất từ tin nhắn: brand, size, color, budget, orderId... Để null nếu không tìm thấy.")
    private ExtractedEntities entities;

    //=========================================
    // ASSESSMENT
    //=========================================

    @Description("Độ tin cậy phân loại (0.0-1.0). >=0.8: chắc chắn, 0.5-0.8: tương đối, <0.5: không chắc")
    private Double confidence;

    @Description("Mức khẩn cấp. LOW: xem chơi | NORMAL: hỏi thông tin | HIGH: mua/khiếu nại | CRITICAL: giận dữ/đe dọa")
    private UrgencyLevel urgency;

    @Description("Mức rủi ro.")
    private RiskLevel riskLevel;

    @Description("Giải thích ngắn gọn tại sao chọn intent này. VD: 'User hỏi giá nên là PRICE_CHECK'")
    private String reasoning;

    //=========================================
    // METADATA (không cần LLM generate)
    //=========================================

    private Integer thinkingTokensUsed;

    private Long processingTimeMs;

    //==========================
    // HELPER METHODS
    //===========================

    public boolean isHighConfidence() {
        return confidence != null && confidence > 0;
    }

    // Kiem tra secondary intents ko
    public boolean hasSecondaryIntents(){
        return secondaryIntents != null && !secondaryIntents.isEmpty();
    }

    /**
     * Kiểm tra intent có cần escalation không
     */
    public boolean needsEscalation() {
        return primaryIntent != null && primaryIntent.requiresEscalation();
    }

    /**
     * Kiểm tra có phải high priority không
     */
    public boolean isHighPriority() {
        return (urgency != null && urgency.needsPriority()) ||
                (primaryIntent != null && primaryIntent.isHighPriority());
    }
}