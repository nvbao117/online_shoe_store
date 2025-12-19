package com.example.online_shoe_store.Controller.profile;


import com.example.online_shoe_store.Service.OrderConfirmService;
import com.example.online_shoe_store.dto.response.OrderResponse;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@FieldDefaults(level = lombok.AccessLevel.PRIVATE, makeFinal = true)
@RequiredArgsConstructor
@RequestMapping("/api")
public class PendingOrderController {

    OrderConfirmService orderConfirmService;
    @GetMapping("/pending-order")
    public List<OrderResponse> getWaitConfirm() {
        return orderConfirmService.getOrderPending();
    }
}
