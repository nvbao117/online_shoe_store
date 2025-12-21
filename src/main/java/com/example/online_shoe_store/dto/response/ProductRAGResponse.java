package com.example.online_shoe_store.dto.response;

import com.example.online_shoe_store.Entity.Product;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.text.NumberFormat;
import java.util.Locale;

/**
 * Response DTO cho RAG search sản phẩm
 * Chứa đầy đủ metadata để hiển thị cho người dùng
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ProductRAGResponse {
    
    private String productId;
    private String name;
    private String description;
    private BigDecimal price;
    private String priceFormatted;
    private String imageUrl;
    private String brandName;
    private String brandId;
    private String categoryName;
    private String categoryId;
    private String status;
    private Double score;  // Similarity score từ vector search
    private String productDetailUrl;

    private static final NumberFormat VND_FORMAT = NumberFormat.getInstance(new Locale("vi", "VN"));

    /**
     * Tạo response từ Product entity
     */
    public static ProductRAGResponse fromEntity(Product product, Double score) {
        if (product == null) return null;

        String imageUrl = normalizeImageUrl(product.getImageUrl());
        String priceFormatted = formatPrice(product.getPrice());

        ProductRAGResponseBuilder builder = ProductRAGResponse.builder()
                .productId(product.getProductId())
                .name(product.getName())
                .description(truncateDescription(product.getDescription()))
                .price(product.getPrice())
                .priceFormatted(priceFormatted)
                .imageUrl(imageUrl)
                .status(product.getStatus() != null ? product.getStatus().name() : "ACTIVE")
                .score(score)
                .productDetailUrl("/product-detail/" + product.getProductId());

        if (product.getBrand() != null) {
            builder.brandName(product.getBrand().getName())
                   .brandId(product.getBrand().getBrandId());
        }

        if (product.getCategory() != null) {
            builder.categoryName(product.getCategory().getName())
                   .categoryId(product.getCategory().getCategoryId());
        }

        return builder.build();
    }

    private static String normalizeImageUrl(String raw) {
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

    private static String formatPrice(BigDecimal price) {
        if (price == null) return "Liên hệ";
        return VND_FORMAT.format(price) + "đ";
    }

    private static String truncateDescription(String description) {
        if (description == null || description.isBlank()) return null;
        String cleaned = description.replaceAll("[\\r\\n\\t]+", " ")
                                    .replaceAll("\\s+", " ")
                                    .trim();
        if (cleaned.length() > 200) {
            return cleaned.substring(0, 200) + "...";
        }
        return cleaned;
    }
}
