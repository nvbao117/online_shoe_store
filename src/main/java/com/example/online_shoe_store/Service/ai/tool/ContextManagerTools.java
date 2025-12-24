package com.example.online_shoe_store.Service.ai.tool;

import com.example.online_shoe_store.Entity.Conversation;
import com.example.online_shoe_store.Repository.ConversationRepository;
import com.example.online_shoe_store.Service.ai.execution.ConversationService;
import dev.langchain4j.agent.tool.Tool;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Tools cho ContextManagerAgent để tương tác với database
 */
@Component
@Slf4j
@RequiredArgsConstructor
public class ContextManagerTools {

    private final ConversationService conversationService;
    private final ConversationRepository conversationRepository;

    @Tool("Lấy N tin nhắn gần nhất từ lịch sử hội thoại")
    public String fetchRecentMessages(String sessionId, int count) {
        log.info("[ContextTool] Fetching {} recent messages for session: {}", count, sessionId);
        
        List<String> messages = conversationService.getRecentHistory(sessionId, count);
        
        if (messages.isEmpty()) {
            log.info("[ContextTool] No messages found for session: {}", sessionId);
            return "Không có lịch sử hội thoại.";
        }
        
        String result = String.join("\n", messages);
        log.info("[ContextTool] Found {} messages for session: {}", messages.size(), sessionId);
        log.info("[ContextTool] Messages content:\n{}", result);
        return result;
    }

    @Tool("Lấy bản tóm tắt của cuộc hội thoại (nếu có)")
    public String fetchConversationSummary(String sessionId) {
        log.info("[ContextTool] Fetching summary for session: {}", sessionId);
        
        return conversationRepository.findBySessionIdAndIsActiveTrue(sessionId)
                .map(Conversation::getSummary)
                .filter(s -> s != null && !s.isBlank())
                .orElse("Chưa có bản tóm tắt.");
    }

    @Tool("Cập nhật bản tóm tắt mới cho cuộc hội thoại")
    public String updateSummary(String sessionId, String newSummary) {
        log.info("[ContextTool] Updating summary for session: {}", sessionId);
        
        return conversationRepository.findBySessionIdAndIsActiveTrue(sessionId)
                .map(conv -> {
                    conv.setSummary(newSummary);
                    conversationRepository.save(conv);
                    return "Đã cập nhật tóm tắt thành công.";
                })
                .orElse("Không tìm thấy cuộc hội thoại.");
    }
}
