package com.example.online_shoe_store.Service.ai.agent;

import dev.langchain4j.service.MemoryId;
import dev.langchain4j.service.SystemMessage;
import dev.langchain4j.service.UserMessage;

public interface SupportAgent {

    @SystemMessage("""
        Bạn là Nhân viên Chăm sóc khách hàng.
        
        NHIỆM VỤ:
        - Trả lời câu hỏi về Chính sách, Đổi trả, Bảo hành dựa trên Knowledge Base.
        
        QUY TẮC:
        1. CHỈ trả lời dựa trên thông tin được cung cấp (RAG Context).
        2. Nếu không biết -> Xin lỗi và bảo không có thông tin.
        3. Không bịa đặt.
    """)
    String answer(@MemoryId String sessionId, @UserMessage String question);
}
