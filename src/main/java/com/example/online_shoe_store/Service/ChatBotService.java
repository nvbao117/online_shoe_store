package com.example.online_shoe_store.Service;


import com.example.online_shoe_store.Entity.Conversation;
import com.example.online_shoe_store.Entity.ConversationMessage;
import com.example.online_shoe_store.Entity.enums.MessageRole;
import com.example.online_shoe_store.Repository.ConversationMessageRepository;
import com.example.online_shoe_store.Repository.ConversationRepository;
import com.example.online_shoe_store.Service.ai.agent.shop.ShopChatAgent;
import com.example.online_shoe_store.dto.request.ChatRequest;
import com.example.online_shoe_store.dto.response.ChatResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;


@Slf4j
@Service
@RequiredArgsConstructor
public class ChatBotService {

    private final ShopChatAgent shopChatAgent;
    private final ConversationRepository conversationRepository;
    private final ConversationMessageRepository messageRepository;

    @Transactional
    public ChatResponse processMessage(ChatRequest request) {
        long startTime = System.currentTimeMillis();
        
        // Generate sessionId if not provided
        String sessionId = request.getSessionId();
        if (sessionId == null || sessionId.isBlank()) {
            sessionId = java.util.UUID.randomUUID().toString();
            log.info("Generated new sessionId: {}", sessionId);
        }
        
        // 1. Get or create conversation
        Conversation conversation = getOrCreateConversation(sessionId);
        
        // 2. Save user message
        saveMessage(conversation, MessageRole.USER, request.getMessage());
        
        // 3. Get AI response
        String answer = shopChatAgent.chat(sessionId, request.getMessage());
        
        // 4. Save assistant response
        saveMessage(conversation, MessageRole.ASSISTANT, answer);
        
        // 5. Update conversation metadata
        conversation.setLastMessageAt(LocalDateTime.now());
        conversation.setMessageCount(conversation.getMessageCount() + 2);
        conversationRepository.save(conversation);
        
        long processingTime = System.currentTimeMillis() - startTime;
        log.info("[ChatBot] Processed message in {}ms for session: {}", processingTime, sessionId);

        return ChatResponse.builder()
                .sessionId(sessionId)
                .response(answer)
                .type("TEXT")
                .build();
    }

    private Conversation getOrCreateConversation(String sessionId) {
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

    private void saveMessage(Conversation conversation, MessageRole role, String content) {
        ConversationMessage message = ConversationMessage.builder()
                .conversation(conversation)
                .role(role)
                .content(content)
                .build();
        messageRepository.save(message);
    }
}