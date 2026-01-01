package com.example.online_shoe_store.Entity;

import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.JdbcTypeCode;
import org.hibernate.type.SqlTypes;

import java.time.LocalDateTime;

/**
 * Entity lưu trữ state snapshot của conversation
 * Đây là bảng state - chứa trạng thái hiện tại để load nhanh
 */
@Entity
@Table(name = "conversation_state")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ConversationState {

    @Id
    @Column(name = "session_id", length = 100)
    private String sessionId;

    @Column(name = "version", nullable = false)
    private Integer version;

    @Column(name = "updated_at", nullable = false)
    private LocalDateTime updatedAt;

    @JdbcTypeCode(SqlTypes.JSON)
    @Column(name = "state_json", columnDefinition = "JSON")
    private String stateJson;

    @Column(name = "user_id", length = 36)
    private String userId;

    @Column(name = "guest_id", length = 100)
    private String guestId;

    @Column(name = "is_active")
    private Boolean isActive;

    @Column(name = "last_event_id", length = 36)
    private String lastEventId;

    @PrePersist
    @PreUpdate
    public void preUpdate() {
        if (updatedAt == null) {
            updatedAt = LocalDateTime.now();
        }
        if (version == null) {
            version = 1;
        }
        if (isActive == null) {
            isActive = true;
        }
    }

    /**
     * Tăng version khi cập nhật state
     */
    public void incrementVersion() {
        this.version = (this.version == null ? 0 : this.version) + 1;
        this.updatedAt = LocalDateTime.now();
    }
}
