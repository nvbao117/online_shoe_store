package com.example.online_shoe_store.dto.response;

import com.example.online_shoe_store.Entity.enums.PaymentStatus;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Response DTO for payment operations.
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PaymentResponse {
    private boolean success;
    private String message;
    private String paymentId;
    private String paymentUrl;
    private PaymentStatus status;
    private String transactionId;
}