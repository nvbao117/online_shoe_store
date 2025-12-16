package com.example.online_shoe_store.Service.ai.rag;

import dev.langchain4j.data.document.Document;
import dev.langchain4j.data.document.loader.FileSystemDocumentLoader;
import dev.langchain4j.data.document.parser.TextDocumentParser;
import dev.langchain4j.data.document.splitter.DocumentSplitters;
import dev.langchain4j.data.segment.TextSegment;
import dev.langchain4j.model.embedding.EmbeddingModel;
import dev.langchain4j.store.embedding.EmbeddingStore;
import dev.langchain4j.store.embedding.EmbeddingStoreIngestor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.event.EventListener;
import org.springframework.core.io.Resource;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

@Service
@Slf4j
public class FaqEmbeddingService {

    private final EmbeddingStore<TextSegment> embeddingStore;
    private final EmbeddingModel embeddingModel;

    @Value("${faq.agent.rag.force-reingest:false}")
    private Boolean forceReingest;

    @Value("classpath:knowledge-base/faq")
    private Resource faqDirectoryResource;

    // Constructor với @Qualifier để inject đúng bean
    public FaqEmbeddingService(
            @Qualifier("faqEmbeddingStore") EmbeddingStore<TextSegment> embeddingStore,
            EmbeddingModel embeddingModel
    ) {
        this.embeddingStore = embeddingStore;
        this.embeddingModel = embeddingModel;
    }

    @EventListener(ApplicationReadyEvent.class)
    @Async
    public void onApplicationReady() {
        if (Boolean.TRUE.equals(forceReingest)) {
            log.info("🚀 [FaqRAG] Force re-ingesting FAQ documents...");
            ingestFaqs();
        } else {
            log.info("⏭️ [FaqRAG] FAQ ingestion skipped (force-reingest=false)");
        }
    }

    public void ingestFaqs() {
        try {
            Path path = Paths.get(faqDirectoryResource.getURI());
            log.info("[FaqRAG] Loading documents from: {}", path);

            List<Document> documents = FileSystemDocumentLoader.loadDocuments(
                    path, new TextDocumentParser()
            );

            if (documents.isEmpty()) {
                log.warn("[FaqRAG] No documents found to ingest!");
                return;
            }

            log.info("[FaqRAG] Found {} documents. Starting ingestion...", documents.size());
            EmbeddingStoreIngestor.builder()
                    .documentSplitter(DocumentSplitters.recursive(300, 50))
                    .embeddingModel(embeddingModel)
                    .embeddingStore(embeddingStore)
                    .build()
                    .ingest(documents);

            log.info("[FaqRAG] Ingestion completed successfully!");

        } catch (Exception e) {
            log.error("[FaqRAG] Error ingesting documents: {}", e.getMessage(), e);
        }
    }
}
