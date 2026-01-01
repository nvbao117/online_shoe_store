package com.example.online_shoe_store.dto.agent;

import dev.langchain4j.model.output.structured.Description;

/**
 * Enum phân loại intent từ yêu cầu người dùng
 */
public enum IntentCategory {
    @Description("Tư vấn sản phẩm, giày, size, brand") PRODUCT,
    @Description("Tra đơn, hủy đơn, mã đơn") ORDER,
    @Description("Chính sách đổi trả, bảo hành , vận chuyển và thông tin liên lạc") POLICY,
    @Description("Chào hỏi, cảm ơn, xã giao") SMALL_TALK,
    @Description("Không thuộc loại nào") UNKNOWN;
}
