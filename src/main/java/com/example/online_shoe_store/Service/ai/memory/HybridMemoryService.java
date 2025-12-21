package com.example.online_shoe_store.Service.ai.memory;

import com.example.online_shoe_store.Entity.Conversation;
import com.example.online_shoe_store.Repository.ConversationRepository;
import com.example.online_shoe_store.Service.ai.agent.SummarizerAgent;
import com.example.online_shoe_store.Service.ai.execution.ConversationService;
import com.example.online_shoe_store.dto.memory.HybridMemoryContext;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Objects;

@Service
@Slf4j
@RequiredArgsConstructor
public class HybridMemoryService {

    private static final int SUMMARY_TRIGGER_DELTA = 8;
    private static final int SUMMARY_WINDOW = 20;
    private static final int RECENT_WINDOW = 8;

    private final ConversationRepository conversationRepository;
    private final ConversationService conversationService;
    private final SummarizerAgent summarizerAgent;

    @Transactional
    public HybridMemoryContext buildContext(String sessionId) {

        Conversation conv = conversationService.getOrCreateConversation(sessionId);
        refreshSummaryIfNeeded(conv);
        List<String> recent = conversationService.getRecentHistory(sessionId, RECENT_WINDOW);
        return HybridMemoryContext.builder()
                .summary(conv.getSummary())
                .recentMessages(recent)
                .messageCount(conv.getMessageCount())
                .build();
    }


    @Transactional(readOnly = true)
    public String enrichWithContext(String sessionId, String userMessage) {
        HybridMemoryContext ctx = buildContext(sessionId);

        StringBuilder sb = new StringBuilder();
        if (ctx.getSummary() != null && !ctx.getSummary().isBlank()) {
            sb.append("[SUMMARY] ").append(ctx.getSummary()).append(" [/SUMMARY]\n");
        }
        if (ctx.getRecentMessages() != null && !ctx.getRecentMessages().isEmpty()) {
            sb.append("[RECENT]");
            ctx.getRecentMessages().forEach(m -> sb.append(" ").append(m).append(" |"));
            sb.append(" [/RECENT]\n");
        }
        sb.append("USER: ").append(userMessage);
        return sb.toString();
    }

    private void refreshSummaryIfNeeded(Conversation conv) {
        int last = Objects.requireNonNullElse(conv.getLastSummarizedCount(), 0);
        int delta = conv.getMessageCount() - last;
        if (delta < SUMMARY_TRIGGER_DELTA) {
            return;
        }

        List<String> window = conversationService.getRecentHistory(conv.getSessionId(), SUMMARY_WINDOW);
        String prevSummary = conv.getSummary() == null ? "" : conv.getSummary();
        String payload = "Previous summary:" + prevSummary + "\nRecent messages:" + String.join("\n", window);

        try {
            String newSummary = summarizerAgent.aggregate(payload);
            conv.setSummary(newSummary);
            conv.setLastSummarizedCount(conv.getMessageCount());
            conversationRepository.save(conv);
            log.info("Updated conversation summary for session {} ({} msgs)", conv.getSessionId(), conv.getMessageCount());
        } catch (Exception e) {
            log.warn("Summarization failed: {}", e.getMessage());
        }
    }
}
