package com.example.online_shoe_store.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {
    //Mo giao dien login khi truy cap /login
    @GetMapping("/login")
    public String showLoginPage() {
        return "/login/login";
    }

    //Trang Register
    @GetMapping("/register")
    public String showRegisterPage() {
        return "/login/register";
    }

    //Trang ForgotPass
    @GetMapping("/forgot-password")
    public String showForgotPasswordPage() {
        return "/login/forgot-password";
    }
}
