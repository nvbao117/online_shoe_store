package com.example.online_shoe_store.Repository;

import com.example.online_shoe_store.Entity.ConversationState;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Repository
public interface ConversationStateRepository extends JpaRepository<ConversationState, String> {

    /**
     * Tìm state active của session
     */
    Optional<ConversationState> findBySessionIdAndIsActiveTrue(String sessionId);

    /**
     * Tìm states của user
     */
    List<ConversationState> findByUserIdAndIsActiveTrue(String userId);

    /**
     * Tìm states của guest
     */
    List<ConversationState> findByGuestIdAndIsActiveTrue(String guestId);

    /**
     * Tìm sessions không hoạt động (stale)
     */
    @Query("SELECT s FROM ConversationState s WHERE s.isActive = true AND s.updatedAt < :threshold")
    List<ConversationState> findStaleStates(@Param("threshold") LocalDateTime threshold);

    /**
     * Đánh dấu session không còn active
     */
    @Modifying
    @Query("UPDATE ConversationState s SET s.isActive = false, s.updatedAt = :now WHERE s.sessionId = :sessionId")
    int deactivateSession(@Param("sessionId") String sessionId, @Param("now") LocalDateTime now);

    /**
     * Đếm sessions active
     */
    @Query("SELECT COUNT(s) FROM ConversationState s WHERE s.isActive = true")
    long countActiveSessions();

    /**
     * Cập nhật state với optimistic locking (kiểm tra version)
     */
    @Modifying
    @Query("UPDATE ConversationState s SET s.stateJson = :stateJson, s.version = s.version + 1, " +
           "s.updatedAt = :now, s.lastEventId = :lastEventId " +
           "WHERE s.sessionId = :sessionId AND s.version = :expectedVersion")
    int updateStateWithVersion(
        @Param("sessionId") String sessionId,
        @Param("stateJson") String stateJson,
        @Param("lastEventId") String lastEventId,
        @Param("expectedVersion") Integer expectedVersion,
        @Param("now") LocalDateTime now);

    /**
     * Tìm states cần cleanup (inactive và quá cũ)
     */
    @Query("SELECT s FROM ConversationState s WHERE s.isActive = false AND s.updatedAt < :threshold")
    List<ConversationState> findStatesToCleanup(@Param("threshold") LocalDateTime threshold);
}
