package com.example.online_shoe_store.mapper;

import com.example.online_shoe_store.Entity.Product;
import com.example.online_shoe_store.dto.response.ProductResponse;
import org.mapstruct.Mapper;

import java.util.List;

@Mapper(componentModel = "spring")
public interface ProductMapper {
    ProductResponse toProductResponse (Product product);
    List<ProductResponse> toProductResponsesList (List<Product> products);

}
