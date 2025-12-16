package com.example.online_shoe_store.Service.ai.rag;

import com.example.online_shoe_store.Entity.Product;
import com.example.online_shoe_store.Repository.ProductRepository;
import dev.langchain4j.data.document.Document;
import dev.langchain4j.data.document.Metadata;
import dev.langchain4j.data.segment.TextSegment;
import dev.langchain4j.model.embedding.EmbeddingModel;
import dev.langchain4j.store.embedding.EmbeddingStore;
import dev.langchain4j.store.embedding.EmbeddingStoreIngestor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.event.EventListener;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import java.text.NumberFormat;
import java.util.List;
import java.util.Locale;
import java.util.stream.Collectors;

@Service
@Slf4j
public class ProductEmbeddingService {

    private final ProductRepository productRepository;
    private final EmbeddingStore<TextSegment> embeddingStore;
    private final EmbeddingModel embeddingModel;

    @Value("${search.agent.embedding.force-reingest:false}")
    private Boolean forceReingest;

    private static final NumberFormat VND_FORMAT = NumberFormat.getInstance(new Locale("vi", "VN"));

    // Constructor với @Qualifier để inject đúng bean
    public ProductEmbeddingService(
            ProductRepository productRepository,
            @Qualifier("productEmbeddingStore") EmbeddingStore<TextSegment> embeddingStore,
            EmbeddingModel embeddingModel
    ) {
        this.productRepository = productRepository;
        this.embeddingStore = embeddingStore;
        this.embeddingModel = embeddingModel;
    }

    @EventListener(ApplicationReadyEvent.class)
    @Async
    public void onApplicationReady() {
        if (Boolean.TRUE.equals(forceReingest)) {
            log.info("🚀 [ProductRAG] Force re-ingesting products...");
            ingestAllProducts();
        } else {
            log.info("⏭️ [ProductRAG] Product ingestion skipped (force-reingest=false)");
        }
    }

    public void ingestAllProducts() {
        try {
            List<Product> products = productRepository.findAll();

            if (products.isEmpty()) {
                log.warn("[ProductRAG] No products found in Database!");
                return;
            }

            log.info("[ProductRAG] Found {} products. Converting to vectors...", products.size());

            List<Document> documents = products.stream()
                    .map(this::createDocumentFromProduct)
                    .collect(Collectors.toList());

            EmbeddingStoreIngestor ingestor = EmbeddingStoreIngestor.builder()
                    .embeddingModel(embeddingModel)
                    .embeddingStore(embeddingStore)
                    .build();

            ingestor.ingest(documents);

            log.info("[ProductRAG] Successfully ingested {} products!", products.size());

        } catch (Exception e) {
            log.error("[ProductRAG] Error during product ingestion: {}", e.getMessage(), e);
        }
    }

    private Document createDocumentFromProduct(Product p) {
        StringBuilder content = new StringBuilder();
        content.append(p.getName());

        if (p.getBrand() != null) {
            content.append(" - Hãng: ").append(p.getBrand().getName());
        }

        if (p.getCategory() != null) {
            content.append(" - Loại: ").append(p.getCategory().getName());
        }

        if (p.getDescription() != null && !p.getDescription().isBlank()) {
            content.append(". Mô tả: ").append(p.getDescription());
        }

        if (p.getPrice() != null) {
            content.append(". Giá: ").append(VND_FORMAT.format(p.getPrice())).append("đ");
        }

        Metadata metadata = new Metadata();
        metadata.put("id", p.getProductId().toString());
        metadata.put("name", p.getName());

        if (p.getBrand() != null) metadata.put("brand", p.getBrand().getName());
        if (p.getCategory() != null) metadata.put("category", p.getCategory().getName());
        if (p.getPrice() != null) metadata.put("price", p.getPrice().toString());

        return Document.from(content.toString(), metadata);
    }
}
