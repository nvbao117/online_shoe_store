package com.example.online_shoe_store.dto.response;

import com.example.online_shoe_store.Entity.enums.OrderStatus;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderWSMessage {
    private String orderId;
    private OrderStatus status;
    private String message;
}
