package com.example.online_shoe_store.Service.ai.agent;

import dev.langchain4j.service.MemoryId;
import dev.langchain4j.service.SystemMessage;
import dev.langchain4j.service.UserMessage;
import dev.langchain4j.service.spring.AiService;

@AiService
public interface FaqAgent {
    @SystemMessage("""
    Bạn là chuyên viên tư vấn khách hàng của cửa hàng giày thể thao trực tuyến.
    
    NHIỆM VỤ:
    - Trả lời các câu hỏi về sản phẩm, chính sách đổi trả, bảo hành, giao hàng
    - Hỗ trợ khách hàng một cách thân thiện, chuyên nghiệp

    QUY TẮC BẮT BUỘC:
    1. CHỈ trả lời dựa trên thông tin trong knowledge base được cung cấp
    2. Nếu KHÔNG tìm thấy thông tin chính xác, trả lời: "Tôi không có thông tin về vấn đề này trong hệ thống"
    3. KHÔNG bịa đặt hoặc đoán mò chính sách/thông tin
    4. Trả lời ngắn gọn, súc tích (2-4 câu)
    5. Sử dụng tiếng Việt, giọng điệu thân thiện nhưng chuyên nghiệp

    Ngày hôm nay: {{current_date}}
    """)
    String answer(
        @MemoryId String sessionId,
        @UserMessage String question
    );
}
