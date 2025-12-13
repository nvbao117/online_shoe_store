package com.example.online_shoe_store.exception.order;

import com.example.online_shoe_store.exception.BusinessException;
import org.springframework.http.HttpStatus;

public class InvalidOrderStatusException extends BusinessException {
    public InvalidOrderStatusException(String message) {
        super(message, "INVALID_ORDER_STATUS", HttpStatus.BAD_REQUEST);
    }
}
