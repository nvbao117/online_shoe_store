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
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class CartService {

    private final UserRepository userRepository;
    private final CartItemRepository cartItemRepository;
    private final ProductVariantRepository variantRepository;
    private final CartRepository cartRepository;

    // --- 1. THÊM SẢN PHẨM VÀO GIỎ (Dùng cho Product Detail) ---
    @Transactional
    public void addProductToCart(String username, String productId, String size, int quantity) {
        // 1. Tìm User
        User user = userRepository.findByUsername(username)
                .orElseThrow(() -> new RuntimeException("Người dùng không tồn tại"));

        // 2. Lấy giỏ hàng (Nếu chưa có thì tạo mới - đề phòng lỗi data cũ)
        Cart cart = user.getCart();
        if (cart == null) {
            cart = new Cart();
            cart.setCartId(UUID.randomUUID().toString());
            cart.setUser(user);
            cart.setCartItems(new ArrayList<>());
            cartRepository.save(cart); // Lưu giỏ mới
        }

        // 3. Tìm ProductVariant dựa trên ProductID và Size
        List<ProductVariant> variants = variantRepository.findByProductProductId(productId);

        ProductVariant targetVariant = variants.stream()
                .filter(v -> v.getSize() != null && v.getSize().equalsIgnoreCase(size))
                .findFirst()
                .orElseThrow(() -> new RuntimeException("Size '" + size + "' không tồn tại hoặc đã hết hàng!"));

        // 4. Kiểm tra xem Variant này đã có trong giỏ chưa
        Optional<CartItem> existingItemOpt = cart.getCartItems().stream()
                .filter(item -> item.getProductVariant().getVariantId().equals(targetVariant.getVariantId()))
                .findFirst();

        if (existingItemOpt.isPresent()) {
            // Trường hợp A: Đã có -> Cộng dồn số lượng
            CartItem existingItem = existingItemOpt.get();
            existingItem.setQuantity(existingItem.getQuantity() + quantity);
            cartItemRepository.save(existingItem);
        } else {
            // Trường hợp B: Chưa có -> Tạo CartItem mới
            CartItem newItem = new CartItem();
            newItem.setCartItemId(UUID.randomUUID().toString()); // Tự sinh ID string
            newItem.setCart(cart);
            newItem.setProductVariant(targetVariant);
            newItem.setQuantity(quantity);
            cartItemRepository.save(newItem);
        }
    }

    // --- 2. ĐẾM SỐ LƯỢNG (Dùng cho chấm đỏ Header) ---
    @Transactional(readOnly = true)
    public int getCartItemCount(String username) {
        User user = userRepository.findByUsername(username).orElse(null);

        // Nếu chưa đăng nhập hoặc chưa có giỏ -> 0
        if (user == null || user.getCart() == null || user.getCart().getCartItems() == null) {
            return 0;
        }

        // Cộng tổng số lượng (quantity) của tất cả item trong giỏ
        return user.getCart().getCartItems().stream()
                .mapToInt(CartItem::getQuantity)
                .sum();
    }

    // --- 3. LẤY DANH SÁCH HIỂN THỊ TRANG CART ---
    @Transactional(readOnly = true)
    public List<CartItemResponse> getCartItemsByUsername(String username) {
        User user = userRepository.findByUsername(username).orElse(null);
        if (user == null || user.getCart() == null) return new ArrayList<>();

        return user.getCart().getCartItems().stream()
                .filter(item -> Boolean.TRUE.equals(item.getIsActive())) // Only active items
                .map(item -> {
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

    // --- 4. CÁC HÀM HỖ TRỢ KHÁC ---

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
            // Nếu trùng -> Cộng dồn vào cái kia và xóa cái hiện tại
            duplicate.get().setQuantity(duplicate.get().getQuantity() + item.getQuantity());
            cartItemRepository.delete(item);
        } else {
            // Không trùng -> Cập nhật variant cho item hiện tại
            item.setProductVariant(newVariant);
            cartItemRepository.save(item);
        }
    }

    /**
     * Lấy cart items theo danh sách cart item IDs (dùng cho checkout)
     */
    @Transactional(readOnly = true)
    public List<CartItemResponse> getCartItemsByIds(List<String> cartItemIds) {
        if (cartItemIds == null || cartItemIds.isEmpty()) {
            return new ArrayList<>();
        }

        return cartItemRepository.findAllById(cartItemIds).stream().map(item -> {
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
}