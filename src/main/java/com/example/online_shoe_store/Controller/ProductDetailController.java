package com.example.online_shoe_store.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ProductDetailController {
    //Mo giao dien chi tiet san pham
    @GetMapping("/product-detail")
    public String ShowProductDetailPage() {
        return "/product-detail/product-detail";
    }
}
