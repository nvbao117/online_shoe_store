package com.example.online_shoe_store.Service;

import com.example.online_shoe_store.Service.ai.execution.AgentExecutor;
import com.example.online_shoe_store.dto.orchestrator.SupervisorResponse;
import com.example.online_shoe_store.dto.request.ChatRequest;
import com.example.online_shoe_store.dto.response.ChatResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.UUID;

@Slf4j
@Service
@RequiredArgsConstructor
public class ChatBotService {

    private final AgentExecutor agentExecutor;

    public ChatResponse processMessage(ChatRequest request) {
        try {
            String sessionId = request.getSessionId() != null
                    ? request.getSessionId()
                    : UUID.randomUUID().toString();

            log.info("Processing message for sessionId: {}", sessionId);
            
            SupervisorResponse result = agentExecutor.process(sessionId, request.getMessage());
            
            log.info("AgentExecutor completed: agents={}, time={}ms",
                result.getAgentsUsed(),
                result.getProcessingTimeMs());

            return ChatResponse.builder()
                    .response(result.getResponse())
                    .type(result.isError() ? "error" : "bot")
                    .sessionId(sessionId)
                    .intent(result.getIntent() != null ? result.getIntent().name() : null)
                    .subIntent(result.getSubIntent())
                    .confidence(result.getConfidence())
                    .urgency(result.getUrgency() != null ? result.getUrgency().name() : null)
                    .suggestedActions(result.getSuggestedActions())
                    .escalationTriggered(result.isEscalationTriggered())
                    .processingTimeMs(result.getProcessingTimeMs())
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