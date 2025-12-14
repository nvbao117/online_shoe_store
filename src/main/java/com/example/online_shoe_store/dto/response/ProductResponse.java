package com.example.online_shoe_store.dto.response;

import com.example.online_shoe_store.Entity.Product;
import lombok.*;

import java.math.BigDecimal;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ProductResponse {
    private String productId;
    private String name;
    private String imageUrl;
    private BigDecimal price;

    public static ProductResponse fromEntity(Product product) {
        ProductResponse res = new ProductResponse();
        res.setProductId(product.getProductId());
        res.setName(product.getName());
        res.setImageUrl(product.getImageUrl());
        res.setPrice(product.getPrice());
        return res;
    }
}
