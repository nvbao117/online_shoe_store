package com.example.online_shoe_store.Service.ai.tool;

import com.example.online_shoe_store.Entity.Conversation;
import com.example.online_shoe_store.Entity.ConversationMessage;
import com.example.online_shoe_store.Entity.UserProfileMemory;
import com.example.online_shoe_store.Entity.enums.MessageRole;
import com.example.online_shoe_store.Repository.ConversationMessageRepository;
import com.example.online_shoe_store.Repository.ConversationRepository;
import com.example.online_shoe_store.Repository.UserProfileMemoryRepository;
import com.example.online_shoe_store.Service.ai.rag.ProductRAGService;
import com.example.online_shoe_store.dto.response.ProductRAGResponse;
import com.fasterxml.jackson.databind.ObjectMapper;
import dev.langchain4j.agent.tool.Tool;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * Tools cho ContextManagerAgent
 * AI sẽ gọi các tools này để fetch và upload context
 */
@Component
@Slf4j
@RequiredArgsConstructor
public class ContextManagerTools {

    private final ConversationMessageRepository messageRepo;
    private final ConversationRepository conversationRepo;
    private final UserProfileMemoryRepository userProfileRepo;
    private final ProductRAGService ragService;
    private final ObjectMapper objectMapper;

    // ═══════════════════════════════════════════
    // FETCH TOOLS
    // ═══════════════════════════════════════════

    @Tool("Lấy lịch sử chat gần đây của session. Dùng khi cần biết context trước đó.")
    public String fetchSessionHistory(String sessionId, int limit) {
        log.info("[ContextTool] Fetching session history for: {}, limit: {}", sessionId, limit);
        List<ConversationMessage> messages = messageRepo.findRecentBySessionId(sessionId, limit);
        
        if (messages.isEmpty()) {
            return "Không có lịch sử chat trước đó.";
        }
        
        return messages.stream()
                .map(m -> String.format("[%s]: %s", m.getRole(), m.getContent()))
                .collect(Collectors.joining("\n"));
    }

    @Tool("Lấy bản tóm tắt của cuộc hội thoại (nếu có)")
    public String fetchConversationSummary(String sessionId) {
        log.info("[ContextTool] Fetching summary for session: {}", sessionId);
        
        return conversationRepo.findBySessionIdAndIsActiveTrue(sessionId)
                .map(Conversation::getSummary)
                .filter(s -> s != null && !s.isBlank())
                .orElse("Chưa có bản tóm tắt.");
    }

    @Tool("Lấy thông tin profile của user. Dùng khi cần biết preferences như size, brand yêu thích.")
    public String fetchUserProfile(String userId) {
        log.info("[ContextTool] Fetching user profile for: {}", userId);
        
        if (userId == null || userId.isBlank()) {
            return "Không có thông tin user (guest).";
        }
        
        return userProfileRepo.findByUserId(userId)
                .map(profile -> {
                    StringBuilder sb = new StringBuilder("USER PROFILE:\n");
                    if (profile.getProfileJson() != null) {
                        sb.append(profile.getProfileJson());
                    }
                    if (profile.getInteractionSummary() != null) {
                        sb.append("\nTÓM TẮT: ").append(profile.getInteractionSummary());
                    }
                    return sb.toString();
                })
                .orElse("Chưa có thông tin profile.");
    }

    @Tool("Tìm kiếm sản phẩm liên quan. Dùng khi user hỏi về giày, sản phẩm, tìm kiếm.")
    public String searchProducts(String query) {
        log.info("[ContextTool] Searching products for: {}", query);
        
        List<ProductRAGResponse> products = ragService.searchProducts(query, 5, 0.5);
        
        if (products.isEmpty()) {
            return "Không tìm thấy sản phẩm phù hợp.";
        }
        
        return products.stream()
                .map(p -> String.format("- %s | Giá: %s | Brand: %s | ID: %s",
                        p.getName(), p.getPrice(), p.getBrandName(), p.getProductId()))
                .collect(Collectors.joining("\n"));
    }

    // ═══════════════════════════════════════════
    // UPLOAD TOOLS
    // ═══════════════════════════════════════════

    @Tool("Lưu tin nhắn của user vào database")
    public String saveUserMessage(String sessionId, String content) {
        log.info("[ContextTool] Saving user message for session: {}", sessionId);
        
        Conversation conv = getOrCreateConversation(sessionId);
        ConversationMessage message = ConversationMessage.builder()
                .conversation(conv)
                .role(MessageRole.USER)
                .content(content)
                .build();
        messageRepo.save(message);
        conv.setMessageCount(conv.getMessageCount() + 1);
        conv.setLastMessageAt(LocalDateTime.now());
        conversationRepo.save(conv);
        
        return "Đã lưu tin nhắn user.";
    }

    @Tool("Lưu phản hồi của AI vào database")
    public String saveAiResponse(String sessionId, String content) {
        log.info("[ContextTool] Saving AI response for session: {}", sessionId);
        
        Conversation conv = getOrCreateConversation(sessionId);
        ConversationMessage message = ConversationMessage.builder()
                .conversation(conv)
                .role(MessageRole.ASSISTANT)
                .content(content)
                .build();
        messageRepo.save(message);
        conv.setMessageCount(conv.getMessageCount() + 1);
        conv.setLastMessageAt(LocalDateTime.now());
        conversationRepo.save(conv);
        
        return "Đã lưu phản hồi AI.";
    }

    @Tool("Cập nhật user preferences. Dùng khi phát hiện thông tin mới về user như size, brand yêu thích.")
    public String updateUserProfile(String userId, String preferenceKey, String preferenceValue) {
        log.info("[ContextTool] Updating user preference: {} = {} for user: {}", preferenceKey, preferenceValue, userId);
        
        if (userId == null || userId.isBlank()) {
            return "Không thể cập nhật profile cho guest.";
        }
        
        try {
            UserProfileMemory profile = userProfileRepo.findByUserId(userId)
                    .orElseGet(() -> UserProfileMemory.builder()
                            .userId(userId)
                            .profileJson("{}")
                            .build());
            
            Map<String, Object> profileMap = parseProfile(profile.getProfileJson());
            profileMap.put(preferenceKey, preferenceValue);
            profile.setProfileJson(objectMapper.writeValueAsString(profileMap));
            profile.setLastActiveAt(LocalDateTime.now());
            userProfileRepo.save(profile);
            
            return String.format("Đã cập nhật preference: %s = %s", preferenceKey, preferenceValue);
        } catch (Exception e) {
            log.error("Failed to update profile: {}", e.getMessage());
            return "Lỗi khi cập nhật profile.";
        }
    }

    @Tool("Cập nhật bản tóm tắt mới cho cuộc hội thoại")
    public String updateSummary(String sessionId, String newSummary) {
        log.info("[ContextTool] Updating summary for session: {}", sessionId);
        
        return conversationRepo.findBySessionIdAndIsActiveTrue(sessionId)
                .map(conv -> {
                    conv.setSummary(newSummary);
                    conversationRepo.save(conv);
                    return "Đã cập nhật tóm tắt thành công.";
                })
                .orElse("Không tìm thấy cuộc hội thoại.");
    }

    // ═══════════════════════════════════════════
    // PRIVATE HELPERS
    // ═══════════════════════════════════════════

    private Conversation getOrCreateConversation(String sessionId) {
        return conversationRepo.findBySessionIdAndIsActiveTrue(sessionId)
                .orElseGet(() -> {
                    Conversation conv = Conversation.builder()
                            .sessionId(sessionId)
                            .isActive(true)
                            .messageCount(0)
                            .build();
                    return conversationRepo.save(conv);
                });
    }

    private Map<String, Object> parseProfile(String profileJson) {
        try {
            if (profileJson != null && !profileJson.isEmpty()) {
                return objectMapper.readValue(profileJson, 
                        new com.fasterxml.jackson.core.type.TypeReference<Map<String, Object>>() {});
            }
        } catch (Exception e) {
            log.warn("Failed to parse profile JSON: {}", e.getMessage());
        }
        return new HashMap<>();
    }
}
