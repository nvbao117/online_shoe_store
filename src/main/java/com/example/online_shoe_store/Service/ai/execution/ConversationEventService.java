package com.example.online_shoe_store.Service.ai.execution;

import com.example.online_shoe_store.Entity.ConversationEvent;
import com.example.online_shoe_store.Entity.ConversationState;
import com.example.online_shoe_store.Entity.enums.ConversationEventType;
import com.example.online_shoe_store.Entity.enums.RiskLevel;
import com.example.online_shoe_store.Repository.ConversationEventRepository;
import com.example.online_shoe_store.Repository.ConversationStateRepository;
import com.example.online_shoe_store.dto.orchestrator.ConversationStateDto;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.PageRequest;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.UUID;

/**
 * Service quản lý Event Sourcing cho conversations
 * - Events: append-only log của tất cả actions
 * - State: snapshot hiện tại để load nhanh
 */
@Service
@Slf4j
@RequiredArgsConstructor
public class ConversationEventService {

    private final ConversationEventRepository eventRepository;
    private final ConversationStateRepository stateRepository;
    private final ObjectMapper objectMapper;

    // ═══════════════════════════════════════════
    // EVENT METHODS
    // ═══════════════════════════════════════════

    /**
     * Ghi event mới (append-only)
     */
    @Transactional
    public ConversationEvent appendEvent(String sessionId,
                                         ConversationEventType type,
                                         Object payload,
                                         String userId,
                                         String guestId,
                                         RiskLevel riskLevel,
                                         String traceId) {
        try {
            String payloadJson = payload != null ? objectMapper.writeValueAsString(payload) : null;

            ConversationEvent event = ConversationEvent.builder()
                    .eventId(UUID.randomUUID().toString())
                    .sessionId(sessionId)
                    .type(type)
                    .payloadJson(payloadJson)
                    .userId(userId)
                    .guestId(guestId)
                    .riskLevel(riskLevel)
                    .traceId(traceId)
                    .createdAt(LocalDateTime.now())
                    .build();

            event = eventRepository.save(event);
            log.debug("Appended event {} for session {}", type, sessionId);
            return event;

        } catch (JsonProcessingException e) {
            log.error("Error serializing event payload: {}", e.getMessage());
            throw new RuntimeException("Failed to serialize event payload", e);
        }
    }

    /**
     * Ghi event đơn giản (không có user/guest info)
     */
    @Transactional
    public ConversationEvent appendEvent(String sessionId, ConversationEventType type, Object payload) {
        return appendEvent(sessionId, type, payload, null, null, null, null);
    }

    /**
     * Ghi event async cho performance
     */
    @Async
    @Transactional
    public void appendEventAsync(String sessionId,
                                 ConversationEventType type,
                                 Object payload,
                                 String userId,
                                 String guestId) {
        appendEvent(sessionId, type, payload, userId, guestId, null, null);
    }

    /**
     * Lấy tất cả events của session
     */
    public List<ConversationEvent> getSessionEvents(String sessionId) {
        return eventRepository.findBySessionIdOrderByCreatedAtAsc(sessionId);
    }

    /**
     * Lấy N events gần nhất
     */
    public List<ConversationEvent> getRecentEvents(String sessionId, int count) {
        return eventRepository.findRecentEvents(sessionId, PageRequest.of(0, count));
    }

    /**
     * Lấy events sau một checkpoint (để replay)
     */
    public List<ConversationEvent> getEventsAfter(String sessionId, String afterEventId) {
        return eventRepository.findEventsAfter(sessionId, afterEventId);
    }

    // ═══════════════════════════════════════════
    // STATE METHODS
    // ═══════════════════════════════════════════
    @Transactional
    public ConversationState getOrCreateState(String sessionId, String userId, String guestId) {
        return stateRepository.findBySessionIdAndIsActiveTrue(sessionId)
                .orElseGet(() -> {
                    log.info("Creating new state for session: {}", sessionId);

                    ConversationStateDto initialState = ConversationStateDto.builder()
                            .consecutiveRetries(0)
                            .isEscalated(false)
                            .build();

                    try {
                        ConversationState state = ConversationState.builder()
                                .sessionId(sessionId)
                                .userId(userId)
                                .guestId(guestId)
                                .version(1)
                                .stateJson(objectMapper.writeValueAsString(initialState))
                                .isActive(true)
                                .updatedAt(LocalDateTime.now())
                                .build();

                        return stateRepository.save(state);
                    } catch (JsonProcessingException e) {
                        throw new RuntimeException("Failed to serialize initial state", e);
                    }
                });
    }

    /**
     * Lấy state DTO từ session
     */
    public Optional<ConversationStateDto> getStateDto(String sessionId) {
        return stateRepository.findBySessionIdAndIsActiveTrue(sessionId)
                .map(state -> {
                    try {
                        return objectMapper.readValue(state.getStateJson(), ConversationStateDto.class);
                    } catch (JsonProcessingException e) {
                        log.error("Error deserializing state: {}", e.getMessage());
                        return null;
                    }
                });
    }

    /**
     * Cập nhật state với optimistic locking
     */
    @Transactional
    public boolean updateState(String sessionId, ConversationStateDto stateDto, String lastEventId) {
        Optional<ConversationState> existingState = stateRepository.findBySessionIdAndIsActiveTrue(sessionId);

        if (existingState.isEmpty()) {
            log.warn("State not found for session: {}", sessionId);
            return false;
        }

        ConversationState state = existingState.get();
        int expectedVersion = state.getVersion();

        try {
            String stateJson = objectMapper.writeValueAsString(stateDto);

            int updated = stateRepository.updateStateWithVersion(
                    sessionId, stateJson, lastEventId, expectedVersion, LocalDateTime.now());

            if (updated == 0) {
                log.warn("Optimistic lock violation for session: {}", sessionId);
                return false;
            }

            log.debug("Updated state for session: {}, version: {}", sessionId, expectedVersion + 1);
            return true;

        } catch (JsonProcessingException e) {
            log.error("Error serializing state: {}", e.getMessage());
            return false;
        }
    }

    /**
     * Cập nhật state trực tiếp (không kiểm tra version)
     */
    @Transactional
    public void updateStateDirectly(String sessionId, ConversationStateDto stateDto) {
        Optional<ConversationState> existingState = stateRepository.findBySessionIdAndIsActiveTrue(sessionId);

        if (existingState.isEmpty()) {
            log.warn("State not found for session: {}", sessionId);
            return;
        }

        ConversationState state = existingState.get();

        try {
            state.setStateJson(objectMapper.writeValueAsString(stateDto));
            state.incrementVersion();
            stateRepository.save(state);

        } catch (JsonProcessingException e) {
            log.error("Error serializing state: {}", e.getMessage());
        }
    }

    // ═══════════════════════════════════════════
    // COMBINED OPERATIONS
    // ═══════════════════════════════════════════

    /**
     * Ghi event và cập nhật state cùng lúc
     */
    @Transactional
    public ConversationEvent appendEventAndUpdateState(String sessionId,
                                                       ConversationEventType type,
                                                       Object eventPayload,
                                                       ConversationStateDto newState) {
        ConversationEvent event = appendEvent(sessionId, type, eventPayload);
        updateState(sessionId, newState, event.getEventId());
        return event;
    }

    /**
     * Rebuild state từ events (event replay)
     */
    @Transactional
    public ConversationStateDto rebuildStateFromEvents(String sessionId) {
        List<ConversationEvent> events = eventRepository.findBySessionIdOrderByCreatedAtAsc(sessionId);

        ConversationStateDto state = ConversationStateDto.builder()
                .consecutiveRetries(0)
                .isEscalated(false)
                .build();

        for (ConversationEvent event : events) {
            state = applyEvent(state, event);
        }

        // Lưu state mới
        updateStateDirectly(sessionId, state);

        log.info("Rebuilt state for session {} from {} events", sessionId, events.size());
        return state;
    }

    /**
     * Apply một event vào state (reducer pattern)
     */
    private ConversationStateDto applyEvent(ConversationStateDto state, ConversationEvent event) {
        try {
            Map<String, Object> payload = event.getPayloadJson() != null
                    ? objectMapper.readValue(event.getPayloadJson(), Map.class)
                    : Map.of();

            switch (event.getType()) {
                case USER_INPUT -> {
                    // Reset retry count on new input
                    state.setConsecutiveRetries(0);
                }
                case ERROR -> {
                    state.setConsecutiveRetries(state.getConsecutiveRetries() + 1);
                    if (state.getLastToolErrors() != null) {
                        state.getLastToolErrors().add((String) payload.get("error"));
                    }
                }
                case ESCALATED -> {
                    state.setIsEscalated(true);
                }
                case CART_UPDATED -> {
                    state.setCartId((String) payload.get("cartId"));
                }
                case ORDER_CREATED -> {
                    state.setTrackingOrderId((String) payload.get("orderId"));
                }
                case CONFIRM_REQUESTED -> {
                    ConversationStateDto.PendingConfirmation confirmation =
                            ConversationStateDto.PendingConfirmation.builder()
                                    .confirmationType((String) payload.get("type"))
                                    .message((String) payload.get("message"))
                                    .data(payload)
                                    .expiresAt(System.currentTimeMillis() + 300000) // 5 minutes
                                    .build();
                    state.setPendingConfirmation(confirmation);
                }
                case CONFIRMED, CANCELLED -> {
                    state.setPendingConfirmation(null);
                }
                default -> {
                    // No state change for other events
                }
            }

        } catch (JsonProcessingException e) {
            log.error("Error parsing event payload: {}", e.getMessage());
        }

        return state;
    }

    // ═══════════════════════════════════════════
    // CLEANUP & MAINTENANCE
    // ═══════════════════════════════════════════

    /**
     * Đóng session
     */
    @Transactional
    public void closeSession(String sessionId) {
        // Ghi event kết thúc
        appendEvent(sessionId, ConversationEventType.SESSION_END, null);

        // Đánh dấu state inactive
        stateRepository.deactivateSession(sessionId, LocalDateTime.now());

        log.info("Closed session: {}", sessionId);
    }

    /**
     * Cleanup stale sessions
     */
    @Transactional
    public int cleanupStaleSessions(int staleMinutes) {
        LocalDateTime threshold = LocalDateTime.now().minusMinutes(staleMinutes);
        List<ConversationState> staleStates = stateRepository.findStaleStates(threshold);

        for (ConversationState state : staleStates) {
            closeSession(state.getSessionId());
        }

        log.info("Cleaned up {} stale sessions", staleStates.size());
        return staleStates.size();
    }
}
