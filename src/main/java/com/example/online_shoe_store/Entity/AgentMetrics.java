package com.example.online_shoe_store.Entity;

import com.example.online_shoe_store.Entity.enums.AgentType;
import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDate;

/**
 * Entity lưu metrics của từng agent theo ngày
 * Dùng cho monitoring và analytics
 */
@Entity
@Table(name = "agent_metrics", indexes = {
    @Index(name = "idx_metrics_agent", columnList = "agentType"),
    @Index(name = "idx_metrics_date", columnList = "date"),
    @Index(name = "idx_metrics_agent_date", columnList = "agentType, date", unique = true)
})
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AgentMetrics {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    /**
     * Agent type
     */
    @Enumerated(EnumType.STRING)
    @Column(nullable = false, length = 30)
    private AgentType agentType;
    
    /**
     * Ngày thống kê
     */
    @Column(nullable = false)
    private LocalDate date;
    
    // ═══════════════════════════════════════════
    // REQUEST METRICS
    // ═══════════════════════════════════════════
    
    /**
     * Tổng số requests
     */
    @Builder.Default
    private Long totalRequests = 0L;
    
    /**
     * Số requests thành công
     */
    @Builder.Default
    private Long successfulRequests = 0L;
    
    /**
     * Số requests thất bại
     */
    @Builder.Default
    private Long failedRequests = 0L;
    
    // ═══════════════════════════════════════════
    // PERFORMANCE METRICS
    // ═══════════════════════════════════════════
    
    /**
     * Thời gian response trung bình (ms)
     */
    @Builder.Default
    private Double avgResponseTimeMs = 0.0;
    
    /**
     * Thời gian response P95 (ms)
     */
    @Builder.Default
    private Double p95ResponseTimeMs = 0.0;
    
    /**
     * Thời gian response min (ms)
     */
    private Double minResponseTimeMs;
    
    /**
     * Thời gian response max (ms)
     */
    private Double maxResponseTimeMs;
    
    // ═══════════════════════════════════════════
    // QUALITY METRICS
    // ═══════════════════════════════════════════
    
    /**
     * Độ tin cậy trung bình của classification
     */
    @Builder.Default
    private Double avgConfidence = 0.0;
    
    /**
     * Số lần escalation
     */
    @Builder.Default
    private Long escalationCount = 0L;
    
    // ═══════════════════════════════════════════
    // TOKEN USAGE
    // ═══════════════════════════════════════════
    
    /**
     * Tổng tokens đã sử dụng
     */
    @Builder.Default
    private Long totalTokensUsed = 0L;
    
    /**
     * Tokens sử dụng cho thinking
     */
    @Builder.Default
    private Long thinkingTokensUsed = 0L;
    
    // ═══════════════════════════════════════════
    // HELPER METHODS
    // ═══════════════════════════════════════════
    
    /**
     * Tính success rate
     */
    public Double getSuccessRate() {
        if (totalRequests == 0) return 0.0;
        return (double) successfulRequests / totalRequests * 100;
    }
    
    /**
     * Tính error rate
     */
    public Double getErrorRate() {
        if (totalRequests == 0) return 0.0;
        return (double) failedRequests / totalRequests * 100;
    }
    
    /**
     * Tính escalation rate
     */
    public Double getEscalationRate() {
        if (totalRequests == 0) return 0.0;
        return (double) escalationCount / totalRequests * 100;
    }
    
    /**
     * Increment request count
     */
    public void incrementRequest(boolean success, long responseTimeMs, double confidence) {
        this.totalRequests++;
        if (success) {
            this.successfulRequests++;
        } else {
            this.failedRequests++;
        }
        
        // Update avg response time (rolling average)
        this.avgResponseTimeMs = ((this.avgResponseTimeMs * (totalRequests - 1)) + responseTimeMs) / totalRequests;
        
        // Update min/max
        if (this.minResponseTimeMs == null || responseTimeMs < this.minResponseTimeMs) {
            this.minResponseTimeMs = (double) responseTimeMs;
        }
        if (this.maxResponseTimeMs == null || responseTimeMs > this.maxResponseTimeMs) {
            this.maxResponseTimeMs = (double) responseTimeMs;
        }
        
        // Update avg confidence
        this.avgConfidence = ((this.avgConfidence * (totalRequests - 1)) + confidence) / totalRequests;
    }
    
    /**
     * Increment escalation count
     */
    public void incrementEscalation() {
        this.escalationCount++;
    }
    
    /**
     * Add token usage
     */
    public void addTokenUsage(long tokens, long thinkingTokens) {
        this.totalTokensUsed += tokens;
        this.thinkingTokensUsed += thinkingTokens;
    }
}
