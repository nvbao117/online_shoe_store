package com.example.online_shoe_store.Controller.api;

import com.example.online_shoe_store.Entity.Order;
import com.example.online_shoe_store.Entity.OrderItem;
import com.example.online_shoe_store.Entity.Payment;
import com.example.online_shoe_store.Entity.ShipDetail;
import com.example.online_shoe_store.Entity.User;
import com.example.online_shoe_store.Repository.OrderRepository;
import com.example.online_shoe_store.Repository.UserRepository;
import com.example.online_shoe_store.dto.response.OrderResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/orders")
@RequiredArgsConstructor
public class OrderAPIController {

    private final OrderRepository orderRepository;
    private final UserRepository userRepository;

    @GetMapping("/my-orders")
    public ResponseEntity<List<OrderResponse>> getMyOrders() {
        User user = getCurrentUser();
        if (user == null) {
            return ResponseEntity.status(401).build();
        }

        List<Order> orders = orderRepository.findByUserOrderByCreatedAtDesc(user);
        List<OrderResponse> responseList = orders.stream()
                .map(this::mapToOrderResponse)
                .collect(Collectors.toList());

        return ResponseEntity.ok(responseList);
    }

    @GetMapping("/{orderId}")
    public ResponseEntity<OrderResponse> getOrderDetails(@PathVariable String orderId) {
        User user = getCurrentUser();
        if (user == null) {
            return ResponseEntity.status(401).build();
        }

        return orderRepository.findById(orderId)
                .map(order -> {
                    // Check if order belongs to current user
                    if (!order.getUser().getUserId().equals(user.getUserId())) {
                        return ResponseEntity.status(403).<OrderResponse>build();
                    }
                    return ResponseEntity.ok(mapToOrderResponse(order));
                })
                .orElse(ResponseEntity.notFound().build());
    }

    private OrderResponse mapToOrderResponse(Order order) {
        ShipDetail shipDetail = order.getShipDetail();
        String formattedAddress = "N/A";
        String customerName = "N/A";
        String phone = "N/A";

        if (shipDetail != null) {
            formattedAddress = String.format("%s, %s, %s, %s",
                    shipDetail.getDetail() != null ? shipDetail.getDetail() : "",
                    shipDetail.getWard(),
                    shipDetail.getDistrict(),
                    shipDetail.getProvince());
            // Clean up double commas if detail is empty
            if (formattedAddress.startsWith(", ")) {
                formattedAddress = formattedAddress.substring(2);
            }
            customerName = shipDetail.getRecipientName();
            phone = shipDetail.getPhone();
        }

        Payment payment = order.getSuccessfulPayment();
        String paymentMethodVal = (payment != null && payment.getPaymentMethod() != null) 
                ? payment.getPaymentMethod().getMethodName() : "COD";
        String paymentStatusVal = (payment != null) ? payment.getPaymentStatus().name() : "PENDING";

        List<OrderResponse.OrderItemResponse> items = order.getOrderItems().stream()
                .map(this::mapToOrderItemResponse)
                .collect(Collectors.toList());

        return OrderResponse.builder()
                .orderId(order.getOrderId())
                .createdAt(order.getCreatedAt())
                .totalAmount(order.getTotalAmount())
                .shippingFee(order.getShippingFee())
                .finalAmount(order.getFinalAmount() != null ? order.getFinalAmount() : order.getTotalAmount())
                .status(order.getStatus().name())
                .paymentMethod(paymentMethodVal)
                .paymentStatus(paymentStatusVal)
                .customerName(customerName)
                .phone(phone)
                .shippingAddress(formattedAddress)
                .items(items)
                .build();
    }

    private OrderResponse.OrderItemResponse mapToOrderItemResponse(OrderItem item) {
        String imageUrl = "/images/placeholder.png";
        if (item.getProductVariant() != null && item.getProductVariant().getImageUrl() != null) {
             imageUrl = item.getProductVariant().getImageUrl();
             // Clean up path if it still has src/data prefix (though we fixed it in DB, good to be safe)
             if (imageUrl.startsWith("src/data")) {
                 imageUrl = imageUrl.replace("src/data", "");
             }
        }

        return OrderResponse.OrderItemResponse.builder()
                .productName(item.getProductVariant().getProduct().getName())
                .color(item.getProductVariant().getColor())
                .size(item.getProductVariant().getSize())
                .quantity(item.getQuantity())
                .price(item.getPrice())
                .totalPrice(item.getTotalPrice())
                .imageUrl(imageUrl)
                .build();
    }

    private User getCurrentUser() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null && auth.isAuthenticated() && !"anonymousUser".equals(auth.getPrincipal())) {
            String username = auth.getName();
            return userRepository.findByUsername(username).orElse(null);
        }
        return null;
    }
}
