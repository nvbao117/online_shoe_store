package com.example.online_shoe_store.dto.response;

import com.example.online_shoe_store.Entity.Product;

import java.math.BigDecimal;

public class ProductSearchResultResponse {
    private final String productId;
    private final String name;
    private final String imageUrl;
    private final BigDecimal price;
    private final Double score;

    public ProductSearchResultResponse(String productId, String name, String imageUrl, BigDecimal price, Double score) {
        this.productId = productId;
        this.name = name;
        this.imageUrl = imageUrl;
        this.price = price;
        this.score = score;
    }

    public String getProductId() {
        return productId;
    }

    public String getName() {
        return name;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public Double getScore() {
        return score;
    }

    public static ProductSearchResultResponse fromEntity(Product product, Double score) {
        return new ProductSearchResultResponse(
                product.getProductId(),
                product.getName(),
                product.getImageUrl(),
                product.getPrice(),
                score
        );
    }
}
