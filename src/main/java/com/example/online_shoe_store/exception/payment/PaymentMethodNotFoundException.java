package com.example.online_shoe_store.exception.payment;

import com.example.online_shoe_store.exception.BusinessException;
import org.springframework.http.HttpStatus;

public class PaymentMethodNotFoundException extends BusinessException {
    public PaymentMethodNotFoundException(String message) {
        super(message, "PAYMENT_METHOD_NOT_FOUND", HttpStatus.NOT_FOUND);
    }
}
