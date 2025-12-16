package com.example.online_shoe_store.Entity.enums;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

/**
 * Các loại agent trong hệ thống multi-agent
 */
@Getter
@RequiredArgsConstructor
public enum AgentType {
    SALES("sales_agent", "Hỗ trợ mua hàng"),
    RECOMMENDATION("recommendation_agent", "Gợi ý sản phẩm"),
    SEARCH("search_agent", "Tìm kiếm sản phẩm"),
    SUPPORT("support_agent", "Hỗ trợ chung,FAQ"),
    COMPLAINTS("complaints_agent", "Xử lý khiếu nại"),
    INVENTORY("inventory_agent", "Kiểm tra tồn kho"),
    RETURNS("returns_agent", "Đổi trả hoàn tiền"),
    PRICING("pricing_agent", "Giá và khuyến mãi"),
    LOGISTICS("logistics_agent", "Tracking giao hàng"),
    ANALYTICS("analytics_agent", "Phân tích dữ liệu"),
    MARKETING("marketing_agent", "Marketing và chiến dịch");

    private final String code;
    private final String description;


    public static AgentType fromCode(String code) {
        for (AgentType type : values()) {
            if (type.code.equalsIgnoreCase(code)) {
                return type;
            }
        }
        return SUPPORT;
    }

    /**
     * Kiểm tra agent có liên quan đến dữ liệu nhạy cảm không
     */
    public boolean isSensitive() {
        return this == COMPLAINTS || this == RETURNS || this == SALES;
    }


}
