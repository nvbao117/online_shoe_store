package com.example.online_shoe_store.Repository;

import com.example.online_shoe_store.Entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface ProductRepository extends JpaRepository<Product, String>, JpaSpecificationExecutor<Product> {

    Optional<Product> findByName(String name);

    @Query("""
        select distinct p
        from Product p
        left join fetch p.productVariants pv
        left join fetch p.brand b
        left join fetch p.category c
        where p.productId = :id
    """)
    Optional<Product> findDetailById(@Param("id") String id);

    List<Product> findByCategoryCategoryId(String categoryId);
}
