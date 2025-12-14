package com.example.online_shoe_store.exception.order;

import com.example.online_shoe_store.exception.BusinessException;
import org.springframework.http.HttpStatus;

public class OrderNotFoundException extends BusinessException {
    public OrderNotFoundException(String message) {
        super(message, "ORDER_NOT_FOUND", HttpStatus.NOT_FOUND);
    }
}
