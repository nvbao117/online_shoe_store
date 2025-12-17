package com.example.online_shoe_store.Controller.api;

import com.example.online_shoe_store.Service.CartService;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import com.example.online_shoe_store.dto.response.ProductVariantDTO;


import java.security.Principal;
import java.util.HashMap;
import java.util.Map;
import java.util.List;

@RestController
@RequestMapping("/api/cart")
@RequiredArgsConstructor
public class CartAPIController {

    private final CartService cartService;

    // --- 1. API THÊM VÀO GIỎ (Dùng cho nút Mua & Thêm) ---
    @PostMapping("/add")
    public ResponseEntity<?> addToCart(@RequestBody AddToCartRequest request, Principal principal) {
        if (principal == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Vui lòng đăng nhập để mua hàng");
        }

        try {
            // Gọi service để thêm (Service sẽ tự tìm Variant dựa trên ProductID + Size)
            cartService.addProductToCart(
                    principal.getName(),
                    request.getProductId(),
                    request.getSize(),
                    request.getQuantity()
            );

            // Lấy số lượng mới để cập nhật chấm đỏ
            int newCount = cartService.getCartItemCount(principal.getName());

            Map<String, Object> response = new HashMap<>();
            //response.put("message", "Thêm vào giỏ hàng thành công!");
            response.put("cartCount", newCount);

            return ResponseEntity.ok(response);
        } catch (Exception e) {
            return ResponseEntity.badRequest().body("Lỗi: " + e.getMessage());
        }
    }

    // --- 2. API ĐẾM SỐ LƯỢNG (Dùng cho chấm đỏ Header) ---
    @GetMapping("/count")
    public ResponseEntity<?> getCartCount(Principal principal) {
        int count = 0;
        if (principal != null) {
            count = cartService.getCartItemCount(principal.getName());
        }
        Map<String, Integer> response = new HashMap<>();
        response.put("count", count);
        return ResponseEntity.ok(response);
    }

    // --- CÁC API CŨ CỦA BẠN (GIỮ NGUYÊN) ---
    @GetMapping("/variants/{productId}")
    public ResponseEntity<List<ProductVariantDTO>> getVariants(@PathVariable String productId) {
        return ResponseEntity.ok(cartService.getVariantsByProductId(productId));
    }

    @PutMapping("/update-quantity")
    public ResponseEntity<?> updateQuantity(@RequestParam String itemId, @RequestParam int quantity, Principal principal) {
        if (principal == null) return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Vui lòng đăng nhập");
        try {
            cartService.updateItemQuantity(itemId, quantity);
            return ResponseEntity.ok("Cập nhật số lượng thành công");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Không thể cập nhật số lượng");
        }
    }

    @PatchMapping("/update-variant")
    public ResponseEntity<?> updateVariant(@RequestParam String itemId, @RequestParam String variantId, Principal principal) {
        if (principal == null) return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Vui lòng đăng nhập");
        try {
            cartService.updateItemVariant(itemId, variantId);
            return ResponseEntity.ok("Đổi phân loại thành công");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Lỗi khi đổi phân loại");
        }
    }

    @DeleteMapping("/remove/{itemId}")
    public ResponseEntity<?> removeItem(@PathVariable String itemId, Principal principal) {
        //if (principal == null) return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Vui lòng đăng nhập");
        try {
            cartService.deleteCartItem(itemId);
            return ResponseEntity.ok().build();
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Lỗi khi xóa sản phẩm");
        }
    }

    // DTO hứng dữ liệu từ JS
    @Data
    public static class AddToCartRequest {
        private String productId;
        private int quantity;
        private String size;
    }
}