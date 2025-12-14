package com.example.online_shoe_store.Service;

import com.example.online_shoe_store.Entity.Product;
import com.example.online_shoe_store.Entity.ProductVariant;
import com.example.online_shoe_store.Repository.ProductRepository;
import com.example.online_shoe_store.dto.response.ProductDetailResponse;
import com.example.online_shoe_store.dto.response.ProductResponse;
import com.example.online_shoe_store.mapper.ProductMapper;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = lombok.AccessLevel.PRIVATE, makeFinal = true)
public class ProductService {

    ProductRepository productRepository;
    ProductMapper productMapper;

    public List<Product> getAllProducts() {
        return productRepository.findAll();
    }

    // ✅ API: /api/new-products
    public List<ProductResponse> getTop20Products() {
        return productRepository.findAll()
                .stream()
                .limit(20)
                .map(p -> ProductResponse.builder()
                        .productId(p.getProductId())
                        .name(p.getName())
                        .price(p.getPrice() != null ? p.getPrice().doubleValue() : 0.0)
                        // ✅ trả về URL web dùng được
                        .imageUrl(toPublicProductImageUrl(p.getImageUrl()))
                        .build()
                )
                .toList();
    }

    /**
     * Chuyển imageUrl từ DB -> URL dùng được trên web.
     * WebConfig đang serve: /images/products/** -> file:.../src/data/images/products/
     *
     * DB của bạn hiện đang lưu kiểu: "src/data/images/products/main_xxx.jpg"
     * => sẽ convert thành: "/images/products/main_xxx.jpg"
     */
    private String toPublicProductImageUrl(String raw) {
        if (raw == null) return null;

        String v = raw.replace("\\", "/").trim();

        // 1) nếu DB lưu kiểu: "src/data/images/products/main_xxx.jpg"
        String prefix = "src/data/images/products/";
        if (v.startsWith(prefix)) {
            return "/images/products/" + v.substring(prefix.length());
        }

        // 2) nếu DB lưu sẵn kiểu: "/images/products/main_xxx.jpg"
        if (v.startsWith("/images/products/")) {
            return v;
        }

        // 3) nếu DB chỉ lưu: "main_xxx.jpg" hoặc "Badminton/main_xxx.jpg"
        if (!v.startsWith("/") && !v.startsWith("http://") && !v.startsWith("https://")) {
            return "/images/products/" + v;
        }

        // 4) nếu DB lưu full URL: "http..."
        return v;
    }

    // ✅ API: /api/products/{id}
    @Transactional(readOnly = true)
    public ProductDetailResponse getDetail(String id) {
        Product p = productRepository.findDetailById(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Product not found"));

        var variants = p.getProductVariants().stream()
                .map(v -> ProductDetailResponse.VariantResponse.builder()
                        .variantId(v.getVariantId())
                        .size(v.getSize())
                        .color(v.getColor())
                        .stock(v.getStock())
                        // ✅ normalize ảnh variant
                        .imageUrl(toPublicProductImageUrl(v.getImageUrl()))
                        .build())
                .toList();

        var colors = p.getProductVariants().stream()
                .map(ProductVariant::getColor)
                .distinct()
                .toList();

        var sizes = p.getProductVariants().stream()
                .map(ProductVariant::getSize)
                .distinct()
                .toList();

        return ProductDetailResponse.builder()
                .productId(p.getProductId())
                .name(p.getName())
                .description(p.getDescription())
                .price(p.getPrice())
                // ✅ normalize ảnh product
                .imageUrl(toPublicProductImageUrl(p.getImageUrl()))
                .brandName(p.getBrand() != null ? p.getBrand().getName() : null)
                .categoryName(p.getCategory() != null ? p.getCategory().getName() : null)
                .colors(colors)
                .sizes(sizes)
                .variants(variants)
                .build();
    }

    // (các hàm cũ của bạn giữ nguyên, nhưng hiện đang return void nên chưa dùng được nhiều)
    public void getProductById(String id) {
        productRepository.findById(id);
    }

    public void getProductsByName(String name) {
        productRepository.findByName(name);
    }
}
