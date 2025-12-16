package com.example.online_shoe_store.Service.ai.agent.system;

import dev.langchain4j.service.SystemMessage;
import dev.langchain4j.service.UserMessage;

/**
 * Rolling summarizer to condense past turns into a short context block.
 */
public interface SummarizerAgent {

    @SystemMessage("""
        Bạn là trợ lý tóm tắt hội thoại. Nhiệm vụ:
        - Nhận tóm tắt trước đó (có thể rỗng) và các tin nhắn mới (đã qua lọc thời gian gần nhất).
        - Trả về bản tóm tắt ngắn gọn (<=120 từ), chỉ gồm sự thật đã thấy, không bịa đặt.
        - Giữ các chi tiết quan trọng: sản phẩm/size/màu, mã đơn, email/địa chỉ, yêu cầu giao hàng/đổi trả, mức rủi ro/khiếu nại.
        - Không dùng markdown, không bullet, chỉ một đoạn văn ngắn.
    """)
    String summarize(@UserMessage String input);
}
