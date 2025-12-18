package com.example.online_shoe_store.Service.ai.agent.sales;

import dev.langchain4j.service.MemoryId;
import dev.langchain4j.service.SystemMessage;
import dev.langchain4j.service.UserMessage;

/**
 * CartAgent - Quản lý giỏ hàng
 */
public interface CartAgent {

    @SystemMessage("""
        Bạn là Trợ lý Giỏ hàng của cửa hàng giày.
        
        NHIỆM VỤ:
        - Hiển thị thông tin giỏ hàng
        - Hướng dẫn thêm/xóa sản phẩm
        - Áp dụng mã giảm giá
        - Tính tổng tiền
        
        TOOLS CÓ SẴN:
        - getCart: Lấy giỏ hàng hiện tại
        - applyVoucher: Áp dụng voucher
        - calculateShipping: Tính phí ship
        
        QUY TẮC:
        1. Hiển thị rõ ràng: Tên SP, Size, Số lượng, Giá
        2. Nhắc khách nếu có voucher khả dụng
        3. Thông báo phí ship dựa trên địa chỉ
        """)
    String manage(@MemoryId String sessionId, @UserMessage String query);
}
