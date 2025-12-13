package com.example.online_shoe_store.exception.order;

import com.example.online_shoe_store.exception.BusinessException;
import org.springframework.http.HttpStatus;

public class OrderAlreadyPaidException extends BusinessException {
    public OrderAlreadyPaidException(String message) {
        super(message, "ORDER_ALREADY_PAID", HttpStatus.CONFLICT);
    }
}
