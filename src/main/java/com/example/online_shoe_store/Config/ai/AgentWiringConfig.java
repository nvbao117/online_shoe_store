package com.example.online_shoe_store.config.ai;

import com.example.online_shoe_store.Service.ai.agent.OrchestratorAgent;
import com.example.online_shoe_store.Service.ai.agent.SearchAgent;
import com.example.online_shoe_store.Service.ai.agent.SupportAgent;
import com.example.online_shoe_store.Service.ai.agent.sales.SalesAgent;
import com.example.online_shoe_store.Service.ai.agent.sales.CartAgent;
import com.example.online_shoe_store.Service.ai.agent.sales.RecommendAgent;
import com.example.online_shoe_store.Service.ai.agent.operations.LogisticsAgent;
import com.example.online_shoe_store.Service.ai.agent.operations.InventoryAgent;
import com.example.online_shoe_store.Service.ai.agent.marketing.MarketingAgent;
import com.example.online_shoe_store.Service.ai.agent.system.SummarizerAgent;
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

    // ═══════════════════════════════════════════
    // ORCHESTRATION LAYER
    // ═══════════════════════════════════════════
    
    @Bean
    public OrchestratorAgent orchestratorAgent(
            @Qualifier("orchestratorModel") ChatModel model
    ) {
        return AiServices.builder(OrchestratorAgent.class)
                .chatModel(model)
                .chatMemoryProvider(id -> MessageWindowChatMemory.withMaxMessages(2))
                .build();
    }

    @Bean
    public SummarizerAgent summarizerAgent(
            @Qualifier("workerModel") ChatModel model
    ) {
        return AiServices.builder(SummarizerAgent.class)
                .chatModel(model)
                .chatMemoryProvider(id -> MessageWindowChatMemory.withMaxMessages(2))
                .build();
    }

    // ═══════════════════════════════════════════
    // SALES DOMAIN (with Tools)
    // ═══════════════════════════════════════════
    
    @Bean
    public SearchAgent searchAgent(
            @Qualifier("workerModel") ChatModel model,
            ProductSearchTools productTools,
            InventoryTools inventoryTools
    ) {
        return AiServices.builder(SearchAgent.class)
                .chatModel(model)
                .chatMemoryProvider(id -> MessageWindowChatMemory.withMaxMessages(20))
                .tools(productTools, inventoryTools)
                .build();
    }

    @Bean
    public SalesAgent salesAgent(
            @Qualifier("workerModel") ChatModel model,
            SalesTools salesTools,
            InventoryTools inventoryTools
    ) {
        return AiServices.builder(SalesAgent.class)
                .chatModel(model)
                .chatMemoryProvider(id -> MessageWindowChatMemory.withMaxMessages(20))
                .tools(salesTools, inventoryTools)
                .build();
    }

    @Bean
    public CartAgent cartAgent(
            @Qualifier("workerModel") ChatModel model,
            SalesTools salesTools
    ) {
        return AiServices.builder(CartAgent.class)
                .chatModel(model)
                .chatMemoryProvider(id -> MessageWindowChatMemory.withMaxMessages(10))
                .tools(salesTools)
                .build();
    }

    @Bean
    public RecommendAgent recommendAgent(
            @Qualifier("workerModel") ChatModel model,
            ProductSearchTools productTools
    ) {
        return AiServices.builder(RecommendAgent.class)
                .chatModel(model)
                .chatMemoryProvider(id -> MessageWindowChatMemory.withMaxMessages(15))
                .tools(productTools)
                .build();
    }

    // ═══════════════════════════════════════════
    // SUPPORT DOMAIN (with Tools + RAG)
    // ═══════════════════════════════════════════
    
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
                .chatMemoryProvider(id -> MessageWindowChatMemory.withMaxMessages(10))
                .tools(supportTools, orderTools)
                .build();
    }

    // ═══════════════════════════════════════════
    // OPERATIONS DOMAIN (with Tools)
    // ═══════════════════════════════════════════
    
    @Bean
    public LogisticsAgent logisticsAgent(
            @Qualifier("workerModel") ChatModel model,
            OrderTools orderTools
    ) {
        return AiServices.builder(LogisticsAgent.class)
                .chatModel(model)
                .chatMemoryProvider(id -> MessageWindowChatMemory.withMaxMessages(10))
                .tools(orderTools)
                .build();
    }

    @Bean
    public InventoryAgent inventoryAgent(
            @Qualifier("workerModel") ChatModel model,
            InventoryTools inventoryTools
    ) {
        return AiServices.builder(InventoryAgent.class)
                .chatModel(model)
                .chatMemoryProvider(id -> MessageWindowChatMemory.withMaxMessages(10))
                .tools(inventoryTools)
                .build();
    }

    // ═══════════════════════════════════════════
    // MARKETING DOMAIN (with Tools)
    // ═══════════════════════════════════════════
    
    @Bean
    public MarketingAgent marketingAgent(
            @Qualifier("workerModel") ChatModel model,
            MarketingTools marketingTools
    ) {
        return AiServices.builder(MarketingAgent.class)
                .chatModel(model)
                .chatMemoryProvider(id -> MessageWindowChatMemory.withMaxMessages(15))
                .tools(marketingTools)
                .build();
    }

    // ═══════════════════════════════════════════
    // CONTENT RETRIEVERS (RAG)
    // ═══════════════════════════════════════════
    
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
