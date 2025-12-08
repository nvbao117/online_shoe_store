package com.example.online_shoe_store.Repository;

import com.example.online_shoe_store.Entity.Brand;
import com.example.online_shoe_store.Entity.Cart;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CartRepository extends JpaRepository<Cart, String> {
}
