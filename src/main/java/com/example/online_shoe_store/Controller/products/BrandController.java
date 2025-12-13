package com.example.online_shoe_store.Controller.products;

import com.example.online_shoe_store.Service.BrandService;
import com.example.online_shoe_store.Service.ProductService;
import com.example.online_shoe_store.dto.response.BrandResponse;
import com.example.online_shoe_store.dto.response.ProductResponse;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/brands")
@RequiredArgsConstructor
@FieldDefaults(level = lombok.AccessLevel.PRIVATE, makeFinal = true)
public class BrandController {
    BrandService brandService;

    @GetMapping()
    public List<BrandResponse> getBrandByCategoryId(@RequestParam(required = false) String categoryId) {
        return brandService.getBrandsByCategoryId(categoryId);
    }
}
