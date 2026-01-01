package com.example.online_shoe_store.Service.ai.context;

import com.example.online_shoe_store.Entity.ConversationMessage;
import com.example.online_shoe_store.Entity.UserProfileMemory;
import com.example.online_shoe_store.Repository.ConversationMessageRepository;
import com.example.online_shoe_store.Repository.UserProfileMemoryRepository;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CompletableFuture;
import java.util.stream.Collectors;

/**
 * Direct Context Service - Fetch context trực tiếp KHÔNG qua LLM
 * Giảm từ 3 LLM calls (6s) → 0 LLM calls (~50ms)
 */
@Service
@Slf4j
@RequiredArgsConstructor
public class DirectContextService {

    private final ConversationMessageRepository messageRepo;
    private final UserProfileMemoryRepository userProfileRepo;
    private final ObjectMapper objectMapper;

    public String prepareContext(String sessionId, String userId, String userMessage) {
        long start = System.currentTimeMillis();
        
        // Parallel fetch both data sources
        CompletableFuture<String> profileFuture = CompletableFuture.supplyAsync(() -> 
                fetchUserProfile(userId));
        CompletableFuture<String> historyFuture = CompletableFuture.supplyAsync(() -> 
                fetchSessionHistory(sessionId, 5));
        
        // Wait for both
        String profile = profileFuture.join();
        String history = historyFuture.join();
        
        // Build context JSON
        Map<String, Object> contextMap = new HashMap<>();
        contextMap.put("userId", userId != null ? userId : "guest");
        
        StringBuilder contextBuilder = new StringBuilder();
        
        // Add profile info
        if (profile != null && !profile.contains("Không có") && !profile.contains("Chưa có")) {
            contextBuilder.append(profile);
        }
        
        // Add history summary (if any)
        if (history != null && !history.contains("Không có")) {
            if (contextBuilder.length() > 0) {
                contextBuilder.append(". ");
            }
            contextBuilder.append("Lịch sử: ").append(history);
        }
        
        if (contextBuilder.length() == 0) {
            contextBuilder.append("User mới, chưa có lịch sử");
        }
        
        contextMap.put("context", contextBuilder.toString());
        
        try {
            String result = objectMapper.writeValueAsString(contextMap);
            long duration = System.currentTimeMillis() - start;
            log.info("[DirectContext] Prepared in {}ms for user={}", duration, userId);
            return result;
        } catch (Exception e) {
            log.error("Failed to serialize context", e);
            return String.format("{\"userId\": \"%s\", \"context\": \"Error preparing context\"}", 
                    userId != null ? userId : "guest");
        }
    }

    private String fetchUserProfile(String userId) {
        if (userId == null || userId.isBlank()) {
            return null;
        }
        
        return userProfileRepo.findByUserId(userId)
                .map(profile -> {
                    StringBuilder sb = new StringBuilder();
                    if (profile.getProfileJson() != null && !profile.getProfileJson().equals("{}")) {
                        try {
                            Map<String, Object> profileMap = objectMapper.readValue(
                                    profile.getProfileJson(), 
                                    new com.fasterxml.jackson.core.type.TypeReference<Map<String, Object>>() {});
                            if (profileMap.containsKey("name")) {
                                sb.append("Tên: ").append(profileMap.get("name"));
                            }
                            if (profileMap.containsKey("preferredSize")) {
                                sb.append(", Size: ").append(profileMap.get("preferredSize"));
                            }
                            if (profileMap.containsKey("preferredBrand")) {
                                sb.append(", Thích: ").append(profileMap.get("preferredBrand"));
                            }
                        } catch (Exception e) {
                            sb.append(profile.getProfileJson());
                        }
                    }
                    if (profile.getInteractionSummary() != null) {
                        if (sb.length() > 0) sb.append(". ");
                        sb.append(profile.getInteractionSummary());
                    }
                    return sb.length() > 0 ? sb.toString() : null;
                })
                .orElse(null);
    }

    private String fetchSessionHistory(String sessionId, int limit) {
        List<ConversationMessage> messages = messageRepo.findRecentBySessionId(sessionId, limit);
        
        if (messages.isEmpty()) {
            return null;
        }
        
        // Summarize recent messages
        return messages.stream()
                .limit(3)
                .map(m -> m.getContent().length() > 50 
                        ? m.getContent().substring(0, 50) + "..." 
                        : m.getContent())
                .collect(Collectors.joining(" | "));
    }
}
