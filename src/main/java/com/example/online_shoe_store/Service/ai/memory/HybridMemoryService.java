package com.example.online_shoe_store.Service.ai.memory;

import com.example.online_shoe_store.Entity.Conversation;
import com.example.online_shoe_store.Repository.ConversationRepository;
import com.example.online_shoe_store.Service.ai.execution.ConversationService;
import com.example.online_shoe_store.dto.memory.HybridMemoryContext;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

// @Service - LEGACY: Replaced by ContextManagerAgent
@Slf4j
@RequiredArgsConstructor
public class HybridMemoryService {

    private static final int RECENT_WINDOW = 6;
    
    private static final int SUMMARY_WINDOW = 20;
    
    private static final int SUMMARY_TRIGGER_DELTA = 6;
    
    private static final int MAX_TOKENS = 2000;

    private final ConversationRepository conversationRepository;
    private final ConversationService conversationService;
    private final SummarizerAgent summarizerAgent;


    @Transactional
    public HybridMemoryContext buildContext(String sessionId) {
        Conversation conv = conversationService.getOrCreateConversation(sessionId);
        
        refreshSummaryIfNeeded(conv);
        
        // Lấy 3 tin nhắn cuối cùng (6 messages: user + assistant)
        List<String> recentMessages = conversationService.getRecentHistory(sessionId, RECENT_WINDOW);
        
        return HybridMemoryContext.builder()
                .summary(conv.getSummary())
                .recentMessages(recentMessages)
                .messageCount(conv.getMessageCount())
                .build();
    }

    
    @Transactional(readOnly = true)
    public String enrichWithContext(String sessionId, String userMessage) {
        HybridMemoryContext ctx = buildContext(sessionId);
        
        StringBuilder contextBuilder = new StringBuilder();
        int currentTokens = 0;
        
        if (ctx.getSummary() != null && !ctx.getSummary().isBlank()) {
            String summaryBlock = buildSummaryBlock(ctx.getSummary());
            int summaryTokens = countWords(summaryBlock);
            contextBuilder.append(summaryBlock);
            currentTokens += summaryTokens;
        }
        
        // 2. Thêm recent messages - ưu tiên thứ hai
        if (ctx.getRecentMessages() != null && !ctx.getRecentMessages().isEmpty()) {
            String recentBlock = buildRecentMessagesBlock(ctx.getRecentMessages());
            int recentTokens = countWords(recentBlock);
            int userMsgTokens = countWords(userMessage);
            int remainingTokens = MAX_TOKENS - currentTokens - userMsgTokens - 10;
            
            if (recentTokens <= remainingTokens) {
                contextBuilder.append(recentBlock);
            } else {
                // Giữ messages quan trọng nhất (gần nhất)
                List<String> trimmedRecent = trimRecentMessagesByTokens(ctx.getRecentMessages(), remainingTokens);
                contextBuilder.append(buildRecentMessagesBlock(trimmedRecent));
            }
        }
        
        // 3. Thêm user message hiện tại
        contextBuilder.append("[USER_MESSAGE]\n");
        contextBuilder.append(userMessage);
        contextBuilder.append("\n[/USER_MESSAGE]");
        
        String finalContext = contextBuilder.toString();
        int totalTokens = countWords(finalContext);
        log.debug("Built context for session {}: ~{} tokens", sessionId, totalTokens);
        
        return finalContext;
    }

    /**
     * Đếm số từ (tokens) trong một string
     */
    private int countWords(String text) {
        if (text == null || text.isBlank()) return 0;
        return text.trim().split("\\s+").length;
    }

    /**
     * Refresh summary khi có đủ tin nhắn mới chưa được tóm tắt
     */
    private void refreshSummaryIfNeeded(Conversation conv) {
        int lastSummarized = Objects.requireNonNullElse(conv.getLastSummarizedCount(), 0);
        int currentCount = conv.getMessageCount();
        int delta = currentCount - lastSummarized;
        
        // Chỉ tóm tắt khi có đủ tin nhắn mới
        if (delta < SUMMARY_TRIGGER_DELTA) {
            log.debug("Skip summarization: delta={} < threshold={}", delta, SUMMARY_TRIGGER_DELTA);
            return;
        }

        int totalToFetch = getTotalToFetch();
        List<String> allMessages = conversationService.getRecentHistory(conv.getSessionId(), totalToFetch);
        
        if (allMessages.size() <= RECENT_WINDOW) {
            log.debug("Not enough messages to summarize: {}", allMessages.size());
            return;
        }
        
        int endIndex = Math.max(0, allMessages.size() - RECENT_WINDOW);
        List<String> messagesToSummarize = allMessages.subList(0, endIndex);
        
        if (messagesToSummarize.isEmpty()) {
            return;
        }
        
        // Build payload cho summarizer
        String previousSummary = conv.getSummary() != null ? conv.getSummary() : "";
        String payload = buildSummarizerPayload(previousSummary, messagesToSummarize);
        
        try {
            String newSummary = summarizerAgent.aggregate(payload);
            
            conv.setSummary(newSummary);
            conv.setLastSummarizedCount(currentCount - RECENT_WINDOW);
            conversationRepository.save(conv);
            
            log.info("Updated summary for session {} (msgs: {}, summarized up to: {})", 
                    conv.getSessionId(), currentCount, conv.getLastSummarizedCount());
                    
        } catch (Exception e) {
            log.warn("Summarization failed for session {}: {}", conv.getSessionId(), e.getMessage());
        }
    }

    private static int getTotalToFetch() {
        int totalToFetch = RECENT_WINDOW + SUMMARY_WINDOW;
        return totalToFetch;
    }

    /**
     * Build payload cho SummarizerAgent
     */
    private String buildSummarizerPayload(String previousSummary, List<String> messages) {
        StringBuilder payload = new StringBuilder();
        
        if (!previousSummary.isBlank()) {
            payload.append("[TÓM TẮT TRƯỚC ĐÓ]\n");
            payload.append(previousSummary);
            payload.append("\n[/TÓM TẮT TRƯỚC ĐÓ]\n\n");
        }
        
        payload.append("[TIN NHẮN CẦN TÓM TẮT]\n");
        for (String msg : messages) {
            payload.append(msg).append("\n");
        }
        payload.append("[/TIN NHẮN CẦN TÓM TẮT]\n\n");
        
        payload.append("Hãy tóm tắt ngắn gọn các thông tin quan trọng từ cuộc hội thoại trên, ");
        payload.append("bao gồm: sản phẩm đã hỏi, size/màu sắc quan tâm, mã đơn hàng, và các yêu cầu cụ thể. ");
        payload.append("Bỏ qua những câu chào hỏi xã giao.");
        
        return payload.toString();
    }

    /**
     * Build block summary cho context
     */
    private String buildSummaryBlock(String summary) {
        return "[CONTEXT_SUMMARY]\n" + summary + "\n[/CONTEXT_SUMMARY]\n\n";
    }

    /**
     * Build block recent messages cho context
     */
    private String buildRecentMessagesBlock(List<String> messages) {
        if (messages == null || messages.isEmpty()) {
            return "";
        }
        
        StringBuilder block = new StringBuilder();
        block.append("[RECENT_MESSAGES]\n");
        for (String msg : messages) {
            block.append(msg).append("\n");
        }
        block.append("[/RECENT_MESSAGES]\n\n");
        
        return block.toString();
    }


    private List<String> trimRecentMessagesByTokens(List<String> messages, int maxTokens) {
        if (messages == null || messages.isEmpty()) {
            return new ArrayList<>();
        }
        
        List<String> result = new ArrayList<>();
        int currentTokens = 0;
        
        // Iterate từ cuối (messages gần nhất) về đầu
        for (int i = messages.size() - 1; i >= 0; i--) {
            String msg = messages.get(i);
            int msgTokens = countWords(msg);
            if (currentTokens + msgTokens <= maxTokens) {
                result.add(0, msg); // Add to beginning to maintain order
                currentTokens += msgTokens;
            } else {
                break;
            }
        }
        
        return result;
    }

    public int estimateTokens(String text) {
        return countWords(text);
    }

    /**
     * Clear summary cho session (useful for testing/reset)
     */
    @Transactional
    public void clearSummary(String sessionId) {
        conversationRepository.findBySessionIdAndIsActiveTrue(sessionId)
                .ifPresent(conv -> {
                    conv.setSummary(null);
                    conv.setLastSummarizedCount(0);
                    conversationRepository.save(conv);
                    log.info("Cleared summary for session: {}", sessionId);
                });
    }
}
