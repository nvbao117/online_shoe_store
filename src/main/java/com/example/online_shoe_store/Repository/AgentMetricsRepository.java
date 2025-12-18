package com.example.online_shoe_store.Repository;

import com.example.online_shoe_store.Entity.AgentMetrics;
import com.example.online_shoe_store.Entity.enums.AgentType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@Repository
public interface AgentMetricsRepository extends JpaRepository<AgentMetrics, Long> {
    
    /**
     * Tìm metrics của agent theo ngày
     */
    Optional<AgentMetrics> findByAgentTypeAndDate(AgentType agentType, LocalDate date);
    
    /**
     * Tìm tất cả metrics của agent
     */
    List<AgentMetrics> findByAgentTypeOrderByDateDesc(AgentType agentType);
    
    /**
     * Tìm metrics trong khoảng thời gian
     */
    List<AgentMetrics> findByDateBetweenOrderByDateDesc(LocalDate startDate, LocalDate endDate);
    
    /**
     * Tìm metrics của agent trong khoảng thời gian
     */
    List<AgentMetrics> findByAgentTypeAndDateBetweenOrderByDateAsc(
        AgentType agentType, LocalDate startDate, LocalDate endDate);
    
    /**
     * Tìm tất cả metrics của ngày hôm nay
     */
    List<AgentMetrics> findByDate(LocalDate date);
    
    /**
     * Tổng requests theo agent trong khoảng thời gian
     */
    @Query("SELECT m.agentType, SUM(m.totalRequests), SUM(m.successfulRequests), SUM(m.failedRequests) " +
           "FROM AgentMetrics m WHERE m.date BETWEEN :start AND :end GROUP BY m.agentType")
    List<Object[]> sumRequestsByAgentBetween(@Param("start") LocalDate start, @Param("end") LocalDate end);
    
    /**
     * Avg response time theo agent trong khoảng thời gian
     */
    @Query("SELECT m.agentType, AVG(m.avgResponseTimeMs) FROM AgentMetrics m " +
           "WHERE m.date BETWEEN :start AND :end GROUP BY m.agentType")
    List<Object[]> avgResponseTimeByAgentBetween(@Param("start") LocalDate start, @Param("end") LocalDate end);
    
    /**
     * Tổng escalation theo agent
     */
    @Query("SELECT m.agentType, SUM(m.escalationCount) FROM AgentMetrics m " +
           "WHERE m.date BETWEEN :start AND :end GROUP BY m.agentType")
    List<Object[]> sumEscalationByAgentBetween(@Param("start") LocalDate start, @Param("end") LocalDate end);
    
    /**
     * Tổng tokens sử dụng trong khoảng thời gian
     */
    @Query("SELECT SUM(m.totalTokensUsed), SUM(m.thinkingTokensUsed) FROM AgentMetrics m " +
           "WHERE m.date BETWEEN :start AND :end")
    List<Object[]> sumTokensBetween(@Param("start") LocalDate start, @Param("end") LocalDate end);
    
    /**
     * Xóa metrics cũ hơn X ngày
     */
    void deleteByDateBefore(LocalDate date);
}
