package com.example.online_shoe_store.Controller;

import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Controller
@RequestMapping("/")
@RequiredArgsConstructor
@FieldDefaults(level = lombok.AccessLevel.PRIVATE, makeFinal = true)
public class HomeViewController {

    @GetMapping("/home")
    public String home() {
        return "/home/home";
    }
    @GetMapping("/products")
    public String produtcs() {
        return "/products/product-list";
    }

    @GetMapping("/sale-off")
    public String saleOff() {
        return "/products/saleOf-list";
    }

    // gio hang duoc lay ben cart controller



}
