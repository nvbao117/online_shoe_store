package com.example.online_shoe_store.exception.payment;

import com.example.online_shoe_store.exception.BusinessException;
import org.springframework.http.HttpStatus;

public class PaymentMethodNotActiveException extends BusinessException {
    public PaymentMethodNotActiveException(String message) {
        super(message, "PAYMENT_METHOD_NOT_ACTIVE", HttpStatus.BAD_REQUEST);
    }
}