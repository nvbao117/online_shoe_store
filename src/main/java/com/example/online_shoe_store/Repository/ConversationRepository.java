package com.example.online_shoe_store.Repository;

import com.example.online_shoe_store.Entity.Conversation;
import com.example.online_shoe_store.Entity.ConversationMessage;
import com.example.online_shoe_store.Entity.enums.IntentType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Repository
public interface ConversationRepository extends JpaRepository<Conversation, String> {
    
    /**
     * Tìm conversation theo session ID
     */
    Optional<Conversation> findBySessionId(String sessionId);
    
    /**
     * Tìm conversation đang active theo session ID
     */
    Optional<Conversation> findBySessionIdAndIsActiveTrue(String sessionId);
    
    /**
     * Tìm tất cả conversations của user
     */
    List<Conversation> findByUserUserIdOrderByStartedAtDesc(String userId);
    
    /**
     * Tìm conversations đang active của user
     */
    List<Conversation> findByUserUserIdAndIsActiveTrueOrderByLastMessageAtDesc(String userId);
    
    /**
     * Tìm conversations có escalation
     */
    List<Conversation> findByHasEscalationTrueOrderByLastMessageAtDesc();
    
    /**
     * Tìm conversations theo intent cuối
     */
    /**
     * Đếm conversations đang active
     */
    long countByIsActiveTrue();

    /**
     * Đếm conversations trong khoảng thời gian
     */
    @Query("SELECT COUNT(c) FROM Conversation c WHERE c.startedAt BETWEEN :start AND :end")
    long countByStartedAtBetween(@Param("start") LocalDateTime start, @Param("end") LocalDateTime end);
    
    /**
     * Tìm conversations không active quá X phút (để cleanup)
     */
    @Query("SELECT c FROM Conversation c WHERE c.isActive = true AND c.lastMessageAt < :threshold")
    List<Conversation> findStaleConversations(@Param("threshold") LocalDateTime threshold);
    
    /**
     * Thống kê conversations theo intent
     */
    @Query("SELECT c.lastPrimaryIntent, COUNT(c) FROM Conversation c GROUP BY c.lastPrimaryIntent")
    List<Object[]> countByIntent();
}
