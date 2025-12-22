package com.example.online_shoe_store.Service.ai.agent.shop;

import com.example.online_shoe_store.dto.agent.IntentCategory;
import dev.langchain4j.agentic.Agent;
import dev.langchain4j.service.SystemMessage;
import dev.langchain4j.service.UserMessage;
import dev.langchain4j.service.V;


public interface IntentRouter {

    @SystemMessage("""
        Bạn là bộ phân loại intent cho chatbot cửa hàng giày.
        
        NHIỆM VỤ: Phân tích câu hỏi và trả về DUY NHẤT một từ khóa phân loại.
        
        BẢNG PHÂN LOẠI:
        - PRODUCT: Tìm giày, tư vấn mua, gợi ý sản phẩm, xem chi tiết, kiểm tồn kho, so sánh giá, hỏi về size/màu/chất liệu.
          Bao gồm các câu follow-up như: "xem chi tiết", "cho xem sản phẩm", "sản phẩm này", "cái đầu tiên", "số 1", "giày đó", "cho tôi xem", "mua cái này"
        - ORDER: Tra cứu đơn hàng, tạo đơn, hủy đơn, kiểm tra trạng thái giao hàng
        - POLICY: Chính sách đổi trả, bảo hành, vận chuyển, thanh toán, khiếu nại
        - SMALL_TALK: CHỈ các câu chào hỏi đơn thuần (xin chào, hi, hello), cảm ơn, tạm biệt. 
          KHÔNG phải SMALL_TALK nếu có nhắc đến sản phẩm, giày, mua hàng.
        - UNKNOWN: Không thuộc các nhóm trên
        
        LƯU Ý QUAN TRỌNG:
        - Nếu câu hỏi có liên quan đến sản phẩm/giày dù mơ hồ → PRODUCT
        - Câu follow-up ngắn như "cho xem đi", "cái đó", "số 2" → PRODUCT
        
        CHỈ TRẢ VỀ MỘT TỪ: PRODUCT, ORDER, POLICY, SMALL_TALK, hoặc UNKNOWN.
        KHÔNG giải thích, KHÔNG thêm ký tự khác.
        Câu hỏi: '{{request}}'
        """)
    @Agent(description = "Categorizes a user request")
    IntentCategory classify(@UserMessage @V("request") String request);
}
