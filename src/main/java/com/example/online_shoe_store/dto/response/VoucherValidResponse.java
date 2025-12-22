package com.example.online_shoe_store.dto.response;

import lombok.Data;
import lombok.Builder;

import java.math.BigDecimal;

@Data
@Builder
public class VoucherValidResponse {
    private String code;
    private String discountType;
    private BigDecimal discountValue;
    private String description;
    private BigDecimal maxDiscountAmount;
}