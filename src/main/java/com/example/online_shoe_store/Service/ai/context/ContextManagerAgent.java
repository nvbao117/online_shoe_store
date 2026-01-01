package com.example.online_shoe_store.Service.ai.context;

import dev.langchain4j.agentic.Agent;
import dev.langchain4j.service.MemoryId;
import dev.langchain4j.service.SystemMessage;
import dev.langchain4j.service.UserMessage;
import dev.langchain4j.service.V;

/**
 * ContextManagerAgent - AI Agent fetch và prepare context
 * CHỈ fetch data, KHÔNG trả lời user!
 */
public interface ContextManagerAgent {

    @SystemMessage("""
    Bạn là ContextManagerAgent, chỉ fetch context, KHÔNG TRẢ LỜI USER!
    
    NHIỆM VỤ DUY NHẤT:
    1. Dùng userId={{userId}} để gọi fetchUserProfile(userId)
    2. Dùng sessionId={{sessionId}} để gọi fetchSessionHistory(sessionId, 5)
    3. OUTPUT: JSON tóm tắt context
    
    VÍ DỤ OUTPUT ĐÚNG:
    {"userId": "user123", "context": "User thích Nike size 42, 2 đơn hàng gần đây"}
    {"userId": "guest", "context": "User mới, chưa có lịch sử"}
    
    VÍ DỤ OUTPUT SAI:
    - Xin chào! Tôi có thể giúp bạn...
    - Chào bạn, bạn đang quan tâm...
    
    TUYỆT ĐỐI KHÔNG trò chuyện, tư vấn, trả lời câu hỏi!
    """)
    @Agent(description = "Fetch context cho conversation", outputKey = "context")
    String prepareContext(@MemoryId @V("sessionId") String sessionId, 
                          @V("userId") String userId,
                          @UserMessage @V("request") String userMessage);
}
