package com.example.online_shoe_store.Controller;

import com.example.online_shoe_store.Entity.Order;
import com.example.online_shoe_store.Entity.enums.OrderStatus;
import com.example.online_shoe_store.Repository.OrderRepository;
import com.example.online_shoe_store.dto.response.OrderWSMessage;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.http.ResponseEntity;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
@FieldDefaults(level = lombok.AccessLevel.PRIVATE,  makeFinal = true)
public class OrderConfirmController {

//    private OrderRepository orderRepository;
//    private SimpMessagingTemplate messagingTemplate;
//    @PutMapping("/admin/orders/{id}/confirm")
//    public ResponseEntity<?> confirmOrder(@PathVariable String id) {
//        Order order = orderRepository.findById(id).orElseThrow();
//        order.setStatus(OrderStatus.CONFIRMED);
//        orderRepository.save(order);
//
//        // gửi cho khách hàng
////        messagingTemplate.convertAndSendToUser(
////                order.getUser().getUsername(),
////                "/queue/orders",
////                new OrderWSMessage(
////                        order.getOrderId(),
////                        OrderStatus.CONFIRMED,
////                        "Đơn hàng của bạn đã được xác nhận"
////                )
////        );
//
//        return ResponseEntity.ok().build();
//    }

}
