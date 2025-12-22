package com.example.online_shoe_store.Repository;

import com.example.online_shoe_store.Entity.Notification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface NotificationRepository extends JpaRepository<Notification, String> {

    List<Notification> findByUserUserIdOrderByCreatedAtDesc(String userId);

    List<Notification> findByUserUserIdAndIsReadFalseOrderByCreatedAtDesc(String userId);

    long countByUserUserIdAndIsReadFalse(String userId);

    @Modifying
    @Query("UPDATE Notification n SET n.isRead = true WHERE n.user.userId = :userId")
    void markAllAsReadByUserId(@Param("userId") String userId);
}
