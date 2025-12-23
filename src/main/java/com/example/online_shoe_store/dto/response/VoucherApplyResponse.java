package com.example.online_shoe_store.dto.response;

import lombok.Data;
import lombok.Builder;

import java.math.BigDecimal;

@Data
@Builder
public class VoucherApplyResponse {
    private BigDecimal discountAmount;
    private BigDecimal finalTotal;
}