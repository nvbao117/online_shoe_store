package com.example.online_shoe_store.dto.request;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class VoucherApplyRequestItem {
    private String productId;
    private BigDecimal lineTotal;
}