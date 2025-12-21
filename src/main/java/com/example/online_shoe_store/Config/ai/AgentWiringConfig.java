package com.example.online_shoe_store.Config.ai;

import com.example.online_shoe_store.Service.ai.agent.OrchestratorAgent;
import com.example.online_shoe_store.Service.ai.agent.ProductAgent;
import com.example.online_shoe_store.Service.ai.agent.SupportAgent;
import com.example.online_shoe_store.Service.ai.agent.SummarizerAgent;
import com.example.online_shoe_store.Service.ai.tool.*;
import dev.langchain4j.data.segment.TextSegment;
import dev.langchain4j.memory.chat.MessageWindowChatMemory;
import dev.langchain4j.model.chat.ChatModel;
import dev.langchain4j.model.embedding.EmbeddingModel;
import dev.langchain4j.rag.content.retriever.ContentRetriever;
import dev.langchain4j.rag.content.retriever.EmbeddingStoreContentRetriever;
import dev.langchain4j.service.AiServices;
import dev.langchain4j.store.embedding.EmbeddingStore;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
@Slf4j
public class AgentWiringConfig {

    @Bean
    public OrchestratorAgent orchestratorAgent(
            @Qualifier("orchestratorModel") ChatModel model
    ) {
        return AiServices.builder(OrchestratorAgent.class)
                .chatModel(model)
                .chatMemoryProvider(id -> MessageWindowChatMemory.withMaxMessages(5))
                .build();
    }

    @Bean
    public SummarizerAgent summarizerAgent(
            @Qualifier("workerModel") ChatModel model
    ) {
        return AiServices.builder(SummarizerAgent.class)
                .chatModel(model)
                .chatMemoryProvider(id -> MessageWindowChatMemory.withMaxMessages(5))
                .build();
    }

    @Bean
    public ProductAgent productAgent(
            @Qualifier("workerModel") ChatModel model,
            ProductSearchTools productTools,
            InventoryTools inventoryTools
    ) {
        return AiServices.builder(ProductAgent.class)
                .chatModel(model)
                .chatMemoryProvider(id -> MessageWindowChatMemory.withMaxMessages(5))
                .tools(productTools, inventoryTools)
                .build();
    }

    @Bean
    public SupportAgent supportAgent(
            @Qualifier("workerModel") ChatModel model,
            ContentRetriever faqRetriever,
            SupportTools supportTools,
            OrderTools orderTools
    ) {
        return AiServices.builder(SupportAgent.class)
                .chatModel(model)
                .contentRetriever(faqRetriever)
                .chatMemoryProvider(id -> MessageWindowChatMemory.withMaxMessages(5))
                .tools(supportTools, orderTools)
                .build();
    }


    @Bean
    public ContentRetriever faqRetriever(
            @Qualifier("faqEmbeddingStore") EmbeddingStore<TextSegment> store,
            EmbeddingModel embeddingModel
    ) {
        return EmbeddingStoreContentRetriever.builder()
                .embeddingStore(store)
                .embeddingModel(embeddingModel)
                .maxResults(3)
                .minScore(0.7)
                .build();
    }
}
