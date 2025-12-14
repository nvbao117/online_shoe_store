package com.example.online_shoe_store.exception.payment;

import com.example.online_shoe_store.exception.BusinessException;
import org.springframework.http.HttpStatus;

public class UnsupportedPaymentMethodException extends BusinessException {
    public UnsupportedPaymentMethodException(String methodName) {
        super("Unsupported payment method: " + methodName,
                "UNSUPPORTED_PAYMENT_METHOD",
                HttpStatus.BAD_REQUEST);
    }
}