package com.example.online_shoe_store.dto.request;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class CheckoutRequest {
    // From Step 1
    private String fullName;
    private String email;
    private String phone;
    private String address;
    private String city;
    private String district;
    private String ward;
    private String shippingType;
    
    private String paymentMethod;
    private String shippingMethod;
    
    private String note;
    
    // Voucher/Discount
    private String voucherCode;
    private BigDecimal discountAmount;
}

