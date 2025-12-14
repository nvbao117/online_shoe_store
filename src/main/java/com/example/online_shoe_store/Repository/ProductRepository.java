package com.example.online_shoe_store.Repository;

import com.example.online_shoe_store.Entity.Category;
import com.example.online_shoe_store.Entity.Product;
import com.example.online_shoe_store.dto.response.CategoryResponse;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface ProductRepository extends JpaRepository<Product, String>, JpaSpecificationExecutor<Product> {
    Optional<Product> findByName(String name);
    Optional<Product> findDetailById(String id);
    List<Product> findByCategoryCategoryId(String categoryId);

}
