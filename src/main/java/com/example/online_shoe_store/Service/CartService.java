package com.example.online_shoe_store.Service;

import com.example.online_shoe_store.Entity.*;
import com.example.online_shoe_store.Repository.*;
import com.example.online_shoe_store.dto.response.CartItemResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class CartService {
    private final UserRepository userRepository;
    private final CartItemRepository cartItemRepository;
    private final ProductVariantRepository variantRepository;

    @Transactional(readOnly = true)
    public List<CartItemResponse> getCartItemsByUsername(String username) {
        User user = userRepository.findByUsername(username).orElse(null);
        if (user == null || user.getCart() == null) return new ArrayList<>();

        return user.getCart().getCartItems().stream().map(item -> {
            ProductVariant pv = item.getProductVariant();
            Product p = pv.getProduct();
            BigDecimal price = p.getPrice() != null ? p.getPrice() : BigDecimal.ZERO;
            return CartItemResponse.builder()
                    .cartItemId(item.getCartItemId())
                    .productId(p.getProductId())
                    .productName(p.getName())
                    .size(pv.getSize())
                    .color(pv.getColor())
                    .imageUrl(p.getImageUrl())
                    .price(price)
                    .quantity(item.getQuantity())
                    .totalPrice(price.multiply(BigDecimal.valueOf(item.getQuantity())))
                    .build();
        }).toList();
    }

    public String getUserFullName(String username) {
        return userRepository.findByUsername(username).map(User::getName).orElse("Người dùng");
    }

    public List<ProductVariant> getVariantsByProductId(String productId) {
        return variantRepository.findByProductProductId(productId);
    }

    @Transactional
    public void updateItemQuantity(String cartItemId, int qty) {
        cartItemRepository.findById(cartItemId).ifPresent(i -> {
            i.setQuantity(qty);
            cartItemRepository.save(i);
        });
    }

    @Transactional
    public void deleteCartItem(String cartItemId) {
        cartItemRepository.deleteById(cartItemId);
    }

    @Transactional
    public void updateItemVariant(String cartItemId, String newVariantId) {
        CartItem item = cartItemRepository.findById(cartItemId).orElseThrow();
        ProductVariant newVariant = variantRepository.findById(newVariantId).orElseThrow();

        // Gộp nếu trùng variant trong giỏ
        Optional<CartItem> duplicate = item.getCart().getCartItems().stream()
                .filter(ci -> ci.getProductVariant().getVariantId().equals(newVariantId) && !ci.getCartItemId().equals(cartItemId))
                .findFirst();

        if (duplicate.isPresent()) {
            duplicate.get().setQuantity(duplicate.get().getQuantity() + item.getQuantity());
            cartItemRepository.delete(item);
        } else {
            item.setProductVariant(newVariant);
            cartItemRepository.save(item);
        }
    }
}