package com.example.online_shoe_store.Repository;

import com.example.online_shoe_store.Entity.Order;
import com.example.online_shoe_store.Entity.User;
import com.example.online_shoe_store.Entity.enums.OrderStatus;
import com.example.online_shoe_store.dto.response.OrderResponse;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface OrderRepository extends JpaRepository<Order, String> {
    java.util.List<Order> findByUserOrderByCreatedAtDesc(com.example.online_shoe_store.Entity.User user);
    List<Order> findFirstByUserAndStatusOrderByCreatedAtDesc(
            User user,
            OrderStatus status
    );

}
