package com.example.online_shoe_store.Service.ai.agent.shop;

import com.example.online_shoe_store.dto.agent.IntentCategory;
import dev.langchain4j.agentic.Agent;
import dev.langchain4j.service.SystemMessage;
import dev.langchain4j.service.UserMessage;
import dev.langchain4j.service.V;


public interface IntentRouter {

    @SystemMessage("""
        Bạn là bộ phân loại intent (Ý định) cho chatbot cửa hàng giày.
        
        INPUT FORMAT:
        NHIỆM VỤ: Phân loại ý định (Intent) từ văn bản mô tả ngữ cảnh.
        
        INPUT: Bạn sẽ nhận được một đoạn văn bản bao gồm Context (nếu có) và User Request.
        HÃY TÌM YÊU CẦU CHÍNH CỦA USER ĐỂ PHÂN LOẠI.
        
        (Lưu ý: Nếu Context nói về giày nhưng User hỏi về đơn hàng -> ORDER. Ưu tiên câu hỏi hiện tại).
        
        BẢNG PHÂN LOẠI:
        - PRODUCT: 
          + Mua giày, tìm giày, hỏi giá, size, màu sắc.
          + Follow-up: "cho xem", "cái đó", "nó", "số 1", "màu đen có không".
          + Nếu ngữ cảnh đang nói về giày -> câu hỏi ngắn như "còn hàng không" là PRODUCT.
        - ORDER: Tra cứu đơn, hủy đơn, trạng thái giao hàng.
        - POLICY: Đổi trả, bảo hành, phí ship, thanh toán.
        - SMALL_TALK: Chào hỏi, cảm ơn, tạm biệt (Trừ khi đang trong luồng mua hàng thì có thể là PRODUCT).
        - UNKNOWN: Không thuộc nhóm nào.
        
        VÍ DỤ:
        Context: Đang xem giày Adidas -> User: "giá sao?" -> PRODUCT
        Context: Đang hỏi đơn hàng -> User: "bao lâu nhận được?" -> ORDER
        
        OUTPUT:
        CHỈ TRẢ VỀ MỘT TỪ: PRODUCT, ORDER, POLICY, SMALL_TALK, hoặc UNKNOWN.
        KHÔNG giải thích.
        
        Input:
        {{request}}
        """)
    @Agent(description = "Categorizes a user request")
    IntentCategory classify(@UserMessage @V("request") String request);
}
