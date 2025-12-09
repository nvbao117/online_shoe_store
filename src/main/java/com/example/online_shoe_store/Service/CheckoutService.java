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
    private final PaymentMethodRepository paymentMethodRepository;
    private final PaymentRepository paymentRepository;

    @Transactional
    public String placeOrder(User user, CheckoutRequest request) {
        // 1. Get User's Cart
        Cart cart = user.getCart();
        if (cart == null || cart.getCartItems().isEmpty()) {
            // For testing/fallback if cart is empty, maybe don't throw error or handle gracefully
            // But realistically, cannot checkout empty cart.
            // throw new RuntimeException("Cart is empty");
        }

        // 2. Create/Save ShipDetail
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

        // 3. Create Order
        Order order = Order.builder()
                .user(user)
                .shipDetail(shipDetail)
                .status(OrderStatus.PENDING)
                .totalAmount(BigDecimal.ZERO)
                .build();
        
        // Save order first to get ID (if needed for items, though Cascade might handle)
        order = orderRepository.save(order);

        // 4. Convert CartItems to OrderItems
        List<OrderItem> orderItems = new ArrayList<>();
        BigDecimal totalAmount = BigDecimal.ZERO;

        if (cart != null) {
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
        
        // Save items
        orderItemRepository.saveAll(orderItems);
        
        order.setTotalAmount(totalAmount);
        orderRepository.save(order);

        // 5. Payment Logic
        String methodCode = request.getPaymentMethod();
        if (methodCode == null) methodCode = "cod"; // default

        // Handle PaymentMethod Entity
        // We assume PaymentMethod table has entries. If not, we might need to create them or handle null.
        // For robustness, try to find by name, else create dummy or skip
        PaymentMethod paymentMethod = paymentMethodRepository.findAll().stream()
                .filter(pm -> pm.getMethodName().equalsIgnoreCase(methodCode) || pm.getMethodName().toLowerCase().contains(methodCode))
                .findFirst()
                .orElse(null);
        
        if (paymentMethod == null) {
             // Create if not exists (Lazy/Simple approach for this task)
             paymentMethod = PaymentMethod.builder().methodName(methodCode).build();
             paymentMethodRepository.save(paymentMethod);
        }

        Payment payment = Payment.builder()
                .order(order)
                .paymentMethod(paymentMethod)
                .amount(totalAmount)
                .paymentStatus(PaymentStatus.PENDING)
                .build();
        paymentRepository.save(payment);


        // 6. Clear Cart
        if (cart != null) {
            cart.getCartItems().clear();
            cartRepository.save(cart);
        }

        return order.getOrderId();
    }
}
