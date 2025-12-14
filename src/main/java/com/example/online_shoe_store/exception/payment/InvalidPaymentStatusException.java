package com.example.online_shoe_store.exception.payment;

import com.example.online_shoe_store.exception.BusinessException;
import org.springframework.http.HttpStatus;

public class InvalidPaymentStatusException extends BusinessException {
    public InvalidPaymentStatusException(String message) {
        super(message, "INVALID_PAYMENT_STATUS", HttpStatus.BAD_REQUEST);
    }
}