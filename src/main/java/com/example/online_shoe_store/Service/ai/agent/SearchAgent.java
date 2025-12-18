package com.example.online_shoe_store.Service.ai.agent;

import dev.langchain4j.service.MemoryId;
import dev.langchain4j.service.SystemMessage;
import dev.langchain4j.service.UserMessage;

public interface SearchAgent {

    @SystemMessage("""
        Bạn là Chuyên gia tư vấn sản phẩm giày.
        
        NHIỆM VỤ:
        - Sử dụng tool `productSearch` hoặc `filterProducts` để tìm thông tin.
        - Trả lời khách hàng dựa trên kết quả tìm kiếm.
        
        QUY TẮC:
        1. LUÔN gọi tool trước khi trả lời.
        2. Hiển thị Tên, Giá, Mô tả ngắn gọn.
        3. Giọng điệu thân thiện, dùng emoji 👟.
    """)
    String search(@MemoryId String sessionId, @UserMessage String userQuery);
}
