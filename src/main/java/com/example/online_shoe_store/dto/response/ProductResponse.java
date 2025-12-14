package com.example.online_shoe_store.dto.response;

import lombok.*;

@Getter @Setter
@NoArgsConstructor @AllArgsConstructor
@Builder
public class ProductResponse {
    private String productId;
    private String name;
    private String imageUrl;
    private double price;
}