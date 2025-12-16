package com.example.online_shoe_store.Service.ai.execution;

import com.example.online_shoe_store.Entity.Conversation;
import com.example.online_shoe_store.Entity.ConversationMessage;
import com.example.online_shoe_store.Entity.enums.AgentType;
import com.example.online_shoe_store.Entity.enums.MessageRole;
import com.example.online_shoe_store.Repository.ConversationMessageRepository;
import com.example.online_shoe_store.Repository.ConversationRepository;
import com.example.online_shoe_store.dto.orchestrator.*;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.PageRequest;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

/**
 * Service quản lý conversations và messages
 */
@Service
@Slf4j
@RequiredArgsConstructor
public class ConversationService {
    
    private final ConversationRepository conversationRepository;
    private final ConversationMessageRepository messageRepository;
    private final ObjectMapper objectMapper;
    
    /**
     * Lấy hoặc tạo conversation cho session
     */
    @Transactional
    public Conversation getOrCreateConversation(String sessionId) {
        return conversationRepository.findBySessionIdAndIsActiveTrue(sessionId)
            .orElseGet(() -> {
                log.info("Creating new conversation for session: {}", sessionId);
                Conversation conversation = Conversation.builder()
                    .sessionId(sessionId)
                    .isActive(true)
                    .messageCount(0)
                    .build();
                return conversationRepository.save(conversation);
            });
    }
    
    /**
     * Lấy N messages gần nhất của conversation (cho context)
     */
    public List<String> getRecentHistory(String sessionId, int count) {
        try {
            Conversation conversation = conversationRepository
                .findBySessionIdAndIsActiveTrue(sessionId)
                .orElse(null);
            
            if (conversation == null) {
                return new ArrayList<>();
            }
            
            List<ConversationMessage> messages = messageRepository
                .findRecentMessages(conversation.getId(), PageRequest.of(0, count));
            
            // Reverse to get chronological order
            Collections.reverse(messages);
            
            return messages.stream()
                .map(m -> m.getRole() + ": " + m.getContent())
                .collect(Collectors.toList());
                
        } catch (Exception e) {
            log.error("Error getting conversation history: {}", e.getMessage());
            return new ArrayList<>();
        }
    }
    
    /**
     * Lưu cặp user message + assistant response
     */
    @Transactional
    public void saveMessage(String sessionId,
                            String userMessage,
                            String assistantResponse,
                            IntentClassificationResult classification,
                            RoutingDecision routing,
                            long processingTimeMs) {
        
        try {
            Conversation conversation = getOrCreateConversation(sessionId);
            
            // Save user message
            ConversationMessage userMsg = ConversationMessage.builder()
                .conversation(conversation)
                .role(MessageRole.USER)
                .content(userMessage)
                .primaryIntent(classification.getPrimaryIntent())
                .subIntent(classification.hasSecondaryIntents() 
                    ? classification.getSecondaryIntents().get(0).name() 
                    : null)
                .extractedEntities(serializeEntities(classification.getEntities()))
                .confidence(classification.getConfidence())
                .urgency(classification.getUrgency())
                .primaryAgent(parseAgentType(routing.getTargetAgent()))
                .secondaryAgents(formatSecondaryAgents(routing.getSecondaryAgents()))
                .wasParallel(routing.getParallel())
                .riskLevel(routing.getRiskLevel())
                .requiredEscalation(routing.getRequiresEscalation())
                .processingTimeMs((int) processingTimeMs)
                .build();
            
            messageRepository.save(userMsg);
            
            // Save assistant response
            ConversationMessage assistantMsg = ConversationMessage.builder()
                .conversation(conversation)
                .role(MessageRole.ASSISTANT)
                .content(assistantResponse)
                .build();
            
            messageRepository.save(assistantMsg);
            
            // Update conversation
            conversation.setLastMessageAt(LocalDateTime.now());
            conversation.setLastPrimaryIntent(classification.getPrimaryIntent());
            conversation.setMessageCount(conversation.getMessageCount() + 2);
            
            if (routing.getRequiresEscalation()) {
                conversation.markEscalation();
            }
            
            conversationRepository.save(conversation);
            
            log.debug("Saved messages for session: {}", sessionId);
            
        } catch (Exception e) {
            log.error("Error saving conversation: {}", e.getMessage());
        }
    }
    
    /**
     * Async version của saveMessage cho performance
     */
    @Async
    @Transactional
    public void saveMessageAsync(String sessionId,
                                  String userMessage,
                                  String assistantResponse,
                                  IntentClassificationResult classification,
                                  RoutingDecision routing,
                                  long processingTimeMs) {
        saveMessage(sessionId, userMessage, assistantResponse, classification, routing, processingTimeMs);
    }
    
    /**
     * Lấy tất cả messages của conversation
     */
    public List<ConversationMessage> getConversationMessages(String sessionId) {
        return conversationRepository.findBySessionIdAndIsActiveTrue(sessionId)
            .map(c -> messageRepository.findByConversationIdOrderByCreatedAtAsc(c.getId()))
            .orElse(new ArrayList<>());
    }
    
    /**
     * Đóng conversation
     */
    @Transactional
    public void closeConversation(String sessionId) {
        conversationRepository.findBySessionIdAndIsActiveTrue(sessionId)
            .ifPresent(c -> {
                c.deactivate();
                conversationRepository.save(c);
                log.info("Closed conversation for session: {}", sessionId);
            });
    }
    
    /**
     * Cleanup stale conversations (inactive for > 30 minutes)
     */
    @Transactional
    public int cleanupStaleConversations() {
        LocalDateTime threshold = LocalDateTime.now().minusMinutes(30);
        List<Conversation> stale = conversationRepository.findStaleConversations(threshold);
        
        stale.forEach(Conversation::deactivate);
        conversationRepository.saveAll(stale);
        
        log.info("Cleaned up {} stale conversations", stale.size());
        return stale.size();
    }
    
    // ═══════════════════════════════════════════
    // HELPER METHODS
    // ═══════════════════════════════════════════
    
    private String serializeEntities(ExtractedEntities entities) {
        if (entities == null) return null;
        try {
            return objectMapper.writeValueAsString(entities);
        } catch (JsonProcessingException e) {
            log.error("Error serializing entities: {}", e.getMessage());
            return null;
        }
    }
    
    private String formatSecondaryAgents(List<String> agents) {
        if (agents == null || agents.isEmpty()) return null;
        return String.join(",", agents);
    }
    
    private AgentType parseAgentType(String agentName) {
        if (agentName == null || agentName.isBlank()) {
            return AgentType.SUPPORT;
        }
        try {
            return AgentType.valueOf(agentName.trim().toUpperCase());
        } catch (IllegalArgumentException e) {
            log.warn("Unknown agent type: {}, defaulting to SUPPORT", agentName);
            return AgentType.SUPPORT;
        }
    }
}
