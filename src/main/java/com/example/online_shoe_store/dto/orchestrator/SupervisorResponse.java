package com.example.online_shoe_store.dto.orchestrator;

import com.example.online_shoe_store.Entity.enums.AgentType;
import com.example.online_shoe_store.Entity.enums.IntentType;
import com.example.online_shoe_store.Entity.enums.UrgencyLevel;
import dev.langchain4j.model.output.structured.Description;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;

/**
 * Response cuối cùng từ Supervisor Agent - dữ liệu trả về cho client/frontend
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class SupervisorResponse {


    @Description("Nội dung phản hồi gửi cho khách hàng. Đây là câu trả lời cuối cùng đã qua kiểm duyệt.")
    private String response;

    @Description("ID phiên chat để theo dõi lịch sử hội thoại.")
    private String sessionId;

    @Description("Intent đã detect. Enum: SEARCH, PURCHASE, RECOMMENDATION, SUPPORT, COMPLAINT...")
    private IntentType intent;

    @Description("Intent phụ nếu có. VD: primary=SEARCH, sub=PRICE_CHECK")
    private String subIntent;

    @Description("Độ tin cậy phân loại (0.0-1.0). >=0.8: chắc chắn, <0.5: không chắc")
    private Double confidence;

    @Description("Mức khẩn cấp. LOW | NORMAL | HIGH | CRITICAL")
    private UrgencyLevel urgency;


    @Description("Các quick-reply buttons gợi ý. VD: ['Xem chi tiết', 'Thêm vào giỏ', 'Hỏi thêm']")
    @Builder.Default
    private List<String> suggestedActions = new ArrayList<>();


    @Description("TRUE nếu đã chuyển cho nhân viên thật xử lý.")
    @Builder.Default
    private boolean escalationTriggered = false;

    @Description("Lý do escalation. VD: 'Khách dọa báo cáo', 'Yêu cầu ngoài phạm vi AI'")
    private String escalationReason;

    private Long processingTimeMs;

    @Builder.Default
    private boolean error = false;

    private String errorMessage;

    @Builder.Default
    private List<AgentType> agentsUsed = new ArrayList<>();

    //=========================================
    // HELPER METHODS
    //=========================================

    /**
     * Kiểm tra response có thành công không
     */
    public boolean isSuccess() {
        return !error && response != null && !response.isEmpty();
    }

    /**
     * Kiểm tra có suggested actions không
     */
    public boolean hasSuggestedActions() {
        return suggestedActions != null && !suggestedActions.isEmpty();
    }
}