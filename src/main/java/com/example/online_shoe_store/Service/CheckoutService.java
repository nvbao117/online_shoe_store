package com.example.online_shoe_store.Service;

import com.example.online_shoe_store.Entity.*;
import com.example.online_shoe_store.Entity.enums.OrderStatus;
import com.example.online_shoe_store.Repository.*;
import com.example.online_shoe_store.dto.request.CheckoutRequest;
import com.example.online_shoe_store.dto.response.OrderWSMessage;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.HashSet;

@Service
@RequiredArgsConstructor
public class CheckoutService {

    private final CartRepository cartRepository;
    private final OrderRepository orderRepository;
    private final OrderItemRepository orderItemRepository;
    private final ShipDetailRepository shipDetailRepository;

    @Transactional
    public String placeOrder(User user, CheckoutRequest request, List<String> selectedCartItemIds){
        Cart cart = user.getCart();
        if(cart == null || cart.getCartItems().isEmpty()) {
            throw new RuntimeException("Giỏ hàng trống, không thể đặt hàng!");
        }

        Set<String> selectedIds = new HashSet<>(selectedCartItemIds != null ? selectedCartItemIds : List.of());

        // Check if user has no default address yet
        boolean hasNoDefaultAddress = shipDetailRepository.findByUserUserIdAndIsDefaultTrue(user.getUserId()).isEmpty();

        ShipDetail shipDetail = ShipDetail.builder()
                .user(user)
                .recipientName(request.getFullName())
                .phone(request.getPhone())
                .province(request.getCity())
                .district(request.getDistrict())
                .ward(request.getWard())
                .detail(request.getAddress())
                .isDefault(hasNoDefaultAddress) // Set as default if user has no default address
                .build();

        shipDetail = shipDetailRepository.save(shipDetail);

        Order order = Order.builder()
                .user(user)
                .shipDetail(shipDetail)
                .status(OrderStatus.PENDING)
                .totalAmount(BigDecimal.ZERO)
                .build();
        order = orderRepository.save(order);

        // gửi cho admin
//        messagingTemplate.convertAndSend(
//                "/topic/admin/orders",
//                new OrderWSMessage(
//                        order.getOrderId(),
//                        OrderStatus.PENDING,
//                        "Có đơn hàng mới chờ xác nhận"
//                )
//        );


        List<OrderItem> orderItems = new ArrayList<>();
        BigDecimal totalAmount = BigDecimal.ZERO;

        if (cart != null) {
            for (CartItem cartItem : cart.getCartItems()) {
                if ((selectedIds.isEmpty() || selectedIds.contains(cartItem.getCartItemId()))
                        && Boolean.TRUE.equals(cartItem.getIsActive())) {
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
        }
        orderItemRepository.saveAll(orderItems);

        order.setTotalAmount(totalAmount);
        orderRepository.save(order);

        return order.getOrderId();

    }

    @Transactional
    public void softDeleteUserCartItems(User user, List<String> selectedCartItemIds) {
        Cart cart = user.getCart();
        if (cart == null) return;
        
        Set<String> selectedIds = new HashSet<>(selectedCartItemIds != null ? selectedCartItemIds : List.of());
        
        for (CartItem item : cart.getCartItems()) {
            if ((selectedIds.isEmpty() || selectedIds.contains(item.getCartItemId()))
                    && Boolean.TRUE.equals(item.getIsActive())) {
                item.setIsActive(false);
            }
        }
        cartRepository.save(cart);
    }

    // Soft delete cartitem dựa trên order
    @Transactional
    public void softDeleteCartItemsByOrderId(String orderId) {
        Order order = orderRepository.findById(orderId).orElse(null);
        if (order == null) return;
        
        User user = order.getUser();
        Cart cart = user.getCart();
        if (cart == null) return;
        
        // lấy all variant dựa trên product variant
        Set<String> orderVariantIds = new HashSet<>();
        for (OrderItem orderItem : order.getOrderItems()) {
            orderVariantIds.add(orderItem.getProductVariant().getVariantId());
        }

        for (CartItem cartItem : cart.getCartItems()) {
            if (orderVariantIds.contains(cartItem.getProductVariant().getVariantId())
                    && Boolean.TRUE.equals(cartItem.getIsActive())) {
                cartItem.setIsActive(false);
            }
        }
        cartRepository.save(cart);
    }
}