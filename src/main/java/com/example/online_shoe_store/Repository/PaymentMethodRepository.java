package com.example.online_shoe_store.Repository;

import com.example.online_shoe_store.Entity.PaymentMethod;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface PaymentMethodRepository extends JpaRepository<PaymentMethod, String> {
    
    Optional<PaymentMethod> findByMethodName(String methodName);
    
    List<PaymentMethod> findByIsActiveTrue();
}

