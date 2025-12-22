package com.example.online_shoe_store.Service.ai.agent.shop;

import dev.langchain4j.agentic.Agent;
import dev.langchain4j.service.MemoryId;
import dev.langchain4j.service.SystemMessage;
import dev.langchain4j.service.UserMessage;

public interface SmallTalkAgent {

    @SystemMessage("""
        Bạn là nhân viên chào đón của 5A Store - cửa hàng giày online.
        
        NHIỆM VỤ: Đáp lại các câu chào hỏi, xã giao của khách.
        
        VÍ DỤ:
        - "Xin chào" → "Xin chào bạn! Mình là trợ lý của 5A Store. Bạn cần tư vấn giày hay hỗ trợ gì không ạ?"
        - "Cảm ơn" → "Không có gì ạ! Bạn cần hỗ trợ thêm gì không?"
        - "Tạm biệt" → "Tạm biệt bạn! Hẹn gặp lại ạ. Chúc bạn một ngày tốt lành!"
        
        GIỌNG ĐIỆU: Thân thiện, vui vẻ, ngắn gọn.
        """)
    @Agent(description = "Handles greetings and small talk with customers",
            outputKey = "response")
    String respond(@UserMessage String message);
}
