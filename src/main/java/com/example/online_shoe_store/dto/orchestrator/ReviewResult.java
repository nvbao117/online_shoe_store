package com.example.online_shoe_store.dto.orchestrator;

import dev.langchain4j.model.output.structured.Description;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;

/**
 * Kết quả từ Reviewer phase - đánh giá và feedback cho draft response
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ReviewResult {

    //=========================================
    // CORE REVIEW
    //=========================================

    @Description("TRUE = response đạt chuẩn, có thể gửi cho user. FALSE = cần sửa lại.")
    @Builder.Default
    private boolean passed = false;

    @Description("Điểm chất lượng 1-10. 1-3: kém | 4-6: trung bình | 7-8: tốt | 9-10: xuất sắc")
    private Integer qualityScore;

    //=========================================
    // FEEDBACK DETAILS
    //=========================================

    @Description("Danh sách vấn đề cụ thể. VD: ['Sai giá sản phẩm', 'Thiếu thông tin size', 'Giọng điệu không thân thiện']")
    @Builder.Default
    private List<String> issues = new ArrayList<>();

    @Description("Gợi ý cải thiện. VD: ['Thêm giá chính xác', 'Dùng emoji thân thiện hơn', 'Bổ sung link sản phẩm']")
    @Builder.Default
    private List<String> improvements = new ArrayList<>();

    @Description("Feedback tổng hợp 1-2 câu để Writer sửa. VD: 'Cần sửa lại giá và thêm thông tin tồn kho'")
    private String revisionFeedback;

    //=========================================
    // METADATA (không cần LLM generate)
    //=========================================

    private Integer reviewAttempt;

    private Integer tokensUsed;

    private Long processingTimeMs;

    // Kiemtra co can revision ko
    public boolean needsRevision() {
        return !passed && issues != null && !issues.isEmpty();
    }

    // kiem tra quality score co dat threshold ko 
    public boolean meetsQualityThreshold(int threshold) {
        return qualityScore != null && qualityScore >= threshold;
    }
}