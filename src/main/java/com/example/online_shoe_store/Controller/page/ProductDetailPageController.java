package com.example.online_shoe_store.Controller.page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;


@Controller
public class ProductDetailPageController {

    @GetMapping("/product-detail/{id}")
    public String productDetailPage(@PathVariable String id) {
        return "product-detail/product-detail";
    }

    @GetMapping("/product-detail")
    public String productDetailRoot() {
        return "redirect:/products";
    }
}
