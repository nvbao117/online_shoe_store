package com.example.online_shoe_store.Controller.api;

import com.example.online_shoe_store.Service.CartService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController // REST API dùng cái này (tự hiểu mọi hàm đều trả về JSON)
@RequestMapping("/api/cart") // Gộp chung tiền tố /api để dễ quản lý
@RequiredArgsConstructor
public class CartAPIController {
    private final CartService cartService;

    // Lấy phân loại: GET
    @GetMapping("/variants/{productId}")
    public ResponseEntity<?> getVariants(@PathVariable String productId) {
        return ResponseEntity.ok(cartService.getVariantsByProductId(productId));
    }

    // Cập nhật số lượng: PUT
    @PutMapping("/update-quantity")
    public ResponseEntity<?> updateQuantity(@RequestParam String itemId, @RequestParam int quantity) {
        cartService.updateItemQuantity(itemId, quantity);
        return ResponseEntity.ok("Cập nhật thành công");
    }

    // Cập nhật phân loại: PATCH (hoặc PUT)
    @PatchMapping("/update-variant")
    public ResponseEntity<?> updateVariant(@RequestParam String itemId, @RequestParam String variantId) {
        cartService.updateItemVariant(itemId, variantId);
        return ResponseEntity.ok("Đổi size thành công");
    }

    // Xóa sản phẩm: DELETE
    @DeleteMapping("/remove/{itemId}")
    public ResponseEntity<?> removeItem(@PathVariable String itemId) {
        cartService.deleteCartItem(itemId);
        return ResponseEntity.ok("Đã xóa");
    }
}