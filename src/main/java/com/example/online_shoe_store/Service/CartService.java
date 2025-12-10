package com.example.online_shoe_store.Service;

import com.example.online_shoe_store.Entity.Cart;
import com.example.online_shoe_store.Entity.CartItem;
import com.example.online_shoe_store.Entity.Product;
import com.example.online_shoe_store.Entity.ProductVariant;
import com.example.online_shoe_store.Entity.User;
import com.example.online_shoe_store.Repository.CartRepository;
import com.example.online_shoe_store.Repository.UserRepository;
import com.example.online_shoe_store.dto.response.CartItemResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class CartService {

    private final CartRepository cartRepository;
    private final UserRepository userRepository;

    @Transactional(readOnly = true)
    public List<CartItemResponse> getCartItemsByUsername(String username) {
        User user = userRepository.findByUsername(username).orElse(null);

        if (user == null || user.getCart() == null) {
            return new ArrayList<>();
        }

        Cart cart = user.getCart();
        List<CartItem> items = cart.getCartItems();

        if (items == null) {
            return new ArrayList<>();
        }

        return items.stream().map(item -> {
            ProductVariant variant = item.getProductVariant();
            Product product = variant.getProduct();

            // --- SỬA LỖI TẠI ĐÂY ---
            // Vì product.getPrice() đã là BigDecimal nên lấy trực tiếp, không dùng valueOf()
            BigDecimal price = product.getPrice() != null ? product.getPrice() : BigDecimal.ZERO;

            // Tính tổng tiền = Giá * Số lượng
            BigDecimal total = price.multiply(BigDecimal.valueOf(item.getQuantity()));

            return CartItemResponse.builder()
                    .cartItemId(item.getCartItemId())
                    .productId(product.getProductId())
                    .productName(product.getName())
                    .variantId(variant.getVariantId())
                    .size(variant.getSize())
                    .color(variant.getColor())
                    .imageUrl(product.getImageUrl())
                    .price(price)
                    .quantity(item.getQuantity())
                    .totalPrice(total)
                    .build();
        }).toList();
    }

    public BigDecimal getCartTotal(List<CartItemResponse> items) {
        if (items == null || items.isEmpty()) {
            return BigDecimal.ZERO;
        }
        return items.stream()
                .map(CartItemResponse::getTotalPrice)
                .reduce(BigDecimal.ZERO, BigDecimal::add);
    }
}