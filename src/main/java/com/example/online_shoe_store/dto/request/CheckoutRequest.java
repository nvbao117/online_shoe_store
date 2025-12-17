package com.example.online_shoe_store.dto.request;

import lombok.Data;

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
    
    // From Step 2
    private String paymentMethod;
    private String shippingMethod; // Freeship etc.
    
    private String note;
}
