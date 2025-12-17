package com.example.online_shoe_store.dto.response;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductVariantDTO {
    private String variantId;
    private String size;
    private String color;
    private int stock;
}