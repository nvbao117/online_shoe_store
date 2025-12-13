package com.example.online_shoe_store.exception.validation;

import com.example.online_shoe_store.exception.BusinessException;
import org.springframework.http.HttpStatus;

public class InvalidAmountException extends BusinessException {
    public InvalidAmountException(String message) {
        super(message, "INVALID_AMOUNT", HttpStatus.BAD_REQUEST);
    }
}
