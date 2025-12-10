package com.example.online_shoe_store.Controller;

import com.example.online_shoe_store.Service.CartService;
import com.example.online_shoe_store.dto.response.CartItemResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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

        return "cart/index";
    }
}