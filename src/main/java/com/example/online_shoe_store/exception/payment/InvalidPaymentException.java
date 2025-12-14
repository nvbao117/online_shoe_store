package com.example.online_shoe_store.exception.payment;

import com.example.online_shoe_store.exception.BusinessException;
import org.springframework.http.HttpStatus;

public class InvalidPaymentException extends BusinessException {
    public InvalidPaymentException(String message) {
        super("Invalid payment: " + message,
                "INVALID_PAYMENT",
                HttpStatus.BAD_REQUEST);
    }
}