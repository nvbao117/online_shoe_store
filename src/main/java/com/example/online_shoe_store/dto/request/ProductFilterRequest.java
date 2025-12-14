package com.example.online_shoe_store.dto.request;

import jakarta.persistence.Access;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductFilterRequest {
    List<String> prices;
    List<String> brands;
    List<String> sizes;
    List<String> genders;
    String sortBy;
}
