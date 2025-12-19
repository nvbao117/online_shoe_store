package com.example.online_shoe_store.Controller.home;

import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
@RequiredArgsConstructor
@FieldDefaults(level = lombok.AccessLevel.PRIVATE, makeFinal = true)
public class HomeViewController {

    // Redirect root to /home
    @GetMapping
    public String root() {
        return "redirect:/home";
    }

    @GetMapping("/home")
    public String home() {
        return "/home/home";
    }
    @GetMapping("/products")
    public String produtcs() {
        return "/products/product-list";
    }

    @GetMapping("/about")
    public String about() {
        return "/about_contact/about";
    }

    @GetMapping("/contact")
    public String contact() {
        return "/about_contact/contact";
    }
    // gio hang duoc lay ben cart controller



}
