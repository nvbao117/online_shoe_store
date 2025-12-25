package com.example.online_shoe_store.dto.request;

import lombok.Data;

import java.math.BigDecimal;
import java.util.List;

@Data
public class VoucherValidRequest {
    private BigDecimal subtotal;
    private List<VoucherApplyRequestItem> items;
}