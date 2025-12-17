package com.example.online_shoe_store.config;

import com.example.online_shoe_store.Service.CartService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

@ControllerAdvice
@RequiredArgsConstructor
public class GlobalControllerAdvice {

    private final CartService cartService;

    // Hàm này sẽ tự động chạy trước mọi Request trả về view (HTML)
    @ModelAttribute("cartItemCount")
    public int globalCartItemCount() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();

        // Nếu chưa đăng nhập -> trả về 0
        if (auth == null || !auth.isAuthenticated() || auth instanceof AnonymousAuthenticationToken) {
            return 0;
        }

        // Nếu đã đăng nhập -> Gọi service lấy số lượng
        return cartService.getCartItemCount(auth.getName());
    }
}