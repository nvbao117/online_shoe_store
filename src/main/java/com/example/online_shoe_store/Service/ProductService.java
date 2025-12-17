package com.example.online_shoe_store.Service;


import com.example.online_shoe_store.Entity.Product;
import com.example.online_shoe_store.Repository.ProductRepository;
import com.example.online_shoe_store.dto.response.BrandResponse;
import com.example.online_shoe_store.dto.response.ProductResponse;
import com.example.online_shoe_store.mapper.BrandMapper;
import com.example.online_shoe_store.mapper.ProductMapper;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;
import com.example.online_shoe_store.dto.response.ProductDetailResponse;
import com.example.online_shoe_store.Entity.ProductVariant;
import org.springframework.http.HttpStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.server.ResponseStatusException;


import java.util.List;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = lombok.AccessLevel.PRIVATE, makeFinal = true)

public class ProductService {
   ProductRepository productRepository;
   ProductMapper productMapper;
   BrandMapper brandMapper;

   public List<Product> getAllProducts() {
        return productRepository.findAll();
   }

   public List<ProductResponse> getTop20Products() {
       return  productMapper.toProductResponsesList(productRepository.findAll().stream().limit(20).toList());
   }
   public void getProductById(String id) {
       productRepository.findById(id);
   }

   public void getProductsByName(String name) {
       productRepository.findByName(name);
   }

   public List<ProductResponse> getProductsByCategory(String categoryId) {
       return productMapper.toProductResponsesList(productRepository.findByCategoryCategoryId(categoryId).stream().toList());
   }

   public List<ProductResponse> searchProductsByName(String name) {
       return productMapper.toProductResponsesList(productRepository.findByNameContainingIgnoreCase(name).stream().toList());
   }

//    public List<BrandResponse> getBrandByCategoryId(String categoryId) {
//        return brandMapper.toBrandResponse(productRepository.findByCategoryCategoryId(categoryId)
//                .stream()
//                .findFirst()
//                .map(Product::getBrand)
//                .orElse(null));
//    }

    private String toPublicProductImageUrl(String raw) {
        if (raw == null) return null;

        String v = raw.replace("\\", "/").trim();

        // ✅ DB có thể lưu "/src/data/images/products/..."
        String p1 = "/src/data/images/products/";
        if (v.startsWith(p1)) {
            return "/images/products/" + v.substring(p1.length());
        }

        // ✅ DB có thể lưu "src/data/images/products/..."
        String p2 = "src/data/images/products/";
        if (v.startsWith(p2)) {
            return "/images/products/" + v.substring(p2.length());
        }

        // ✅ nếu DB lưu sẵn "/images/products/..."
        if (v.startsWith("/images/products/")) {
            return v;
        }

        // ✅ nếu chỉ lưu "main_xxx.jpg" hoặc "Badminton/main_xxx.jpg"
        if (!v.startsWith("/") && !v.startsWith("http://") && !v.startsWith("https://")) {
            return "/images/products/" + v;
        }

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
}
