package com.example.online_shoe_store.dto.request;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class VoucherCreateRequest {
    private String name;
    private String code;
    private String description;
    private String startDate;
    private String endDate;
    private String discountType;
    private BigDecimal discountValue;
    private BigDecimal minOrderValue;
    private String customerType;
    private String status;
    private String scope;
    private String categoryId;
    private String brandId;
    private String productId;
}