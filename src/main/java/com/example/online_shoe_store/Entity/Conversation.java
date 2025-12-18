package com.example.online_shoe_store.Entity;

import com.example.online_shoe_store.Entity.enums.IntentType;
import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

/**
 * Entity lưu thông tin conversation/session chat
 */
@Entity
@Table(name = "conversations", indexes = {
    @Index(name = "idx_conv_session", columnList = "sessionId"),
    @Index(name = "idx_conv_user", columnList = "user_id"),
    @Index(name = "idx_conv_active", columnList = "isActive"),
    @Index(name = "idx_conv_started", columnList = "startedAt")
})
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString(exclude = {"user", "messages"})
public class Conversation {
    
    @Id
    @Column(name = "conversation_id", length = 36)
    private String id;
    
    /**
     * User liên kết (nullable cho guest users)
     */
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;
    
    /**
     * Session ID từ browser/client
     */
    @Column(nullable = false, unique = true, length = 100)
    private String sessionId;
    
    /**
     * Thời điểm bắt đầu conversation
     */
    @Column(nullable = false)
    private LocalDateTime startedAt;
    
    /**
     * Thời điểm tin nhắn cuối
     */
    private LocalDateTime lastMessageAt;
    
    /**
     * Intent cuối cùng được detect
     */
    @Enumerated(EnumType.STRING)
    @Column(length = 30)
    private IntentType lastPrimaryIntent;
    
    /**
     * Tổng số messages trong conversation
     */
    @Builder.Default
    private Integer messageCount = 0;
    
    /**
     * Conversation còn active không
     */
    @Builder.Default
    private Boolean isActive = true;
    
    /**
     * Có yêu cầu escalation trong conversation không
     */
    @Builder.Default
    private Boolean hasEscalation = false;

    /**
     * Tóm tắt hội thoại (rolling summary) để nén ngữ cảnh
     */
    @Column(columnDefinition = "TEXT")
    private String summary;

    /**
     * Số message đã được đưa vào summary lần gần nhất
     */
    @Builder.Default
    private Integer lastSummarizedCount = 0;
    
    /**
     * Danh sách messages
     */
    @OneToMany(mappedBy = "conversation", cascade = CascadeType.ALL, orphanRemoval = true)
    @Builder.Default
    private List<ConversationMessage> messages = new ArrayList<>();
    
    /**
     * Metadata bổ sung (JSON)
     */
    @Column(columnDefinition = "TEXT")
    private String metadata;
    
    @PrePersist
    protected void onCreate() {
        if (id == null) {
            id = UUID.randomUUID().toString();
        }
        if (startedAt == null) {
            startedAt = LocalDateTime.now();
        }
        if (lastMessageAt == null) {
            lastMessageAt = LocalDateTime.now();
        }
    }
    
    // ═══════════════════════════════════════════
    // HELPER METHODS
    // ═══════════════════════════════════════════
    
    /**
     * Thêm message vào conversation
     */
    public void addMessage(ConversationMessage message) {
        messages.add(message);
        message.setConversation(this);
        messageCount++;
        lastMessageAt = LocalDateTime.now();
    }
    
    /**
     * Kiểm tra conversation có messages không
     */
    public boolean hasMessages() {
        return messages != null && !messages.isEmpty();
    }
    
    /**
     * Lấy message cuối cùng
     */
    public ConversationMessage getLastMessage() {
        if (hasMessages()) {
            return messages.get(messages.size() - 1);
        }
        return null;
    }
    
    /**
     * Đánh dấu cần escalation
     */
    public void markEscalation() {
        this.hasEscalation = true;
    }
    
    /**
     * Deactivate conversation
     */
    public void deactivate() {
        this.isActive = false;
    }
}
