package com.example.online_shoe_store.Controller.api;

import com.example.online_shoe_store.Service.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/products")
@RequiredArgsConstructor
public class ProductApiController {

    private final ProductService productService;

    @GetMapping("/{id}")
    public ResponseEntity<?> getDetail(@PathVariable String id) {
        return ResponseEntity.ok(productService.getDetail(id));
    }
}
