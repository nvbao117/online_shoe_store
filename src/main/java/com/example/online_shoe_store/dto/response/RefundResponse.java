package com.example.online_shoe_store.dto.response;

import com.example.online_shoe_store.Entity.enums.PaymentStatus;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class RefundResponse {
    private boolean success;
    private String message;
    private String refundId;
    private BigDecimal refundAmount;
    private String transactionId;
    private PaymentStatus status;
}