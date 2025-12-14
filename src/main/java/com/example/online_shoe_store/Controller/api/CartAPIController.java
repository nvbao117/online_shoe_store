package com.example.online_shoe_store.Controller.api;

import com.example.online_shoe_store.Service.CartService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;

@RestController
@RequestMapping("/api/cart")
@RequiredArgsConstructor
public class CartAPIController {

    private final CartService cartService;

    @GetMapping("/variants/{productId}")
    public ResponseEntity<?> getVariants(@PathVariable String productId) {
        try {
            return ResponseEntity.ok(cartService.getVariantsByProductId(productId));
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Lỗi khi tải phân loại");
        }
    }

    @PutMapping("/update-quantity")
    public ResponseEntity<?> updateQuantity(
            @RequestParam String itemId,
            @RequestParam int quantity,
            Principal principal) {

        if (principal == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Vui lòng đăng nhập");
        }

        try {
            // Bạn có thể bổ sung logic kiểm tra quyền sở hữu itemId tại CartService
            cartService.updateItemQuantity(itemId, quantity);
            return ResponseEntity.ok("Cập nhật số lượng thành công");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Không thể cập nhật số lượng");
        }
    }

    @PatchMapping("/update-variant")
    public ResponseEntity<?> updateVariant(
            @RequestParam String itemId,
            @RequestParam String variantId,
            Principal principal) {

        if (principal == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Vui lòng đăng nhập");
        }

        try {
            cartService.updateItemVariant(itemId, variantId);
            return ResponseEntity.ok("Đổi phân loại thành công");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Lỗi khi đổi phân loại");
        }
    }

    @DeleteMapping("/remove/{itemId}")
    public ResponseEntity<?> removeItem(@PathVariable String itemId, Principal principal) {

        if (principal == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Vui lòng đăng nhập");
        }

        try {
            cartService.deleteCartItem(itemId);
            return ResponseEntity.ok("Đã xóa sản phẩm khỏi giỏ hàng");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Lỗi khi xóa sản phẩm");
        }
    }
}