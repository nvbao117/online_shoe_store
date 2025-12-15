package com.example.online_shoe_store.Controller.page;

import com.example.online_shoe_store.Service.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
@RequiredArgsConstructor
public class ProductDetailPageController {

    private final ProductService productService;

    @GetMapping("/product-detail/{id}")
    public String productDetailPage(@PathVariable String id, Model model) {
        var product = productService.getDetail(id);

        model.addAttribute("product", product);
        model.addAttribute("productId", id);

        return "product-detail/product-detail";
    }

    @GetMapping("/product-detail")
    public String productDetailRoot() {
        return "redirect:/products";
    }
}
