package com.example.online_shoe_store.Controller.api;

import com.example.online_shoe_store.Entity.ConversationEvent;
import com.example.online_shoe_store.Entity.ConversationState;
import com.example.online_shoe_store.Repository.ConversationEventRepository;
import com.example.online_shoe_store.Repository.ConversationStateRepository;
import com.example.online_shoe_store.dto.orchestrator.ConversationStateDto;
import com.example.online_shoe_store.Service.ai.execution.ConversationEventService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

/**
 * API Controller để xem agent monitoring data
 * Hữu ích cho debugging "vì sao agent route sai / loop / gọi sai expert"
 */
@RestController
@RequestMapping("/api/agent-monitor")
@RequiredArgsConstructor
@Slf4j
public class AgentMonitorAPIController {

    private final ConversationEventRepository eventRepository;
    private final ConversationStateRepository stateRepository;
    private final ConversationEventService eventService;

    /**
     * Lấy events của một session
     */
    @GetMapping("/sessions/{sessionId}/events")
    public ResponseEntity<List<ConversationEvent>> getSessionEvents(
            @PathVariable String sessionId,
            @RequestParam(defaultValue = "50") int limit) {
        
        List<ConversationEvent> events = eventRepository.findRecentEvents(
                sessionId, PageRequest.of(0, limit));
        
        return ResponseEntity.ok(events);
    }

    /**
     * Lấy state của một session
     */
    @GetMapping("/sessions/{sessionId}/state")
    public ResponseEntity<Map<String, Object>> getSessionState(@PathVariable String sessionId) {
        Map<String, Object> result = new HashMap<>();
        
        Optional<ConversationState> state = stateRepository.findBySessionIdAndIsActiveTrue(sessionId);
        Optional<ConversationStateDto> stateDto = eventService.getStateDto(sessionId);
        
        if (state.isPresent()) {
            result.put("found", true);
            result.put("sessionId", state.get().getSessionId());
            result.put("version", state.get().getVersion());
            result.put("updatedAt", state.get().getUpdatedAt());
            result.put("isActive", state.get().getIsActive());
            result.put("stateDto", stateDto.orElse(null));
        } else {
            result.put("found", false);
        }
        
        return ResponseEntity.ok(result);
    }

    /**
     * Rebuild state từ events (event replay)
     */
    @PostMapping("/sessions/{sessionId}/rebuild-state")
    public ResponseEntity<ConversationStateDto> rebuildState(@PathVariable String sessionId) {
        ConversationStateDto newState = eventService.rebuildStateFromEvents(sessionId);
        return ResponseEntity.ok(newState);
    }

    /**
     * Lấy tất cả active sessions
     */
    @GetMapping("/sessions/active")
    public ResponseEntity<Map<String, Object>> getActiveSessions() {
        Map<String, Object> result = new HashMap<>();
        
        long activeCount = stateRepository.countActiveSessions();
        result.put("activeSessionCount", activeCount);
        
        return ResponseEntity.ok(result);
    }

    /**
     * Thống kê events theo type trong 24h qua
     */
    @GetMapping("/stats/events")
    public ResponseEntity<Map<String, Object>> getEventStats() {
        Map<String, Object> result = new HashMap<>();
        
        java.time.LocalDateTime now = java.time.LocalDateTime.now();
        java.time.LocalDateTime yesterday = now.minusHours(24);
        
        long totalEvents = eventRepository.countByCreatedAtBetween(yesterday, now);
        List<Object[]> eventsByType = eventRepository.countByTypeBetween(yesterday, now);
        
        result.put("totalEventsLast24h", totalEvents);
        result.put("eventsByType", eventsByType);
        
        return ResponseEntity.ok(result);
    }

    /**
     * Close một session
     */
    @PostMapping("/sessions/{sessionId}/close")
    public ResponseEntity<String> closeSession(@PathVariable String sessionId) {
        eventService.closeSession(sessionId);
        return ResponseEntity.ok("Session closed: " + sessionId);
    }

    /**
     * Cleanup stale sessions
     */
    @PostMapping("/cleanup")
    public ResponseEntity<Map<String, Object>> cleanupStaleSessions(
            @RequestParam(defaultValue = "30") int staleMinutes) {
        
        int cleaned = eventService.cleanupStaleSessions(staleMinutes);
        
        Map<String, Object> result = new HashMap<>();
        result.put("cleanedSessions", cleaned);
        result.put("staleMinutesThreshold", staleMinutes);
        
        return ResponseEntity.ok(result);
    }
}
