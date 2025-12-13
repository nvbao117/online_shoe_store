package com.example.online_shoe_store.exception.payment;

import com.example.online_shoe_store.exception.BusinessException;
import org.springframework.http.HttpStatus;

public class PaymentProcessingException extends BusinessException {
    public PaymentProcessingException(String message) {
        super("Payment processing error: " + message,
                "PAYMENT_PROCESSING_ERROR",
                HttpStatus.INTERNAL_SERVER_ERROR);
    }
}