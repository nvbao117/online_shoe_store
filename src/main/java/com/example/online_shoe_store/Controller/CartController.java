package com.example.online_shoe_store.Controller;

import com.example.online_shoe_store.Service.CartService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.List;

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
        // model.addAttribute("cartItems", cartService.getCartItemsByUsername(loginUsername));
        // model.addAttribute("cartItemCount", cartService.getCartItemCount(loginUsername));

        return "cart/index";
    }

    // Xử lý nút Mua hàng (POST) - redirect đến checkout step1
    @PostMapping("/checkout")
    public String processCheckout(@RequestParam("selectedItems") List<String> selectedItems,
                                  HttpSession session) {
        if (selectedItems == null || selectedItems.isEmpty()) {
            return "redirect:/templates/cart";
        }
        // Lưu selected items vào session để checkout có thể đọc
        session.setAttribute("selectedCartItems", selectedItems);
        return "redirect:/checkout/step1";
    }
}