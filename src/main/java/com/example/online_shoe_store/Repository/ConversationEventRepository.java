package com.example.online_shoe_store.Repository;

import com.example.online_shoe_store.Entity.ConversationEvent;
import com.example.online_shoe_store.Entity.enums.ConversationEventType;
import com.example.online_shoe_store.Entity.enums.RiskLevel;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;

@Repository
public interface ConversationEventRepository extends JpaRepository<ConversationEvent, String> {

    /**
     * Lấy tất cả events của session theo thứ tự thời gian
     */
    List<ConversationEvent> findBySessionIdOrderByCreatedAtAsc(String sessionId);

    /**
     * Lấy events của session theo thứ tự thời gian giảm dần (mới nhất trước)
     */
    List<ConversationEvent> findBySessionIdOrderByCreatedAtDesc(String sessionId);

    /**
     * Lấy N events gần nhất của session
     */
    @Query("SELECT e FROM ConversationEvent e WHERE e.sessionId = :sessionId ORDER BY e.createdAt DESC")
    List<ConversationEvent> findRecentEvents(@Param("sessionId") String sessionId, Pageable pageable);

    /**
     * Lấy events theo loại
     */
    List<ConversationEvent> findBySessionIdAndTypeOrderByCreatedAtAsc(
        String sessionId, ConversationEventType type);

    /**
     * Lấy events của user
     */
    List<ConversationEvent> findByUserIdOrderByCreatedAtDesc(String userId);

    /**
     * Lấy events của guest
     */
    List<ConversationEvent> findByGuestIdOrderByCreatedAtDesc(String guestId);

    /**
     * Lấy events theo trace ID (cho debugging)
     */
    List<ConversationEvent> findByTraceIdOrderByCreatedAtAsc(String traceId);

    /**
     * Lấy events có risk level cao
     */
    List<ConversationEvent> findByRiskLevelOrderByCreatedAtDesc(RiskLevel riskLevel);

    /**
     * Đếm events trong khoảng thời gian
     */
    @Query("SELECT COUNT(e) FROM ConversationEvent e WHERE e.createdAt BETWEEN :start AND :end")
    long countByCreatedAtBetween(@Param("start") LocalDateTime start, @Param("end") LocalDateTime end);

    /**
     * Thống kê events theo type
     */
    @Query("SELECT e.type, COUNT(e) FROM ConversationEvent e " +
           "WHERE e.createdAt BETWEEN :start AND :end GROUP BY e.type")
    List<Object[]> countByTypeBetween(@Param("start") LocalDateTime start, @Param("end") LocalDateTime end);

    /**
     * Lấy events sau một event cụ thể (để replay từ checkpoint)
     */
    @Query("SELECT e FROM ConversationEvent e WHERE e.sessionId = :sessionId " +
           "AND e.createdAt > (SELECT e2.createdAt FROM ConversationEvent e2 WHERE e2.eventId = :afterEventId) " +
           "ORDER BY e.createdAt ASC")
    List<ConversationEvent> findEventsAfter(@Param("sessionId") String sessionId, @Param("afterEventId") String afterEventId);

    /**
     * Phân trang events của session
     */
    Page<ConversationEvent> findBySessionIdOrderByCreatedAtDesc(String sessionId, Pageable pageable);

    /**
     * Lấy event cuối cùng của session
     */
    @Query("SELECT e FROM ConversationEvent e WHERE e.sessionId = :sessionId ORDER BY e.createdAt DESC LIMIT 1")
    ConversationEvent findLastEventBySessionId(@Param("sessionId") String sessionId);

    /**
     * Tìm sessions có events trong khoảng thời gian
     */
    @Query("SELECT DISTINCT e.sessionId FROM ConversationEvent e WHERE e.createdAt BETWEEN :start AND :end")
    List<String> findActiveSessionsBetween(@Param("start") LocalDateTime start, @Param("end") LocalDateTime end);
}
