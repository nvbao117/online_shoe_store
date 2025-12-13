package com.example.online_shoe_store.Config.ai;

import dev.langchain4j.data.document.Document;
import dev.langchain4j.data.document.DocumentSplitter;
import dev.langchain4j.data.document.loader.FileSystemDocumentLoader;
import dev.langchain4j.data.document.parser.TextDocumentParser;
import dev.langchain4j.data.document.splitter.DocumentSplitters;
import dev.langchain4j.data.embedding.Embedding;
import dev.langchain4j.data.segment.TextSegment;
import dev.langchain4j.memory.chat.ChatMemoryProvider;
import dev.langchain4j.memory.chat.MessageWindowChatMemory;
import dev.langchain4j.model.anthropic.AnthropicChatModel;
import dev.langchain4j.model.chat.ChatModel;
import dev.langchain4j.model.embedding.EmbeddingModel;
import dev.langchain4j.model.openai.OpenAiEmbeddingModel;
import dev.langchain4j.rag.content.retriever.ContentRetriever;
import dev.langchain4j.rag.content.retriever.EmbeddingStoreContentRetriever;
import dev.langchain4j.store.embedding.EmbeddingStore;
import dev.langchain4j.store.embedding.EmbeddingStoreIngestor;
import dev.langchain4j.store.embedding.chroma.ChromaEmbeddingStore;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.Duration;
import java.util.List;

@Configuration
public class FaqAgentConfig {
    private static final Logger log= LoggerFactory.getLogger(FaqAgentConfig.class);

    @Value("${anthropic.api.key}") private String anthropicApiKey;

    @Value("${openai.api.key}") private String openaiApiKey;

    @Value("${chroma.base.url}") private String chromaBaseUrl;

    @Value("${chroma.collection.name}")
    private String chromaCollectionName;
    @Value("${faq.agent.temperature:0.3}")
    private Double temperature;
    @Value("${faq.agent.max-tokens:1024}")
    private Integer maxTokens;
    @Value("${faq.agent.memory.max-messages:10}")
    private Integer maxMessages;
    @Value("${faq.agent.rag.max-results:3}")
    private Integer ragMaxResults;
    @Value("${faq.agent.rag.min-score:0.6}")
    private Double ragMinScore;
    @Value("${faq.agent.rag.force-reingest:false}")
    private Boolean forceReingest;
    
    @Bean
    public ChatModel faqChatModel(){
        log.info("Initializing Anthropic Chat Model for FAQ Agent");
        return AnthropicChatModel.builder()
                .apiKey(anthropicApiKey)
                .modelName("claude-3-5-haiku-20241022")
                .temperature(temperature)
                .maxTokens(maxTokens)
                .timeout(Duration.ofSeconds(60))
                .build();
    }

    @Bean
    public EmbeddingModel faqEmbeddingModel() {
        log.info("Initializing OpenAI Embedding Model");
        return OpenAiEmbeddingModel.builder()
                .apiKey(openaiApiKey)
                .modelName("text-embedding-3-small")
                .build();
    }

    @Bean
    public EmbeddingStore<TextSegment> faqEmbeddingStore(EmbeddingModel embeddingModel) {
        log.info("Initializing ChromaDB Embedding Store");
        ChromaEmbeddingStore embeddingStore = ChromaEmbeddingStore.builder()
                .baseUrl(chromaBaseUrl)
                .collectionName(chromaCollectionName)
                .build();
        Path faqPath = Paths.get("src/main/resources/knowledge-base/faq");
        File faqDir = faqPath.toFile();

        if (!forceReingest) {
            log.info("Skipping FAQ ingestion (force-reingest=false)");
            return embeddingStore;
        }

        if(!faqDir.exists() || !faqDir.isDirectory()){
            log.warn("FAQ directory not found: {}", faqPath);
            log.warn("Creating empty embedding store. Please add FAQ documents to: {}", faqPath);
            return embeddingStore;
        }

        try {
            List<Document> documents = FileSystemDocumentLoader.loadDocuments(
                faqPath,
                new TextDocumentParser()
            );
            
            if(documents.isEmpty()){
                log.warn("No FAQ documents found in: {}", faqPath);
                return embeddingStore;
            }
            log.info("Loaded {} FAQ documents", documents.size());
            DocumentSplitter splitter = DocumentSplitters.recursive(
                    300,  // max chunk size (tokens)
                    20    // overlap
            );

            EmbeddingStoreIngestor ingestor = EmbeddingStoreIngestor.builder()
                    .documentSplitter(splitter)
                    .embeddingModel(embeddingModel)
                    .embeddingStore(embeddingStore)
                    .build();

            ingestor.ingest(documents);
            log.info("Successfully ingested FAQ documents into ChromaDB");
        }catch (Exception e) {
            log.error("Error loading FAQ documents", e);
        }
        return embeddingStore;
    }

    @Bean
    public ContentRetriever faqContentRetriever(
            EmbeddingStore<TextSegment> embeddingStore,
            EmbeddingModel embeddingModel
    ){
        log.info("Initializing Content Retriever with maxResults={}, minScore={}",
                ragMaxResults, ragMinScore);

        return  EmbeddingStoreContentRetriever.builder()
                .embeddingStore(embeddingStore)
                .embeddingModel(embeddingModel)
                .maxResults(ragMaxResults)
                .minScore(ragMinScore)
                .build();

    }
    @Bean
    public ChatMemoryProvider faqChatMemoryProvider() {
        log.info("Initializing Chat Memory Provider with maxMessages={}", maxMessages);
        return sessionId -> MessageWindowChatMemory.builder()
                .id(sessionId)
                .maxMessages(maxMessages)
                .build();
    }
}
