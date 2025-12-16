package com.example.online_shoe_store.Service.ai.execution;

import com.example.online_shoe_store.Entity.AgentMetrics;
import com.example.online_shoe_store.Repository.AgentMetricsRepository;
import com.example.online_shoe_store.Entity.enums.AgentType;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

/**
 * Service quản lý metrics cho monitoring
 */
@Service
@Slf4j
@RequiredArgsConstructor
public class MetricsService {
    
    private final AgentMetricsRepository metricsRepository;
    
    /**
     * Record một request thành công/thất bại
     */
    @Async
    @Transactional
    public void recordRequest(AgentType agentType,
                               long responseTimeMs,
                               boolean success,
                               Double confidence) {
        
        LocalDate today = LocalDate.now();
        
        AgentMetrics metrics = metricsRepository
            .findByAgentTypeAndDate(agentType, today)
            .orElse(AgentMetrics.builder()
                .agentType(agentType)
                .date(today)
                .build());
        
        metrics.incrementRequest(success, responseTimeMs, confidence != null ? confidence : 0.0);
        metricsRepository.save(metrics);
        
        log.debug("Recorded request for {}: success={}, time={}ms", agentType, success, responseTimeMs);
    }
    
    /**
     * Record escalation
     */
    @Async
    @Transactional
    public void recordEscalation(AgentType agentType) {
        LocalDate today = LocalDate.now();
        
        AgentMetrics metrics = metricsRepository
            .findByAgentTypeAndDate(agentType, today)
            .orElse(AgentMetrics.builder()
                .agentType(agentType)
                .date(today)
                .build());
        
        metrics.incrementEscalation();
        metricsRepository.save(metrics);
        
        log.debug("Recorded escalation for {}", agentType);
    }
    
    /**
     * Record token usage
     */
    @Async
    @Transactional
    public void recordTokenUsage(AgentType agentType, long tokens, long thinkingTokens) {
        LocalDate today = LocalDate.now();
        
        AgentMetrics metrics = metricsRepository
            .findByAgentTypeAndDate(agentType, today)
            .orElse(AgentMetrics.builder()
                .agentType(agentType)
                .date(today)
                .build());
        
        metrics.addTokenUsage(tokens, thinkingTokens);
        metricsRepository.save(metrics);
    }
    
    /**
     * Record failure
     */
    @Async
    @Transactional
    public void recordFailure(String errorType) {
        log.warn("Recorded failure: {}", errorType);
        // Could track failures in a separate table or just log
    }
    
    /**
     * Lấy metrics của ngày hôm nay
     */
    public List<AgentMetrics> getTodayMetrics() {
        return metricsRepository.findByDate(LocalDate.now());
    }
    
    /**
     * Lấy metrics trong khoảng thời gian
     */
    public List<AgentMetrics> getMetrics(LocalDate startDate, LocalDate endDate) {
        return metricsRepository.findByDateBetweenOrderByDateDesc(startDate, endDate);
    }
    
    /**
     * Lấy metrics của một agent
     */
    public List<AgentMetrics> getAgentMetrics(AgentType agentType, LocalDate startDate, LocalDate endDate) {
        return metricsRepository.findByAgentTypeAndDateBetweenOrderByDateAsc(agentType, startDate, endDate);
    }
    
    /**
     * Lấy summary metrics
     */
    public Map<String, Object> getSummary(LocalDate startDate, LocalDate endDate) {
        List<Object[]> requestData = metricsRepository.sumRequestsByAgentBetween(startDate, endDate);
        List<Object[]> responseTimeData = metricsRepository.avgResponseTimeByAgentBetween(startDate, endDate);
        List<Object[]> tokenData = metricsRepository.sumTokensBetween(startDate, endDate);
        
        long totalRequests = 0;
        long successfulRequests = 0;
        long failedRequests = 0;
        
        for (Object[] row : requestData) {
            totalRequests += ((Number) row[1]).longValue();
            successfulRequests += ((Number) row[2]).longValue();
            failedRequests += ((Number) row[3]).longValue();
        }
        
        double avgResponseTime = 0;
        int count = 0;
        for (Object[] row : responseTimeData) {
            if (row[1] != null) {
                avgResponseTime += ((Number) row[1]).doubleValue();
                count++;
            }
        }
        if (count > 0) avgResponseTime /= count;
        
        long totalTokens = 0;
        long thinkingTokens = 0;
        if (!tokenData.isEmpty() && tokenData.get(0)[0] != null) {
            totalTokens = ((Number) tokenData.get(0)[0]).longValue();
            thinkingTokens = ((Number) tokenData.get(0)[1]).longValue();
        }
        
        return Map.of(
            "totalRequests", totalRequests,
            "successfulRequests", successfulRequests,
            "failedRequests", failedRequests,
            "successRate", totalRequests > 0 ? (double) successfulRequests / totalRequests * 100 : 0,
            "avgResponseTimeMs", avgResponseTime,
            "totalTokensUsed", totalTokens,
            "thinkingTokensUsed", thinkingTokens
        );
    }
    
    /**
     * Cleanup old metrics (older than 90 days)
     */
    @Transactional
    public void cleanupOldMetrics() {
        LocalDate threshold = LocalDate.now().minusDays(90);
        metricsRepository.deleteByDateBefore(threshold);
        log.info("Cleaned up metrics older than {}", threshold);
    }
}
