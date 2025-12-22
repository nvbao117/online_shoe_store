package com.example.online_shoe_store.dto.agent;

/**
 * Enum phân loại intent từ yêu cầu người dùng
 */
public enum IntentCategory {
    /** Tư vấn sản phẩm, tìm giày, so sánh giá */
    PRODUCT,
    
    /** Thao tác đơn hàng: tra cứu, tạo, hủy đơn */
    ORDER,
    
    /** Chính sách shop: đổi trả, vận chuyển, bảo hành */
    POLICY,
    
    /** Chào hỏi, xã giao */
    SMALL_TALK,
    
    /** Không xác định được loại */
    UNKNOWN
}
