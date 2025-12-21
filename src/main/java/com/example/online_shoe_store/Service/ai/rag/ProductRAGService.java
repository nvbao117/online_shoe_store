package com.example.online_shoe_store.Service.ai.rag;

import com.example.online_shoe_store.Entity.Product;
import com.example.online_shoe_store.Repository.ProductRepository;
import com.example.online_shoe_store.dto.response.ProductRAGResponse;
import dev.langchain4j.data.embedding.Embedding;
import dev.langchain4j.data.segment.TextSegment;
import dev.langchain4j.model.embedding.EmbeddingModel;
import dev.langchain4j.store.embedding.EmbeddingMatch;
import dev.langchain4j.store.embedding.EmbeddingSearchRequest;
import dev.langchain4j.store.embedding.EmbeddingSearchResult;
import dev.langchain4j.store.embedding.EmbeddingStore;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;

/**
 * Service để thực hiện RAG search cho sản phẩm
 * Search bằng text query và trả về sản phẩm với metadata đầy đủ
 */
@Service
@Slf4j
public class ProductRAGService {

    private final EmbeddingStore<TextSegment> productEmbeddingStore;
    private final EmbeddingModel embeddingModel;
    private final ProductRepository productRepository;

    public ProductRAGService(
            @Qualifier("productEmbeddingStore") EmbeddingStore<TextSegment> productEmbeddingStore,
            EmbeddingModel embeddingModel,
            ProductRepository productRepository
    ) {
        this.productEmbeddingStore = productEmbeddingStore;
        this.embeddingModel = embeddingModel;
        this.productRepository = productRepository;
    }

    /**
     * Tìm kiếm sản phẩm bằng RAG
     *
     * @param query    Text query từ người dùng
     * @param maxResults Số kết quả tối đa
     * @param minScore  Điểm tương đồng tối thiểu (0.0 - 1.0)
     * @return Danh sách sản phẩm phù hợp với metadata đầy đủ
     */
    public List<ProductRAGResponse> searchProducts(String query, int maxResults, double minScore) {
        log.info("[ProductRAG] Searching for: '{}', maxResults={}, minScore={}", query, maxResults, minScore);

        if (query == null || query.isBlank()) {
            log.warn("[ProductRAG] Empty query received");
            return List.of();
        }

        try {
            Embedding queryEmbedding = embeddingModel.embed(query).content();

            EmbeddingSearchRequest request = EmbeddingSearchRequest.builder()
                    .queryEmbedding(queryEmbedding)
                    .maxResults(maxResults)
                    .minScore(minScore)
                    .build();

            EmbeddingSearchResult<TextSegment> result = productEmbeddingStore.search(request);
            List<EmbeddingMatch<TextSegment>> matches = result.matches();

            log.info("[ProductRAG] Found {} matches from vector store", matches.size());

            // Convert matches to responses
            List<ProductRAGResponse> responses = new ArrayList<>();

            for (EmbeddingMatch<TextSegment> match : matches) {
                ProductRAGResponse response = convertMatchToResponse(match);
                if (response != null) {
                    responses.add(response);
                }
            }

            log.info("[ProductRAG] Returning {} products", responses.size());
            return responses;

        } catch (Exception e) {
            log.error("[ProductRAG] Search error: {}", e.getMessage(), e);
            return List.of();
        }
    }

    /**
     * Tìm kiếm sản phẩm với default parameters
     */
    public List<ProductRAGResponse> searchProducts(String query) {
        return searchProducts(query, 10, 0.5);
    }

    /**
     * Convert EmbeddingMatch thành ProductRAGResponse
     */
    private ProductRAGResponse convertMatchToResponse(EmbeddingMatch<TextSegment> match) {
        TextSegment segment = match.embedded();
        double score = match.score();

        if (segment == null || segment.metadata() == null) {
            log.warn("[ProductRAG] Match has no segment or metadata");
            return null;
        }

        Map<String, Object> metadataMap = segment.metadata().toMap();
        String productId = getStringValue(metadataMap, "id");

        // Ưu tiên lấy từ database để có thông tin mới nhất
        if (productId != null) {
            Optional<Product> productOpt = productRepository.findDetailById(productId);
            if (productOpt.isPresent()) {
                Product product = productOpt.get();
                return ProductRAGResponse.fromEntity(product, score);
            }
        }

        // Fallback: dùng metadata từ vector store
        return ProductRAGResponse.builder()
                .productId(productId)
                .name(getStringValue(metadataMap, "name"))
                .price(getBigDecimalValue(metadataMap, "price"))
                .imageUrl(getStringValue(metadataMap, "imageUrl"))
                .brandName(getStringValue(metadataMap, "brandName"))
                .categoryName(getStringValue(metadataMap, "categoryName"))
                .description(getStringValue(metadataMap, "description"))
                .score(score)
                .build();
    }

    private String getStringValue(Map<String, Object> map, String key) {
        Object value = map.get(key);
        return value != null ? value.toString() : null;
    }

    private BigDecimal getBigDecimalValue(Map<String, Object> map, String key) {
        Object value = map.get(key);
        if (value == null) return null;
        if (value instanceof Number) {
            return BigDecimal.valueOf(((Number) value).doubleValue());
        }
        try {
            return new BigDecimal(value.toString());
        } catch (NumberFormatException e) {
            return null;
        }
    }

    /**
     * Search và trả về kết quả dạng enriched từ database
     * Đảm bảo có đầy đủ thông tin mới nhất từ DB
     */
    public List<ProductRAGResponse> searchProductsEnriched(String query, int maxResults, double minScore) {
        List<ProductRAGResponse> responses = searchProducts(query, maxResults, minScore);
        
        // Các response đã được enrich từ database trong convertMatchToResponse
        // Nếu cần thêm logic enrich khác, thực hiện ở đây
        
        return responses;
    }
}
