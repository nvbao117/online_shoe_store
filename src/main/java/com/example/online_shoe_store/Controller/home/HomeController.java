package com.example.online_shoe_store.Controller.home;

import com.example.online_shoe_store.Service.CategoryService;
import com.example.online_shoe_store.Service.ProductService;
import com.example.online_shoe_store.dto.response.CategoryResponse;
import com.example.online_shoe_store.dto.response.ProductResponse;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api")
@RequiredArgsConstructor
@FieldDefaults(level = lombok.AccessLevel.PRIVATE, makeFinal = true)
public class HomeController {
    ProductService productService;
    CategoryService categoryService;

    @GetMapping("/new-products")
    public List<ProductResponse> getNewProducts() {
        return productService.getTop20Products();
    }

    @GetMapping("/category")
    public List<CategoryResponse> getCategories() {
        return categoryService.getAllCategoriesResponses();
    }



}
