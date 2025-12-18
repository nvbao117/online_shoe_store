package com.example.online_shoe_store.Service.ai.tool;

import com.example.online_shoe_store.Entity.Product;
import com.example.online_shoe_store.Repository.ProductRepository;
import dev.langchain4j.agent.tool.P;
import dev.langchain4j.agent.tool.Tool;
import dev.langchain4j.data.embedding.Embedding;
import dev.langchain4j.data.segment.TextSegment;
import dev.langchain4j.model.embedding.EmbeddingModel;
import dev.langchain4j.store.embedding.EmbeddingMatch;
import dev.langchain4j.store.embedding.EmbeddingSearchRequest;
import dev.langchain4j.store.embedding.EmbeddingSearchResult;
import dev.langchain4j.store.embedding.EmbeddingStore;
import jakarta.persistence.criteria.Predicate;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Component;

import java.math.BigDecimal;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

/**
 * ProductSearchTools - Tools cho SearchAgent để tìm kiếm sản phẩm.
 * 
 * Tools:
 * 1. semanticSearch: Tìm kiếm theo ngữ nghĩa (vector search)
 * 2. filterProducts: Lọc theo tiêu chí cụ thể (JPA Specification)
 * 
 * Sử dụng shared resources từ SharedAiConfig.
 */
@Component
@Slf4j
@RequiredArgsConstructor
public class ProductSearchTools {

    private final EmbeddingStore<TextSegment> productEmbeddingStore;
    private final EmbeddingModel embeddingModel;  // Shared từ SharedAiConfig (@Primary)
    private final ProductRepository productRepository;

    private static final NumberFormat VND_FORMAT = NumberFormat.getInstance(new Locale("vi", "VN"));

    // =========================================
    // SEMANTIC SEARCH TOOL
    // =========================================

    @Tool("""
        Tìm kiếm sản phẩm theo ngữ nghĩa/mô tả.
        Sử dụng khi khách hàng mô tả sản phẩm bằng lời tự nhiên.
        Ví dụ: "giày chạy êm chân", "giày đi chơi thoải mái", "sneaker năng động cho học sinh"
        """)
    public String semanticSearch(
            @P("Mô tả sản phẩm cần tìm bằng ngôn ngữ tự nhiên") String query,
            @P("Số lượng kết quả tối đa (mặc định 5)") Integer maxResults
    ) {
        log.info("[ProductSearchTools] Semantic search: query='{}', maxResults={}", query, maxResults);
        
        if (query == null || query.isBlank()) {
            return "Vui lòng cung cấp mô tả sản phẩm cần tìm.";
        }
        
        int limit = (maxResults != null && maxResults > 0) ? maxResults : 5;
        
        try {
            // 1. Embed the query
            Embedding queryEmbedding = embeddingModel.embed(query).content();
            
            // 2. Search in vector store
            EmbeddingSearchRequest searchRequest = EmbeddingSearchRequest.builder()
                    .queryEmbedding(queryEmbedding)
                    .maxResults(limit)
                    .minScore(0.5) // Minimum similarity threshold
                    .build();
            
            EmbeddingSearchResult<TextSegment> searchResult = productEmbeddingStore.search(searchRequest);
            List<EmbeddingMatch<TextSegment>> matches = searchResult.matches();
            
            if (matches.isEmpty()) {
                return "Không tìm thấy sản phẩm phù hợp với mô tả: \"" + query + "\"\n" +
                       "Gợi ý: Thử mô tả khác hoặc dùng filterProducts với tiêu chí cụ thể.";
            }
            
            // 3. Format results
            StringBuilder result = new StringBuilder();
            result.append("📦 Tìm thấy ").append(matches.size()).append(" sản phẩm phù hợp:\n\n");
            
            int index = 1;
            for (EmbeddingMatch<TextSegment> match : matches) {
                TextSegment segment = match.embedded();
                String productInfo = segment.text();
                double score = match.score();
                
                result.append(index++).append(". ").append(productInfo)
                      .append("\n   📊 Độ phù hợp: ").append(String.format("%.0f%%", score * 100))
                      .append("\n\n");
            }
            
            return result.toString();
            
        } catch (Exception e) {
            log.error("[ProductSearchTools] Semantic search error", e);
            return "Đã xảy ra lỗi khi tìm kiếm. Vui lòng thử lại.";
        }
    }

    // =========================================
    // FILTER PRODUCTS TOOL
    // =========================================

    @Tool("""
        Lọc sản phẩm theo tiêu chí cụ thể.
        Sử dụng khi khách hàng nêu tiêu chí rõ ràng như thương hiệu, giá, danh mục.
        Ví dụ: "Nike dưới 2 triệu", "giày Adidas màu đen", "giày chạy bộ giá từ 1 đến 3 triệu"
        """)
    public String filterProducts(
            @P("Tên thương hiệu (VD: Nike, Adidas, Puma). Để null nếu không lọc theo brand.") String brand,
            @P("Tên danh mục (VD: chạy bộ, bóng rổ, sneaker). Để null nếu không lọc.") String category,
            @P("Giá tối thiểu (VND). VD: 500000 cho 500k. Để null nếu không giới hạn.") BigDecimal minPrice,
            @P("Giá tối đa (VND). VD: 2000000 cho 2 triệu. Để null nếu không giới hạn.") BigDecimal maxPrice,
            @P("Số lượng kết quả tối đa (mặc định 10)") Integer maxResults
    ) {
        log.info("[ProductSearchTools] Filter: brand={}, category={}, minPrice={}, maxPrice={}, maxResults={}",
                brand, category, minPrice, maxPrice, maxResults);
        
        int limit = (maxResults != null && maxResults > 0) ? maxResults : 10;
        
        try {
            // Build dynamic specification
            Specification<Product> spec = buildProductSpecification(brand, category, minPrice, maxPrice);
            
            List<Product> products = productRepository.findAll(spec)
                    .stream()
                    .limit(limit)
                    .toList();
            
            if (products.isEmpty()) {
                StringBuilder noResult = new StringBuilder("Không tìm thấy sản phẩm với tiêu chí:\n");
                if (brand != null) noResult.append("- Thương hiệu: ").append(brand).append("\n");
                if (category != null) noResult.append("- Danh mục: ").append(category).append("\n");
                if (minPrice != null) noResult.append("- Giá từ: ").append(formatPrice(minPrice)).append("\n");
                if (maxPrice != null) noResult.append("- Giá đến: ").append(formatPrice(maxPrice)).append("\n");
                noResult.append("\nGợi ý: Mở rộng tiêu chí tìm kiếm hoặc dùng semanticSearch.");
                return noResult.toString();
            }
            
            // Format results
            StringBuilder result = new StringBuilder();
            result.append("📦 Tìm thấy ").append(products.size()).append(" sản phẩm:\n\n");
            
            int index = 1;
            for (Product product : products) {
                result.append(index++).append(". **").append(product.getName()).append("**\n");
                
                if (product.getBrand() != null) {
                    result.append("   🏷️ Thương hiệu: ").append(product.getBrand().getName()).append("\n");
                }
                if (product.getCategory() != null) {
                    result.append("   📁 Danh mục: ").append(product.getCategory().getName()).append("\n");
                }
                result.append("   💰 Giá: ").append(formatPrice(product.getPrice())).append("\n");
                result.append("   🔗 ID: ").append(product.getProductId()).append("\n\n");
            }
            
            return result.toString();
            
        } catch (Exception e) {
            log.error("[ProductSearchTools] Filter error", e);
            return "Đã xảy ra lỗi khi lọc sản phẩm. Vui lòng thử lại.";
        }
    }

    // =========================================
    // HELPER METHODS
    // =========================================

    private Specification<Product> buildProductSpecification(
            String brand, String category, BigDecimal minPrice, BigDecimal maxPrice
    ) {
        return (root, query, cb) -> {
            List<Predicate> predicates = new ArrayList<>();
            
            // Filter by brand name (case-insensitive contains)
            if (brand != null && !brand.isBlank()) {
                predicates.add(cb.like(
                        cb.lower(root.get("brand").get("name")),
                        "%" + brand.toLowerCase() + "%"
                ));
            }
            
            // Filter by category name (case-insensitive contains)
            if (category != null && !category.isBlank()) {
                predicates.add(cb.like(
                        cb.lower(root.get("category").get("name")),
                        "%" + category.toLowerCase() + "%"
                ));
            }
            
            // Filter by price range
            if (minPrice != null) {
                predicates.add(cb.greaterThanOrEqualTo(root.get("price"), minPrice));
            }
            if (maxPrice != null) {
                predicates.add(cb.lessThanOrEqualTo(root.get("price"), maxPrice));
            }
            
            // Only active products
            predicates.add(cb.equal(root.get("status"), 
                    com.example.online_shoe_store.Entity.enums.ProductStatus.ACTIVE));
            
            return cb.and(predicates.toArray(new Predicate[0]));
        };
    }

    private String formatPrice(BigDecimal price) {
        if (price == null) return "N/A";
        return VND_FORMAT.format(price) + "đ";
    }
}
