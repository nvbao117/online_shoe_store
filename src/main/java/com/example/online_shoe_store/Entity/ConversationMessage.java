package com.example.online_shoe_store.Entity;

import com.example.online_shoe_store.Entity.enums.*;
import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;
import java.util.UUID;

/**
 * Entity lưu từng message trong conversation
 */
@Entity
@Table(name = "conversation_messages", indexes = {
    @Index(name = "idx_msg_conv", columnList = "conversation_id"),
    @Index(name = "idx_msg_intent", columnList = "primaryIntent"),
    @Index(name = "idx_msg_created", columnList = "createdAt"),
    @Index(name = "idx_msg_agent", columnList = "primaryAgent")
})
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString(exclude = {"conversation"})
public class ConversationMessage {
    
    @Id
    @Column(name = "message_id", length = 36)
    private String id;
    
    /**
     * Conversation chứa message này
     */
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "conversation_id", nullable = false)
    private Conversation conversation;
    
    // ═══════════════════════════════════════════
    // MESSAGE CONTENT
    // ═══════════════════════════════════════════
    
    /**
     * Role của message: USER, ASSISTANT, SYSTEM
     */
    @Enumerated(EnumType.STRING)
    @Column(nullable = false, length = 20)
    private MessageRole role;
    
    /**
     * Nội dung message
     */
    @Column(columnDefinition = "TEXT", nullable = false)
    private String content;
    
    // ═══════════════════════════════════════════
    // INTENT CLASSIFICATION RESULTS
    // ═══════════════════════════════════════════
    
    /**
     * Intent chính được detect
     */
    @Enumerated(EnumType.STRING)
    @Column(length = 30)
    private IntentType primaryIntent;
    
    /**
     * Sub-intent (chi tiết hơn)
     */
    @Column(length = 50)
    private String subIntent;
    
    /**
     * Entities được trích xuất (JSON format)
     */
    @Column(columnDefinition = "TEXT")
    private String extractedEntities;
    
    /**
     * Độ tin cậy của classification
     */
    private Double confidence;
    
    /**
     * Mức độ khẩn cấp
     */
    @Enumerated(EnumType.STRING)
    @Column(length = 20)
    private UrgencyLevel urgency;
    
    // ═══════════════════════════════════════════
    // ROUTING INFO
    // ═══════════════════════════════════════════
    
    /**
     * Agent chính đã xử lý
     */
    @Enumerated(EnumType.STRING)
    @Column(length = 30)
    private AgentType primaryAgent;
    
    /**
     * Các agents phụ đã xử lý (comma-separated)
     */
    @Column(length = 200)
    private String secondaryAgents;
    
    /**
     * Có chạy song song không
     */
    private Boolean wasParallel;
    
    /**
     * Mức độ rủi ro
     */
    @Enumerated(EnumType.STRING)
    @Column(length = 20)
    private RiskLevel riskLevel;
    
    /**
     * Có yêu cầu escalation không
     */
    @Builder.Default
    private Boolean requiredEscalation = false;
    
    // ═══════════════════════════════════════════
    // PERFORMANCE METRICS
    // ═══════════════════════════════════════════
    
    /**
     * Thời gian xử lý tổng (ms)
     */
    private Integer processingTimeMs;
    
    /**
     * Số tokens đã sử dụng cho thinking
     */
    private Integer thinkingTokensUsed;
    
    // ═══════════════════════════════════════════
    // TIMESTAMPS
    // ═══════════════════════════════════════════
    
    /**
     * Thời điểm tạo message
     */
    @Column(nullable = false)
    private LocalDateTime createdAt;
    
    @PrePersist
    protected void onCreate() {
        if (id == null) {
            id = UUID.randomUUID().toString();
        }
        if (createdAt == null) {
            createdAt = LocalDateTime.now();
        }
    }
    
    // ═══════════════════════════════════════════
    // HELPER METHODS
    // ═══════════════════════════════════════════
    
    /**
     * Kiểm tra message từ user
     */
    public boolean isFromUser() {
        return role == MessageRole.USER;
    }
    
    /**
     * Kiểm tra message từ assistant
     */
    public boolean isFromAssistant() {
        return role == MessageRole.ASSISTANT;
    }
    
    /**
     * Kiểm tra có intent được detect không
     */
    public boolean hasIntent() {
        return primaryIntent != null && primaryIntent != IntentType.UNKNOWN;
    }
}
