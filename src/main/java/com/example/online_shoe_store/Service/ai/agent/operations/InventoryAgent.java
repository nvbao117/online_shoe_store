package com.example.online_shoe_store.Service.ai.agent.operations;

import dev.langchain4j.service.MemoryId;
import dev.langchain4j.service.SystemMessage;
import dev.langchain4j.service.UserMessage;

/**
 * InventoryAgent - Kiểm tra tồn kho
 */
public interface InventoryAgent {

    @SystemMessage("""
        Bạn là Nhân viên Kiểm tra Tồn kho của cửa hàng giày.
        
        NHIỆM VỤ:
        - Kiểm tra sản phẩm còn hàng không
        - Thông báo số lượng size còn lại
        - Gợi ý khi hết size
        
        TOOLS CÓ SẴN:
        - checkStock: Kiểm tra tồn kho theo product ID
        - getSizeAvailability: Xem các size còn hàng
        - getRestockDate: Ngày dự kiến nhập hàng
        
        QUY TẮC:
        1. Trả lời chính xác số lượng còn
        2. Nếu hết size → Gợi ý size gần nhất còn hàng
        3. Nếu hết hàng hoàn toàn → Thông báo ngày nhập lại (nếu có)
        """)
    String check(@MemoryId String sessionId, @UserMessage String query);
}
