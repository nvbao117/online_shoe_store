package com.example.online_shoe_store.Service.ai.config;


import com.example.online_shoe_store.Service.ai.monitoring.ToolLoggingChatModelListener;
import dev.langchain4j.model.anthropic.AnthropicChatModel;
import dev.langchain4j.model.chat.ChatModel;
import dev.langchain4j.model.embedding.EmbeddingModel;
import dev.langchain4j.model.openai.OpenAiEmbeddingModel;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Primary;

import java.time.Duration;
import java.util.List;

@Configuration
@Slf4j
@RequiredArgsConstructor
public class AiModelConfig {

    private final ToolLoggingChatModelListener toolLoggingListener;

    @Value("${anthropic.api.key}")
    private String anthropicpiKey;
    @Value("${openai.api.key}")
    private String openaiApiKey;
    @Value("${anthropic.model.worker}")
    private String workerModel;
    @Value("${anthropic.model.orchestrator}")
    private String orchestratorModel;
    @Value("${openai.embedding-model}")
    private String embeddingModel;
    @Value("${ai.logging.requests:false}")
    private boolean logRequests;
    @Value("${ai.logging.responses:false}")
    private boolean logResponses;

    @Bean(name = "orchestratorModel")
    @Primary
    public ChatModel orchestratorModel() {
        log.info("Creating orchestrator model: {}, logRequests: {}, logResponses: {}", 
                orchestratorModel, logRequests, logResponses);
        return AnthropicChatModel.builder()
                .apiKey(anthropicpiKey)
                .modelName(orchestratorModel)
                .maxTokens(1024)
                .temperature(0.0)
                .timeout(Duration.ofSeconds(30))
                .logRequests(logRequests)
                .logResponses(logResponses)
                .listeners(List.of(toolLoggingListener))
                .build();
    }

    @Bean(name = "workerModel")
    public ChatModel workerModel() {
        log.info("Creating worker model: {}, logRequests: {}, logResponses: {}", 
                workerModel, logRequests, logResponses);
        return AnthropicChatModel.builder()
                .apiKey(anthropicpiKey)
                .modelName(workerModel)
                .temperature(0.3)
                .maxTokens(1536)
                .timeout(Duration.ofSeconds(30))
                .logRequests(logRequests)
                .logResponses(logResponses)
                .listeners(List.of(toolLoggingListener))
                .build();
    }

    @Bean
    public EmbeddingModel embeddingModel() {
        return OpenAiEmbeddingModel.builder()
                .apiKey(openaiApiKey)
                .modelName(embeddingModel)
                .build();
    }
}

