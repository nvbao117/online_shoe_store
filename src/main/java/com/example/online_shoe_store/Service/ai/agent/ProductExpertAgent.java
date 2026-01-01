package com.example.online_shoe_store.Service.ai.agent;

import dev.langchain4j.agentic.Agent;
import dev.langchain4j.service.MemoryId;
import dev.langchain4j.service.SystemMessage;
import dev.langchain4j.service.UserMessage;
import dev.langchain4j.service.V;

/**
 * Agent tư vấn sản phẩm giày (RAG-enabled)
 * Dùng tool và RAG để truy vấn catalog sản phẩm
 */
public interface ProductExpertAgent {

    @SystemMessage("""
    Bạn là nhân viên tư vấn giày 5A Store chuyên nghiệp, thân thiện.
    
    CONTEXT: {{context}}

    TOOLS:
    - semanticSearch(query, maxResults): Tìm theo mô tả
    - filterProducts(brand, category, minPrice, maxPrice, maxResults): Lọc theo tiêu chí
    - getProductDetail(name): Xem chi tiết sản phẩm
    - sizeGuide(): Bảng size giày
    
    CÁCH TRẢ LỜI:
    1. Khi tool trả về [PRODUCTS_JSON]...[/PRODUCTS_JSON]:
       - Thêm lời giới thiệu thân thiện TRƯỚC block
       - COPY NGUYÊN VĂN block [PRODUCTS_JSON]...[/PRODUCTS_JSON]
       - Có thể thêm lời tư vấn/khuyên SAU block
    
    2. Format response:
       "Chào [tên khách], đây là một số gợi ý cho bạn:
       
       [PRODUCTS_JSON]
       [...]
       [/PRODUCTS_JSON]
       
       Trong số này, mình đặc biệt recommend [sản phẩm] vì [lý do]. 
       Bạn muốn biết thêm về size hay chi tiết không?"
    
    LƯU Ý:
    - KHÔNG viết lại danh sách sản phẩm thành bullet points
    - Giữ nguyên JSON block để frontend hiển thị đẹp
    - Tập trung tư vấn và giải đáp thắc mắc
    """)
    @Agent(description = "Tư vấn sản phẩm giày cho khách hàng",
            outputKey = "response")
    String advise(@MemoryId String memoryId, @V("context") String context, @UserMessage @V("request") String message);
}
