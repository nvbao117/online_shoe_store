package com.example.online_shoe_store.Controller;

import com.example.online_shoe_store.Service.CartService;
import com.example.online_shoe_store.dto.response.CartItemResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.*;
import org.springframework.http.ResponseEntity;

import java.util.Map;

import java.math.BigDecimal;
import java.util.List;

@Controller
@RequestMapping("/cart")
@RequiredArgsConstructor
public class CartController {

    private final CartService cartService;

    @GetMapping
    public String showCartPage(Model model) {
        // --- CẬP NHẬT: User hiện tại là "othien" ---
        String currentUsername = "othien";

        // Lấy dữ liệu giỏ hàng của othien
        List<CartItemResponse> cartItems = cartService.getCartItemsByUsername(currentUsername);

        // Tính tổng tiền
        BigDecimal grandTotal = cartService.getCartTotal(cartItems);

        // Đẩy dữ liệu sang HTML
        model.addAttribute("cartItems", cartItems);
        model.addAttribute("grandTotal", grandTotal);
        model.addAttribute("totalItems", cartItems.size());
        model.addAttribute("username", currentUsername);

        return "cart/index";
    }

    // API: Tăng giảm số lượng
    @PostMapping("/update-quantity")
    @ResponseBody
    public ResponseEntity<?> updateQuantity(@RequestParam String itemId, @RequestParam int quantity) {
        cartService.updateItemQuantity(itemId, quantity);
        return ResponseEntity.ok(Map.of("message", "Updated successfully"));
    }

    // API: Xóa sản phẩm
    @PostMapping("/remove")
    @ResponseBody
    public ResponseEntity<?> removeItem(@RequestParam String itemId) {
        cartService.deleteCartItem(itemId);
        return ResponseEntity.ok(Map.of("message", "Deleted successfully"));
    }

    // API: Đổi phân loại (Size/Màu)
    // Lưu ý: Frontend cần gửi variantId mới lên
    @PostMapping("/update-variant")
    @ResponseBody
    public ResponseEntity<?> updateVariant(@RequestParam String itemId, @RequestParam String newVariantId) {
        cartService.updateItemVariant(itemId, newVariantId);
        return ResponseEntity.ok(Map.of("message", "Variant updated successfully"));
    }
}