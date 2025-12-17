package com.example.online_shoe_store.Repository;

import com.example.online_shoe_store.Entity.ShipDetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ShipDetailRepository extends JpaRepository<ShipDetail, String> {
}
