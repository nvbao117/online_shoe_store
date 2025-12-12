package com.example.online_shoe_store.dto.request;

import lombok.Data;

import java.util.List;

@Data
public class ProductFilterRequest {
    List<String> prices;
    List<String> brands;
    List<String> sizes;
    List<String> genders;
}
