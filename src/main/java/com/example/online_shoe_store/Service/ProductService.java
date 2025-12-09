package com.example.online_shoe_store.Service;


import com.example.online_shoe_store.Entity.Product;
import com.example.online_shoe_store.Repository.ProductRepository;
import com.example.online_shoe_store.dto.response.ProductResponse;
import com.example.online_shoe_store.mapper.ProductMapper;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = lombok.AccessLevel.PRIVATE, makeFinal = true)

public class ProductService {
   ProductRepository productRepository;
   ProductMapper productMapper;

   public List<Product> getAllProducts() {
        return productRepository.findAll();
   }

   public List<ProductResponse> getTop20Products() {

       return  productMapper.toProductResponsesList(productRepository.findAll().stream().limit(20).toList());
   }
   public void getProductById(String id) {
       productRepository.findById(id);
   }

   public void getProductsByName(String name) {
       productRepository.findByName(name);
   }


}
