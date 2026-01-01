package com.example.online_shoe_store.Entity;

import com.example.online_shoe_store.Entity.enums.ConversationEventType;
import com.example.online_shoe_store.Entity.enums.RiskLevel;
import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.JdbcTypeCode;
import org.hibernate.type.SqlTypes;

import java.time.LocalDateTime;
import java.util.UUID;

/**
 * Entity lưu trữ events của conversation (append-only)
 * Đây là bảng event sourcing - chỉ thêm mới, không sửa/xóa
 */
@Entity
@Table(name = "conversation_events", indexes = {
    @Index(name = "idx_conv_events_session", columnList = "session_id"),
    @Index(name = "idx_conv_events_user", columnList = "user_id"),
    @Index(name = "idx_conv_events_guest", columnList = "guest_id"),
    @Index(name = "idx_conv_events_type", columnList = "type"),
    @Index(name = "idx_conv_events_created", columnList = "created_at"),
    @Index(name = "idx_conv_events_trace", columnList = "trace_id")
})
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ConversationEvent {

    @Id
    @Column(name = "event_id", length = 36)
    private String eventId;

    @Column(name = "session_id", nullable = false, length = 100)
    private String sessionId;

    @Column(name = "user_id", length = 36)
    private String userId;

    @Column(name = "guest_id", length = 100)
    private String guestId;

    @Enumerated(EnumType.STRING)
    @Column(name = "type", nullable = false, length = 50)
    private ConversationEventType type;

    @Column(name = "created_at", nullable = false)
    private LocalDateTime createdAt;

    @JdbcTypeCode(SqlTypes.JSON)
    @Column(name = "payload_json", columnDefinition = "JSON")
    private String payloadJson;

    @Column(name = "trace_id", length = 64)
    private String traceId;

    @Column(name = "span_id", length = 32)
    private String spanId;

    @Enumerated(EnumType.STRING)
    @Column(name = "risk_level", length = 20)
    private RiskLevel riskLevel;

    @Column(name = "agent_type", length = 50)
    private String agentType;

    @Column(name = "processing_time_ms")
    private Integer processingTimeMs;

    @PrePersist
    public void prePersist() {
        if (eventId == null) {
            eventId = UUID.randomUUID().toString();
        }
        if (createdAt == null) {
            createdAt = LocalDateTime.now();
        }
    }
}
