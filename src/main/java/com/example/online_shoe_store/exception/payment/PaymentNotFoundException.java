package com.example.online_shoe_store.exception.payment;

import com.example.online_shoe_store.exception.BusinessException;
import org.springframework.http.HttpStatus;

public class PaymentNotFoundException extends BusinessException {
    public PaymentNotFoundException(String message) {
        super(message, "PAYMENT_NOT_FOUND", HttpStatus.NOT_FOUND);
    }
}
