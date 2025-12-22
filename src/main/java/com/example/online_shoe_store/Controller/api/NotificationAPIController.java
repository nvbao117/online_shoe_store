package com.example.online_shoe_store.Controller.api;

import com.example.online_shoe_store.Entity.User;
import com.example.online_shoe_store.Repository.UserRepository;
import com.example.online_shoe_store.Service.UserNotificationService;
import com.example.online_shoe_store.dto.response.NotificationResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/notifications")
@RequiredArgsConstructor
public class NotificationAPIController {

    private final UserNotificationService notificationService;
    private final UserRepository userRepository;

    @GetMapping
    public ResponseEntity<List<NotificationResponse>> getNotifications() {
        User user = getCurrentUser();
        if (user == null) {
            return ResponseEntity.status(401).build();
        }

        List<NotificationResponse> notifications = notificationService.getNotifications(user.getUserId());
        return ResponseEntity.ok(notifications);
    }

    @GetMapping("/unread-count")
    public ResponseEntity<Map<String, Long>> getUnreadCount() {
        User user = getCurrentUser();
        if (user == null) {
            return ResponseEntity.status(401).build();
        }

        long count = notificationService.getUnreadCount(user.getUserId());
        return ResponseEntity.ok(Map.of("count", count));
    }

    @PutMapping("/{id}/read")
    public ResponseEntity<Void> markAsRead(@PathVariable String id) {
        User user = getCurrentUser();
        if (user == null) {
            return ResponseEntity.status(401).build();
        }

        notificationService.markAsRead(id);
        return ResponseEntity.ok().build();
    }

    @PutMapping("/read-all")
    public ResponseEntity<Void> markAllAsRead() {
        User user = getCurrentUser();
        if (user == null) {
            return ResponseEntity.status(401).build();
        }

        notificationService.markAllAsRead(user.getUserId());
        return ResponseEntity.ok().build();
    }

    private User getCurrentUser() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null && auth.isAuthenticated() && !"anonymousUser".equals(auth.getPrincipal())) {
            String username = auth.getName();
            return userRepository.findByUsername(username).orElse(null);
        }
        return null;
    }
}
