package com.example.online_shoe_store.dto.request;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PaymentCreateRequest {
    private String orderId;
    private String paymentMethod;
    private String bankCode;
    private String language;
}