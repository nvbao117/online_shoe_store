package com.example.online_shoe_store.Entity.enums;

/**
 * Các loại event trong conversation
 */
public enum ConversationEventType {
    USER_INPUT("User gửi tin nhắn"),
    AGENT_RESPONSE("Agent trả lời"),
    TOOL_CALL("Gọi tool/function"),
    TOOL_OUTPUT("Kết quả từ tool"),
    ERROR("Lỗi xảy ra"),
    CONFIRM_REQUESTED("Yêu cầu xác nhận"),
    CONFIRMED("Đã xác nhận"),
    CANCELLED("Đã hủy"),
    ESCALATED("Chuyển cho nhân viên"),
    SESSION_START("Bắt đầu session"),
    SESSION_END("Kết thúc session"),
    INTENT_CLASSIFIED("Phân loại intent"),
    ENTITY_EXTRACTED("Trích xuất entity"),
    CART_UPDATED("Cập nhật giỏ hàng"),
    ORDER_CREATED("Tạo đơn hàng"),
    PAYMENT_INITIATED("Bắt đầu thanh toán"),
    PAYMENT_COMPLETED("Hoàn thành thanh toán");

    private final String description;

    ConversationEventType(String description) {
        this.description = description;
    }

    public String getDescription() {
        return description;
    }
}
