package com.example.online_shoe_store.Service;


import com.example.online_shoe_store.Entity.Product;
import com.example.online_shoe_store.Repository.ProductRepository;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = lombok.AccessLevel.PRIVATE, makeFinal = true)

public class ProductService {
   ProductRepository productRepository;

   public List<Product> getAllProducts() {
        return productRepository.findAll();
   }

   public List<Product> getTop20Products() {
       return productRepository.findAll().stream().limit(20).toList();
   }
   public void getProductById(String id) {
       productRepository.findById(id);
   }

   public void getProductsByName(String name) {
       productRepository.findByName(name);
   }


}
