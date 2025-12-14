package com.example.online_shoe_store.Repository;

import com.example.online_shoe_store.Entity.Product;
import org.springframework.data.jpa.repository.*;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface ProductRepository extends JpaRepository<Product, String> {

    Optional<Product> findByName(String name);

    @Query("""
        select distinct p from Product p
        left join fetch p.brand
        left join fetch p.category
        left join fetch p.productVariants v
        where p.productId = :id
    """)
    Optional<Product> findDetailById(@Param("id") String id);
}
