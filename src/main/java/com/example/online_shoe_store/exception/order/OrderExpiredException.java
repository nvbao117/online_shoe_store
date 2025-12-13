package com.example.online_shoe_store.exception.order;

import com.example.online_shoe_store.exception.BusinessException;
import org.springframework.http.HttpStatus;

public class OrderExpiredException extends BusinessException {
    public OrderExpiredException(String message) {
        super(message, "ORDER_EXPIRED", HttpStatus.GONE);
    }
}
