package com.example.online_shoe_store.dto.response;

import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class BrandResponse {
    private String brandId;
    private String name;
}
