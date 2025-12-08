package com.example.online_shoe_store.Repository;

import com.example.online_shoe_store.Entity.ProductVariant;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductVariantRepository extends JpaRepository<ProductVariant, String>{
}
