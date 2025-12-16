package com.example.online_shoe_store.config.ai;


import dev.langchain4j.model.anthropic.AnthropicChatModel;
import dev.langchain4j.model.chat.ChatModel;
import dev.langchain4j.model.embedding.EmbeddingModel;
import dev.langchain4j.model.openai.OpenAiEmbeddingModel;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Primary;

import java.time.Duration;

@Configuration
@Slf4j
public class AiModelConfig {
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

    @Bean(name = "orchestratorModel")
    @Primary
    public ChatModel orchestratorModel() {
        log.info("Initializing orchestrator model (Sonnet 4-5 Thinking)...");
        return AnthropicChatModel.builder()
                .apiKey(anthropicpiKey)
                .modelName(orchestratorModel)
                .thinkingType("enabled")
                .thinkingBudgetTokens(2048)
                .maxTokens(2048+200)
                .maxRetries(2)
                .returnThinking(true)
                .temperature(1.0)
                .timeout(Duration.ofSeconds(90))
                .build();
    }

    // Dùng cho các Agent con (Search, FAQ) để phản hồi nhanh, rẻ
    @Bean(name = "workerModel")
    public ChatModel workerModel() {
        log.info("Initializing worker model (Haiku 4-5 Thinking)...)");
        return AnthropicChatModel.builder()
                .apiKey(anthropicpiKey)
                .modelName(workerModel)
                .temperature(0.3)
                .maxTokens(2048)
                .timeout(Duration.ofSeconds(30))
                .build();
    }

    // --- 3. EMBEDDING MODEL ---
    @Bean
    public EmbeddingModel embeddingModel() {
        return OpenAiEmbeddingModel.builder()
                .apiKey(openaiApiKey)
                .modelName(embeddingModel)
                .build();
    }
}
