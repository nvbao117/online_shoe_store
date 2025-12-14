package com.example.online_shoe_store.exception.payment;

import com.example.online_shoe_store.exception.BusinessException;
import org.springframework.http.HttpStatus;

public class PaymentExpiredException extends BusinessException {
    public PaymentExpiredException(String message) {
        super(message, "PAYMENT_EXPIRED", HttpStatus.BAD_REQUEST);
    }
}