package com.example.online_shoe_store.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/orders")
public class OrderPageController {

    @GetMapping
    public String orderListPage() {
        return "pages/orders"; // Maps to resources/templates/pages/orders.html
    }

    @GetMapping("/{orderId}")
    public String orderDetailPage(@PathVariable String orderId) {
        return "pages/order-detail"; // Maps to resources/templates/pages/order-detail.html
    }
}
