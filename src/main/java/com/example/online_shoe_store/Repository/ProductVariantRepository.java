package com.example.online_shoe_store.Repository;

import com.example.online_shoe_store.Entity.ProductVariant;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductVariantRepository extends JpaRepository<ProductVariant, String>{
    List<ProductVariant> findByProductProductId(String productId);
}
