package com.example.online_shoe_store.Service;

import com.example.online_shoe_store.Entity.Notification;
import com.example.online_shoe_store.Entity.User;
import com.example.online_shoe_store.Entity.enums.NotificationType;
import com.example.online_shoe_store.Repository.NotificationRepository;
import com.example.online_shoe_store.dto.response.NotificationResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Service
@Slf4j
@RequiredArgsConstructor
public class UserNotificationService {

    private final NotificationRepository notificationRepository;

    public List<NotificationResponse> getNotifications(String userId) {
        return notificationRepository.findByUserUserIdOrderByCreatedAtDesc(userId)
                .stream()
                .map(this::toResponse)
                .collect(Collectors.toList());
    }

    public long getUnreadCount(String userId) {
        return notificationRepository.countByUserUserIdAndIsReadFalse(userId);
    }

    @Transactional
    public void markAsRead(String notificationId) {
        notificationRepository.findById(notificationId).ifPresent(notification -> {
            notification.setIsRead(true);
            notificationRepository.save(notification);
        });
    }

    @Transactional
    public void markAllAsRead(String userId) {
        notificationRepository.markAllAsReadByUserId(userId);
    }

    @Transactional
    public Notification createNotification(User user, NotificationType type, String title, String message, String icon,
            String relatedOrderId) {
        Notification notification = Notification.builder()
                .user(user)
                .type(type)
                .title(title)
                .message(message)
                .icon(icon != null ? icon : getDefaultIcon(type))
                .relatedOrderId(relatedOrderId)
                .build();

        return notificationRepository.save(notification);
    }

    private String getDefaultIcon(NotificationType type) {
        return switch (type) {
            case ORDER_UPDATE -> "🚚";
            case PROMOTION -> "🎁";
            case SYSTEM -> "🔔";
        };
    }

    private NotificationResponse toResponse(Notification notification) {
        return NotificationResponse.builder()
                .id(notification.getNotificationId())
                .type(notification.getType())
                .title(notification.getTitle())
                .message(notification.getMessage())
                .icon(notification.getIcon())
                .isRead(notification.getIsRead())
                .createdAt(notification.getCreatedAt())
                .relatedOrderId(notification.getRelatedOrderId())
                .build();
    }
}
