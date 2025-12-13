package com.example.online_shoe_store.Service;

import com.example.online_shoe_store.Service.ai.agent.FaqAgent;
import com.example.online_shoe_store.dto.ChatRequest;
import com.example.online_shoe_store.dto.ChatResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.UUID;

@Slf4j
//@Service
public class ChatBotService {

    private final FaqAgent faqAgent;

    public ChatBotService(FaqAgent faqAgent) {
        this.faqAgent = faqAgent;
    }

    public ChatResponse processMessage(ChatRequest request) {
        try {
            // Generate sessionId nếu chưa có
            String sessionId = request.getSessionId() != null
                    ? request.getSessionId()
                    : UUID.randomUUID().toString();

            log.info("Processing message for sessionId: {}", sessionId);
            String aiResponse = faqAgent.answer(sessionId, request.getMessage());
            log.info("Successfully got response from FaqAgent");

            return ChatResponse.builder()
                    .response(aiResponse)
                    .type("bot")
                    .sessionId(sessionId)  // Trả về sessionId
                    .build();

        } catch (Exception e) {
            log.error("Error processing chat message: {}", e.getMessage(), e);
            return ChatResponse.builder()
                    .response("Xin lỗi, đã có lỗi xảy ra. Vui lòng thử lại sau!")
                    .type("error")
                    .build();
        }
    }
}