package com.example.online_shoe_store.dto.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ImageSearchResult {
    private String productId;
    private Double similarity;
    private String imageUrl;
    
    // Enriched fields from database
    private String productName;
    private String price;
    private String brandName;
    private String categoryName;
}
