package com.example.online_shoe_store.Controller.api;

import com.example.online_shoe_store.Entity.Product;
import com.example.online_shoe_store.Repository.ProductRepository;
import com.example.online_shoe_store.dto.response.ProductSearchResultResponse;
import dev.langchain4j.data.embedding.Embedding;
import dev.langchain4j.data.segment.TextSegment;
import dev.langchain4j.model.embedding.EmbeddingModel;
import dev.langchain4j.store.embedding.EmbeddingMatch;
import dev.langchain4j.store.embedding.EmbeddingSearchRequest;
import dev.langchain4j.store.embedding.EmbeddingSearchResult;
import dev.langchain4j.store.embedding.EmbeddingStore;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@RestController
@RequestMapping("/api/search")
public class SearchAPIController {

    private static final Logger log = LoggerFactory.getLogger(SearchAPIController.class);

    private final ProductRepository productRepository;
    private final EmbeddingStore<TextSegment> productEmbeddingStore;
    private final EmbeddingModel embeddingModel;

    public SearchAPIController(ProductRepository productRepository,
                               @Qualifier("productEmbeddingStore") EmbeddingStore<TextSegment> productEmbeddingStore,
                               EmbeddingModel embeddingModel) {
        this.productRepository = productRepository;
        this.productEmbeddingStore = productEmbeddingStore;
        this.embeddingModel = embeddingModel;
    }

    @GetMapping("/semantic")
    public ResponseEntity<List<ProductSearchResultResponse>> semanticSearch(
            @RequestParam(name = "query") String query,
            @RequestParam(name = "limit", required = false) Integer limit,
            @RequestParam(name = "minScore", required = false) Double minScore
    ) {
        if (query == null || query.isBlank()) {
            return ResponseEntity.badRequest().build();
        }

        int maxResults = (limit != null && limit > 0) ? limit : 5;
        double threshold = (minScore != null && minScore > 0 && minScore <= 1.0) ? minScore : 0.5;

        try {
            Embedding queryEmbedding = embeddingModel.embed(query).content();
            EmbeddingSearchRequest request = EmbeddingSearchRequest.builder()
                    .queryEmbedding(queryEmbedding)
                    .maxResults(maxResults)
                    .minScore(threshold)
                    .build();

            EmbeddingSearchResult<TextSegment> result = productEmbeddingStore.search(request);
            List<EmbeddingMatch<TextSegment>> matches = result.matches();

            List<ProductSearchResultResponse> responses = new ArrayList<>();
            for (EmbeddingMatch<TextSegment> match : matches) {
                TextSegment segment = match.embedded();
                String productId = extractProductId(segment);

                Optional<Product> optProduct = Optional.empty();
                if (productId != null) {
                    optProduct = productRepository.findById(productId);
                }

                if (optProduct.isEmpty()) {
                    String inferredName = extractName(segment.text());
                    optProduct = productRepository.findByName(inferredName)
                            .or(() -> {
                                List<Product> byLike = productRepository.findByNameContainingIgnoreCase(inferredName);
                                return byLike.stream().findFirst();
                            });
                }

                if (optProduct.isEmpty()) continue;
                Product product = optProduct.get();
                responses.add(ProductSearchResultResponse.fromEntity(product, match.score()));
            }

            return ResponseEntity.ok(responses);
        } catch (Exception e) {
            log.error("[SearchAPI] Semantic search error", e);
            return ResponseEntity.internalServerError().build();
        }
    }

    private String extractProductId(TextSegment segment) {
        if (segment == null || segment.metadata() == null) return null;
        try {
            Map<String, Object> map = segment.metadata().toMap();
            Object id = map.get("id");
            return id != null ? id.toString() : null;
        } catch (Exception e) {
            return null;
        }
    }

    private String extractName(String text) {
        if (text == null) return "";
        int idx = text.indexOf(" - Hãng:");
        if (idx > 0) return text.substring(0, idx).trim();
        return text.trim();
    }
}
