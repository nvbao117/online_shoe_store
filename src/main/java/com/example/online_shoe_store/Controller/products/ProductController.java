package com.example.online_shoe_store.Controller.products;

import com.example.online_shoe_store.Entity.Product;
import com.example.online_shoe_store.Repository.ProductRepository;
import com.example.online_shoe_store.Service.ProductService;
import com.example.online_shoe_store.dto.request.ProductFilterRequest;
import com.example.online_shoe_store.dto.response.ProductResponse;
import com.example.online_shoe_store.specification.ProductSpecification;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/products")
@FieldDefaults(level = lombok.AccessLevel.PRIVATE, makeFinal = true)
public class ProductController {
    ProductService productService;
// tamj để sửa sau
    ProductRepository productRepository;

    // Lấy sản phẩm theo categoryId (nếu có)
    @GetMapping
    public List<ProductResponse> getProductsByCategory(
           @RequestParam(required = false) String categoryId) {
        if (categoryId.equals("21112005")) {
            return productService.getTop20Products();
        }
        return productService.getProductsByCategory(categoryId);
    }

    @PostMapping("/filter")
    public List<ProductResponse> filterProducts(@RequestBody ProductFilterRequest request) {
        List<Product> products = productRepository.findAll(ProductSpecification.filter(request));
        return products.stream()
                .map(ProductResponse::fromEntity)
                .collect(Collectors.toList());
    }


}
