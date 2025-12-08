package com.example.online_shoe_store.Repository;

import com.example.online_shoe_store.Entity.ReviewImage;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ReviewImageRepository extends JpaRepository<ReviewImage, String> {
}
