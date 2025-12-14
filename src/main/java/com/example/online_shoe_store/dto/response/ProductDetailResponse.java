package com.example.online_shoe_store.dto.response;

import lombok.*;

import java.math.BigDecimal;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ProductDetailResponse {
    private String productId;
    private String name;
    private String description;
    private BigDecimal price;

    // lưu path tương đối dưới /images/products/ (khuyến nghị)
    private String imageUrl;

    private String brandName;
    private String categoryName;

    private List<String> colors;
    private List<String> sizes;

    private List<VariantResponse> variants;

    @Getter
    @Setter
    @NoArgsConstructor
    @AllArgsConstructor
    @Builder
    public static class VariantResponse {
        private String variantId;
        private String size;
        private String color;
        private Integer stock;
        private String imageUrl; // path tương đối dưới /images/products/
    }
}
