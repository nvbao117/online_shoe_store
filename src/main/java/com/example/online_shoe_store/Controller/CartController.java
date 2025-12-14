package com.example.online_shoe_store.Controller;

import com.example.online_shoe_store.Service.CartService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.security.Principal;

@Controller
@RequestMapping("/templates/cart")
@RequiredArgsConstructor
public class CartController {
    private final CartService cartService;

    @GetMapping
    public String showCartPage(Model model, Principal principal) {
        if (principal == null) {
            return "redirect:/login";
        }

        String loginUsername = principal.getName();

        model.addAttribute("username", cartService.getUserFullName(loginUsername));
        model.addAttribute("cartItems", cartService.getCartItemsByUsername(loginUsername));
        return "cart/index"; // Vẫn trả về file tại src/main/resources/templates/cart/index.html
    }

    // Xử lý nút Mua hàng (POST)
    @PostMapping("/checkout")
    public String processCheckout(@RequestParam("selectedItems") java.util.List<String> selectedItems, Model model) {
        if (selectedItems == null || selectedItems.isEmpty()) {
            return "redirect:/templates/cart";
        }
        model.addAttribute("items", selectedItems);
        return "checkout/index";
    }
}