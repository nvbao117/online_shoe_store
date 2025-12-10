package com.example.online_shoe_store.Service;

import com.example.online_shoe_store.Entity.Cart;
import com.example.online_shoe_store.Entity.CartItem;
import com.example.online_shoe_store.Entity.Product;
import com.example.online_shoe_store.Entity.ProductVariant;
import com.example.online_shoe_store.Entity.User;
import com.example.online_shoe_store.Repository.*;
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
    private final CartItemRepository cartItemRepository;
    private final ProductVariantRepository productVariantRepository;

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

    // 1. Cập nhật số lượng
    @Transactional
    public void updateItemQuantity(String cartItemId, int newQuantity) {
        CartItem item = cartItemRepository.findById(cartItemId)
                .orElseThrow(() -> new RuntimeException("Item not found"));

        if (newQuantity <= 0) {
            cartItemRepository.delete(item); // Nếu số lượng <= 0 thì xóa luôn
        } else {
            item.setQuantity(newQuantity);
            cartItemRepository.save(item);
        }
    }

    // Xóa sản phẩm khỏi giỏ
    @Transactional
    public void deleteCartItem(String cartItemId) {
        if (cartItemRepository.existsById(cartItemId)) {
            cartItemRepository.deleteById(cartItemId);
        }
    }

    // Đổi phân loại (Variant)
    @Transactional
    public void updateItemVariant(String cartItemId, String newVariantId) {
        CartItem item = cartItemRepository.findById(cartItemId)
                .orElseThrow(() -> new RuntimeException("Item not found"));

        ProductVariant newVariant = productVariantRepository.findById(newVariantId)
                .orElseThrow(() -> new RuntimeException("Variant not found"));


        item.setProductVariant(newVariant);
        cartItemRepository.save(item);
    }
}