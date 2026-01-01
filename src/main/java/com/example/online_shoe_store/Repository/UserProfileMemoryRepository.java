package com.example.online_shoe_store.Repository;

import com.example.online_shoe_store.Entity.UserProfileMemory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserProfileMemoryRepository extends JpaRepository<UserProfileMemory, Long> {
    
    Optional<UserProfileMemory> findByUserId(String userId);
    
    boolean existsByUserId(String userId);
    
    @Modifying
    @Query("UPDATE UserProfileMemory u SET u.profileJson = :profileJson, u.updatedAt = CURRENT_TIMESTAMP WHERE u.userId = :userId")
    int updateProfileJson(String userId, String profileJson);
    
    @Modifying
    @Query("UPDATE UserProfileMemory u SET u.conversationCount = u.conversationCount + 1, u.lastActiveAt = CURRENT_TIMESTAMP WHERE u.userId = :userId")
    int incrementConversationCount(String userId);
    
    @Modifying
    @Query("UPDATE UserProfileMemory u SET u.orderCount = u.orderCount + 1 WHERE u.userId = :userId")
    int incrementOrderCount(String userId);
}
