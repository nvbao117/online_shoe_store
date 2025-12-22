package com.example.online_shoe_store.Config.ai;


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
        return AnthropicChatModel.builder()
                .apiKey(anthropicpiKey)
                .modelName(orchestratorModel)
                .maxTokens(1024)
                .temperature(0.0)
                .timeout(Duration.ofSeconds(30))
                .build();
    }

    @Bean(name = "workerModel")
    public ChatModel workerModel() {
        return AnthropicChatModel.builder()
                .apiKey(anthropicpiKey)
                .modelName(workerModel)
                .temperature(0.3)
                .maxTokens(1536)
                .timeout(Duration.ofSeconds(30))
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
