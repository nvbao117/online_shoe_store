package com.example.online_shoe_store.Repository;

import com.example.online_shoe_store.Entity.ShipDetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface ShipDetailRepository extends JpaRepository<ShipDetail, String> {
    Optional<ShipDetail> findByUserUserIdAndIsDefaultTrue(String userId);
    
    List<ShipDetail> findByUserUserId(String userId);
}
