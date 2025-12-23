package com.example.online_shoe_store.Service.ai.tool;

import com.example.online_shoe_store.Entity.Product;
import com.example.online_shoe_store.Repository.ProductRepository;
import com.example.online_shoe_store.Service.ai.rag.ProductEmbeddingService;
import com.example.online_shoe_store.Service.ai.rag.ProductRAGService;
import com.example.online_shoe_store.dto.response.ProductRAGResponse;
import dev.langchain4j.agent.tool.P;
import dev.langchain4j.agent.tool.Tool;
import jakarta.persistence.criteria.Predicate;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Component;

import java.math.BigDecimal;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Optional;

@Component
@Slf4j
@RequiredArgsConstructor
public class ProductSearchTools {

    private final ProductRAGService productRAGService;
    private final ProductRepository productRepository;

    private static final NumberFormat VND_FORMAT = NumberFormat.getInstance(new Locale("vi", "VN"));

    private String toPublicProductImageUrl(String raw) {
        if (raw == null) return null;

        String v = raw.replace("\\", "/").trim();

        String p1 = "/src/data/images/products/";
        if (v.startsWith(p1)) {
            return "/images/products/" + v.substring(p1.length());
        }

        String p2 = "src/data/images/products/";
        if (v.startsWith(p2)) {
            return "/images/products/" + v.substring(p2.length());
        }

        if (v.startsWith("/images/products/")) {
            return v;
        }

        if (!v.startsWith("/") && !v.startsWith("http://") && !v.startsWith("https://")) {
            return "/images/products/" + v;
        }

        return v;
    }

    private String productDetailUrl(String productId) {
        if (productId == null || productId.isBlank()) return null;
        return "/product-detail/" + productId;
    }

    // =========================================
    // GET PRODUCT DETAIL TOOL
    // =========================================

    @Tool(name = "getProductDetail", value = """
        Lấy thông tin chi tiết của 1 sản phẩm theo tên hoặc ID.
        Sử dụng khi khách hỏi "xem chi tiết", "thông tin sản phẩm này", hoặc nhắc đến tên sản phẩm cụ thể.
        """)
    public String getProductDetail(
            @P("Tên sản phẩm hoặc ID sản phẩm. Có thể tìm gần đúng theo tên.") String nameOrId
    ) {
        log.info("[ProductSearchTools] getProductDetail: {}", nameOrId);
        
        if (nameOrId == null || nameOrId.isBlank()) {
            return "Vui lòng cho biết tên hoặc ID sản phẩm bạn muốn xem.";
        }

        try {
            // Try by ID first
            Optional<Product> byId = productRepository.findDetailById(nameOrId);
            if (byId.isPresent()) {
                return formatProductDetail(byId.get());
            }

            // Search by name (contains, case-insensitive)
            List<Product> byName = productRepository.findByNameContainingIgnoreCase(nameOrId);
            if (!byName.isEmpty()) {
                if (byName.size() == 1) {
                    return formatProductDetail(byName.get(0));
                } else {
                    // Multiple matches - list them
                    StringBuilder sb = new StringBuilder();
                    sb.append("Tìm thấy ").append(byName.size()).append(" sản phẩm với tên '").append(nameOrId).append("':\n\n");
                    int i = 1;
                    for (Product p : byName.stream().limit(5).toList()) {
                        sb.append(i++).append(". **").append(p.getName()).append("**");
                        if (p.getBrand() != null) sb.append(" | ").append(p.getBrand().getName());
                        sb.append("\n   💰 ").append(formatPrice(p.getPrice())).append("\n");
                    }
                    sb.append("\nBạn muốn xem chi tiết sản phẩm nào?");
                    log.info(sb.toString());
                    return sb.toString();
                }
            }

            return "Không tìm thấy sản phẩm với tên/ID: " + nameOrId;
            
        } catch (Exception e) {
            log.error("[ProductSearchTools] getProductDetail error", e);
            return "Đã xảy ra lỗi khi lấy thông tin sản phẩm.";
        }
    }

    private String formatProductDetail(Product product) {
        StringBuilder sb = new StringBuilder();
        sb.append("**").append(product.getName()).append("**\n\n");
        
        if (product.getBrand() != null) {
            sb.append("Thương hiệu: ").append(product.getBrand().getName()).append("\n");
        }
        if (product.getCategory() != null) {
            sb.append("Danh mục: ").append(product.getCategory().getName()).append("\n");
        }
        sb.append("Giá: ").append(formatPrice(product.getPrice())).append("\n");

        String img = toPublicProductImageUrl(product.getImageUrl());
        if (img != null && !img.isBlank()) {
            sb.append("Ảnh: ").append(img).append("\n");
        }
        
        if (product.getDescription() != null && !product.getDescription().isBlank()) {
            String desc = product.getDescription();
            if (desc.length() > 200) desc = desc.substring(0, 200) + "...";
            sb.append("\nMô tả: ").append(desc).append("\n");
        }
        
        sb.append("\nXem chi tiết: ").append(productDetailUrl(product.getProductId()));
        
        return sb.toString();
    }

    // =========================================
    // SEMANTIC SEARCH TOOL (via RAG / Vector Store)
    // =========================================

    @Tool(name = "semanticSearch", value = """
        Tìm kiếm sản phẩm theo ngữ nghĩa/mô tả.
        Sử dụng khi khách hàng mô tả sản phẩm bằng lời tự nhiên.
        Ví dụ: "giày chạy êm chân", "giày đi chơi thoải mái", "sneaker năng động cho học sinh"
        """)
    public String semanticSearch(
            @P("Mô tả sản phẩm cần tìm bằng ngôn ngữ tự nhiên") String query,
            @P("Số lượng kết quả tối đa (mặc định 5)") Integer maxResults
    ) {
        log.info("[ProductSearchTools] Semantic search via RAG: query='{}', maxResults={}", query, maxResults);
        
        if (query == null || query.isBlank()) {
            return "Vui lòng cung cấp mô tả sản phẩm cần tìm.";
        }
        
        int limit = (maxResults != null && maxResults > 0) ? maxResults : 5;
        
        try {
            // Search trong vector store (RAG)
            List<ProductRAGResponse> ragResults = productRAGService.searchProducts(query, limit, 0.7);

            if (ragResults.isEmpty()) {
                return "Không tìm thấy sản phẩm phù hợp với mô tả: \"" + query + "\"\n" +
                       "Gợi ý: Thử mô tả khác hoặc dùng filterProducts với tiêu chí cụ thể.";
            }
            
            log.info("[ProductSearchTools] RAG returned {} results", ragResults.size());
            
            // Format results
            StringBuilder result = new StringBuilder();
            result.append("Tìm thấy ").append(ragResults.size()).append(" sản phẩm phù hợp:\n\n");
            
            int index = 1;
            for (ProductRAGResponse p : ragResults) {
                String name = p.getName() != null ? p.getName() : "(Không có tên)";
                result.append(index++).append(". **").append(name).append("**");

                if (p.getBrandName() != null && !p.getBrandName().isBlank()) {
                    result.append(" | ").append(p.getBrandName());
                }
                result.append("\n");

                String priceText = p.getPriceFormatted();
                if (priceText == null || priceText.isBlank()) {
                    if (p.getPrice() != null) priceText = formatPrice(p.getPrice());
                }
                if (priceText != null) {
                    result.append("Giá: ").append(priceText);
                    if (p.getCategoryName() != null && !p.getCategoryName().isBlank()) {
                        result.append(" | ").append(p.getCategoryName());
                    }
                    result.append("\n");
                }

                if (p.getProductDetailUrl() != null && !p.getProductDetailUrl().isBlank()) {
                    result.append("Chi tiết: ").append(p.getProductDetailUrl()).append("\n");
                } else if (p.getProductId() != null && !p.getProductId().isBlank()) {
                    result.append("Chi tiết: ").append(productDetailUrl(p.getProductId())).append("\n");
                }

                String img = toPublicProductImageUrl(p.getImageUrl());
                if (img != null && !img.isBlank()) {
                    result.append("Ảnh: ").append(img).append("\n");
                }

                result.append("\n");
            }
            log.info(result.toString().trim());
            return result.toString().trim();
            
        } catch (Exception e) {
            log.error("[ProductSearchTools] Semantic search error", e);
            return "Đã xảy ra lỗi khi tìm kiếm. Vui lòng thử lại.";
        }
    }

    // =========================================
    // FILTER PRODUCTS TOOL
    // =========================================

    @Tool(name = "filterProducts", value = """
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
                    .map(p -> productRepository.findDetailById(p.getProductId()).orElse(p))
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
            result.append("Tìm thấy ").append(products.size()).append(" sản phẩm:\n\n");
            
            int index = 1;
            for (Product product : products) {
                result.append(index++).append(". **").append(product.getName()).append("**");
                
                if (product.getBrand() != null) {
                    result.append(" | ").append(product.getBrand().getName());
                }
                result.append("\n");
                result.append("   💰 ").append(formatPrice(product.getPrice()));
                if (product.getCategory() != null) {
                    result.append(" | ").append(product.getCategory().getName());
                }
                result.append("\n");
                result.append("   Chi tiết: ").append(productDetailUrl(product.getProductId())).append("\n");

                String img = toPublicProductImageUrl(product.getImageUrl());
                if (img != null && !img.isBlank()) {
                    result.append("   Ảnh: ").append(img).append("\n");
                }
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
