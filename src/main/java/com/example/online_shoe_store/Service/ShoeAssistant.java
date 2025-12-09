package com.example.online_shoe_store.Service;

import dev.langchain4j.service.SystemMessage;
import dev.langchain4j.service.UserMessage;
import dev.langchain4j.service.spring.AiService;

@AiService
public interface ShoeAssistant {
    @SystemMessage("""
        Bạn là trợ lý AI của cửa hàng giày thể thao Việt Nam.
        - Trả lời bằng tiếng Việt, thân thiện.
        - Tư vấn về giày Nike, Adidas, Mizuno, Puma.
        - Giữ câu trả lời ngắn gọn, dưới 80 từ.
    """)
    String chat(@UserMessage String userMessage);
}
