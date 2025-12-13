package com.example.online_shoe_store.Service;

import com.example.online_shoe_store.Entity.*;
import com.example.online_shoe_store.Entity.enums.OrderStatus;
import com.example.online_shoe_store.Entity.enums.PaymentStatus;
import com.example.online_shoe_store.Repository.*;
import com.example.online_shoe_store.dto.request.CheckoutRequest;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class CheckoutService {

    private final UserRepository userRepository;
    private final CartRepository cartRepository;
    private final OrderRepository orderRepository;
    private final OrderItemRepository orderItemRepository;
    private final ShipDetailRepository shipDetailRepository;
    private final PaymentRepository paymentRepository;
    private final PaymentMethodRepository paymentMethodRepository;

    @Transactional
    public String placeOrder(User user, CheckoutRequest request){
        Cart cart = user.getCart();
        if(cart == null || cart.getCartItems().isEmpty()) {
            throw new RuntimeException("Giỏ hàng trống, không thể đặt hàng!");
        }

        ShipDetail shipDetail = ShipDetail.builder()
                .user(user)
                .recipientName(request.getFullName())
                .phone(request.getPhone())
                .province(request.getCity())
                .district(request.getDistrict())
                .ward(request.getWard())
                .detail(request.getAddress())
                .build();

        shipDetail = shipDetailRepository.save(shipDetail);

        Order order = Order.builder()
                .user(user)
                .shipDetail(shipDetail)
                .status(OrderStatus.PENDING)
                .totalAmount(BigDecimal.ZERO)
                .build();
        order = orderRepository.save(order);

        List<OrderItem> orderItems = new ArrayList<>();
        BigDecimal totalAmount = BigDecimal.ZERO;

        if (cart != null){
            for (CartItem cartItem : cart.getCartItems()) {
                OrderItem orderItem = OrderItem.builder()
                        .order(order)
                        .productVariant(cartItem.getProductVariant())
                        .quantity(cartItem.getQuantity())
                        .price(cartItem.getProductVariant().getProduct().getPrice())
                        .build();

                BigDecimal itemTotal = orderItem.getPrice().multiply(BigDecimal.valueOf(orderItem.getQuantity()));
                totalAmount = totalAmount.add(itemTotal);
                orderItems.add(orderItem);
            }
        }
        orderItemRepository.saveAll(orderItems);

        order.setTotalAmount(totalAmount);
        orderRepository.save(order);

        // Clear Cart
        if (cart != null) {
            cart.getCartItems().clear();
            cartRepository.save(cart);
        }

        return order.getOrderId();

    }

}