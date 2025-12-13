package com.example.online_shoe_store.Controller;

import com.example.online_shoe_store.Service.CartService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.List;

@Controller
@RequestMapping("/cart")
@RequiredArgsConstructor
public class CartController {
    private final CartService cartService;

    @GetMapping
    public String showCartPage(Model model, Principal principal) {
        // Lấy tên User thật sự đang đăng nhập
        //if (principal == null) return "redirect:/login"; // Nếu chưa login thì đuổi ra trang login

        //String loginUsername = principal.getName();

        // test voi tk othien
        String loginUsername = (principal != null) ? principal.getName() : "othien";

        model.addAttribute("username", cartService.getUserFullName(loginUsername));
        model.addAttribute("cartItems", cartService.getCartItemsByUsername(loginUsername));
        return "cart/index";
    }
}