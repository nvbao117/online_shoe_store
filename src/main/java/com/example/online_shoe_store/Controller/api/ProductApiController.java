package com.example.online_shoe_store.Controller.api;

import com.example.online_shoe_store.Service.ProductService;
import com.example.online_shoe_store.dto.response.ProductDetailResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/products")
@RequiredArgsConstructor
public class ProductApiController {

    private final ProductService productService;

    @GetMapping("/{id}")
    public ProductDetailResponse getDetail(@PathVariable String id) {
        return productService.getDetail(id);
    }
}