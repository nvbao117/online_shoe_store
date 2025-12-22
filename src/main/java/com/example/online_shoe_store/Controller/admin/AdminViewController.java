package com.example.online_shoe_store.Controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminViewController {
    @GetMapping("/dashboard")
    public String adminHome() {
        return "/admin/dashboard";
    }

    @GetMapping("/users")
    public String adminUsers() {
        return "/admin/users";
    }

    @GetMapping("/users/{id}")
    public String adminUserDetail() {
        return "/admin/user-detail";
    }

    @GetMapping("/products")
    public String adminProducts() {
        return "/admin/products";
    }
}
