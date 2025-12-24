package com.example.online_shoe_store.Controller.admin;

import com.example.online_shoe_store.Entity.*;
import com.example.online_shoe_store.Entity.enums.ProductStatus;
import com.example.online_shoe_store.Repository.*;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.math.BigDecimal;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.util.*;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/admin/products")
@RequiredArgsConstructor
public class AdminProductApiController {

    private final ProductRepository productRepository;
    private final ProductVariantRepository variantRepository;
    private final CategoryRepository categoryRepository;
    private final BrandRepository brandRepository;

    private static final String PRODUCT_IMAGES_DIR = "data/images/products";

    // ===================== PRODUCT ENDPOINTS =====================

    @GetMapping
    public List<ProductSummary> listProducts(
            @RequestParam(value = "search", required = false) String search,
            @RequestParam(value = "categoryId", required = false) String categoryId,
            @RequestParam(value = "brandId", required = false) String brandId,
            @RequestParam(value = "status", required = false) String status,
            @RequestParam(value = "sort", required = false, defaultValue = "createdAt") String sort,
            @RequestParam(value = "dir", required = false, defaultValue = "desc") String dir) {

        return productRepository.findAll().stream()
                .map(ProductSummary::from)
                .filter(p -> {
                    if (search == null || search.isBlank())
                        return true;
                    String kw = search.toLowerCase();
                    return (p.getName() != null && p.getName().toLowerCase().contains(kw));
                })
                .filter(p -> {
                    if (categoryId == null || categoryId.isBlank())
                        return true;
                    return Objects.equals(categoryId, p.getCategoryId());
                })
                .filter(p -> {
                    if (brandId == null || brandId.isBlank())
                        return true;
                    return Objects.equals(brandId, p.getBrandId());
                })
                .filter(p -> {
                    if (status == null || status.isBlank())
                        return true;
                    return status.equalsIgnoreCase(p.getStatus());
                })
                .sorted((a, b) -> {
                    int multiplier = "asc".equalsIgnoreCase(dir) ? 1 : -1;
                    switch (sort) {
                        case "name":
                            return multiplier * nullSafeCompare(a.getName(), b.getName());
                        case "price":
                            if (a.getPrice() == null && b.getPrice() == null)
                                return 0;
                            if (a.getPrice() == null)
                                return 1;
                            if (b.getPrice() == null)
                                return -1;
                            return multiplier * a.getPrice().compareTo(b.getPrice());
                        default: // createdAt
                            if (a.getCreatedAt() == null && b.getCreatedAt() == null)
                                return 0;
                            if (a.getCreatedAt() == null)
                                return 1;
                            if (b.getCreatedAt() == null)
                                return -1;
                            return multiplier * a.getCreatedAt().compareTo(b.getCreatedAt());
                    }
                })
                .collect(Collectors.toList());
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> getProduct(@PathVariable("id") String productId) {
        return productRepository.findDetailById(productId)
                .map(ProductDetail::from)
                .map(ResponseEntity::ok)
                .orElseGet(() -> ResponseEntity.notFound().build());
    }

    @PostMapping
    public ResponseEntity<?> createProduct(@RequestBody ProductFormData form) {
        // Validate required image
        if (form.getImageUrl() == null || form.getImageUrl().isBlank()) {
            return ResponseEntity.badRequest().body(Map.of("error", "Vui lòng tải ảnh sản phẩm lên"));
        }

        Product product = new Product();
        product.setProductId(UUID.randomUUID().toString());
        product.setName(form.getName());
        product.setDescription(form.getDescription());
        product.setPrice(form.getPrice());
        product.setImageUrl(form.getImageUrl());
        product.setStatus(form.getStatus() != null ? ProductStatus.valueOf(form.getStatus()) : ProductStatus.ACTIVE);
        product.setSoldCount(0);

        if (form.getCategoryId() != null && !form.getCategoryId().isBlank()) {
            categoryRepository.findById(form.getCategoryId()).ifPresent(product::setCategory);
        }
        if (form.getBrandId() != null && !form.getBrandId().isBlank()) {
            brandRepository.findById(form.getBrandId()).ifPresent(product::setBrand);
        }

        Product saved = productRepository.save(product);
        return ResponseEntity.ok(ProductSummary.from(saved));
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> updateProduct(@PathVariable("id") String productId, @RequestBody ProductFormData form) {
        // Validate required image
        if (form.getImageUrl() == null || form.getImageUrl().isBlank()) {
            return ResponseEntity.badRequest().body(Map.of("error", "Vui lòng tải ảnh sản phẩm lên"));
        }

        return productRepository.findById(productId)
                .map(product -> {
                    product.setName(form.getName());
                    product.setDescription(form.getDescription());
                    product.setPrice(form.getPrice());
                    product.setImageUrl(form.getImageUrl());
                    if (form.getStatus() != null) {
                        product.setStatus(ProductStatus.valueOf(form.getStatus()));
                    }

                    if (form.getCategoryId() != null && !form.getCategoryId().isBlank()) {
                        categoryRepository.findById(form.getCategoryId()).ifPresent(product::setCategory);
                    } else {
                        product.setCategory(null);
                    }
                    if (form.getBrandId() != null && !form.getBrandId().isBlank()) {
                        brandRepository.findById(form.getBrandId()).ifPresent(product::setBrand);
                    } else {
                        product.setBrand(null);
                    }

                    Product saved = productRepository.save(product);
                    return ResponseEntity.ok(ProductSummary.from(saved));
                })
                .orElseGet(() -> ResponseEntity.notFound().build());
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteProduct(@PathVariable("id") String productId) {
        return productRepository.findById(productId)
                .map(product -> {
                    productRepository.delete(product);
                    return ResponseEntity.ok(Map.of("message", "Đã xóa sản phẩm", "productId", productId));
                })
                .orElseGet(() -> ResponseEntity.notFound().build());
    }

    // ===================== VARIANT ENDPOINTS =====================

    @GetMapping("/{id}/variants")
    public ResponseEntity<?> getVariants(@PathVariable("id") String productId) {
        List<ProductVariant> variants = variantRepository.findByProductProductId(productId);
        List<VariantSummary> result = variants.stream().map(VariantSummary::from).collect(Collectors.toList());
        return ResponseEntity.ok(result);
    }

    @PostMapping("/{id}/variants")
    public ResponseEntity<?> createVariant(@PathVariable("id") String productId, @RequestBody VariantFormData form) {
        return productRepository.findById(productId)
                .map(product -> {
                    ProductVariant variant = new ProductVariant();
                    variant.setVariantId(UUID.randomUUID().toString());
                    variant.setSize(form.getSize());
                    variant.setColor(form.getColor());
                    variant.setStock(form.getStock() != null ? form.getStock() : 0);
                    variant.setImageUrl(form.getImageUrl());
                    variant.setProduct(product);

                    ProductVariant saved = variantRepository.save(variant);
                    return ResponseEntity.ok(VariantSummary.from(saved));
                })
                .orElseGet(() -> ResponseEntity.notFound().build());
    }

    @PutMapping("/variants/{variantId}")
    public ResponseEntity<?> updateVariant(@PathVariable("variantId") String variantId,
            @RequestBody VariantFormData form) {
        return variantRepository.findById(variantId)
                .map(variant -> {
                    variant.setSize(form.getSize());
                    variant.setColor(form.getColor());
                    variant.setStock(form.getStock() != null ? form.getStock() : variant.getStock());
                    variant.setImageUrl(form.getImageUrl());

                    ProductVariant saved = variantRepository.save(variant);
                    return ResponseEntity.ok(VariantSummary.from(saved));
                })
                .orElseGet(() -> ResponseEntity.notFound().build());
    }

    @DeleteMapping("/variants/{variantId}")
    public ResponseEntity<?> deleteVariant(@PathVariable("variantId") String variantId) {
        return variantRepository.findById(variantId)
                .map(variant -> {
                    variantRepository.delete(variant);
                    return ResponseEntity.ok(Map.of("message", "Đã xóa variant", "variantId", variantId));
                })
                .orElseGet(() -> ResponseEntity.notFound().build());
    }

    // ===================== OPTIONS ENDPOINTS =====================

    @GetMapping("/options/categories")
    public List<OptionItem> getCategories() {
        return categoryRepository.findAll().stream()
                .filter(c -> Boolean.TRUE.equals(c.getIsActive()))
                .map(c -> new OptionItem(c.getCategoryId(), c.getName()))
                .collect(Collectors.toList());
    }

    @GetMapping("/options/brands")
    public List<OptionItem> getBrands() {
        return brandRepository.findAll().stream()
                .filter(b -> Boolean.TRUE.equals(b.getIsActive()))
                .map(b -> new OptionItem(b.getBrandId(), b.getName()))
                .collect(Collectors.toList());
    }

    // ===================== IMAGE UPLOAD =====================

    @PostMapping("/upload-image")
    public ResponseEntity<?> uploadProductImage(@RequestParam("file") MultipartFile file) {
        if (file == null || file.isEmpty()) {
            return ResponseEntity.badRequest().body(Map.of("error", "Vui lòng chọn file ảnh"));
        }

        String contentType = file.getContentType();
        if (contentType == null || !contentType.startsWith("image/")) {
            return ResponseEntity.badRequest().body(Map.of("error", "Chỉ chấp nhận file ảnh"));
        }

        try {
            Path uploadDir = Paths.get(PRODUCT_IMAGES_DIR);
            if (!Files.exists(uploadDir)) {
                Files.createDirectories(uploadDir);
            }

            String originalFilename = file.getOriginalFilename();
            String extension = originalFilename != null && originalFilename.contains(".")
                    ? originalFilename.substring(originalFilename.lastIndexOf("."))
                    : ".jpg";
            String newFilename = UUID.randomUUID().toString() + extension;

            Path filePath = uploadDir.resolve(newFilename);
            Files.copy(file.getInputStream(), filePath);

            String imageUrl = "/images/products/" + newFilename;
            return ResponseEntity.ok(Map.of("imageUrl", imageUrl, "filename", newFilename));

        } catch (IOException e) {
            return ResponseEntity.internalServerError().body(Map.of("error", "Lỗi upload ảnh: " + e.getMessage()));
        }
    }

    // ===================== DTOs =====================

    @Data
    public static class ProductSummary {
        private String productId;
        private String name;
        private String description;
        private BigDecimal price;
        private String imageUrl;
        private String status;
        private String categoryId;
        private String categoryName;
        private String brandId;
        private String brandName;
        private Integer variantCount;
        private Integer soldCount;
        private LocalDateTime createdAt;

        public static ProductSummary from(Product p) {
            ProductSummary dto = new ProductSummary();
            dto.setProductId(p.getProductId());
            dto.setName(p.getName());
            dto.setDescription(p.getDescription());
            dto.setPrice(p.getPrice());
            dto.setImageUrl(p.getImageUrl());
            dto.setStatus(p.getStatus() != null ? p.getStatus().name() : null);
            dto.setSoldCount(p.getSoldCount());
            dto.setCreatedAt(p.getCreatedAt());

            if (p.getCategory() != null) {
                dto.setCategoryId(p.getCategory().getCategoryId());
                dto.setCategoryName(p.getCategory().getName());
            }
            if (p.getBrand() != null) {
                dto.setBrandId(p.getBrand().getBrandId());
                dto.setBrandName(p.getBrand().getName());
            }

            dto.setVariantCount(p.getProductVariants() != null ? p.getProductVariants().size() : 0);
            return dto;
        }
    }

    @Data
    public static class ProductDetail {
        private String productId;
        private String name;
        private String description;
        private BigDecimal price;
        private String imageUrl;
        private String status;
        private String categoryId;
        private String categoryName;
        private String brandId;
        private String brandName;
        private Integer soldCount;
        private LocalDateTime createdAt;
        private List<VariantSummary> variants;

        public static ProductDetail from(Product p) {
            ProductDetail dto = new ProductDetail();
            dto.setProductId(p.getProductId());
            dto.setName(p.getName());
            dto.setDescription(p.getDescription());
            dto.setPrice(p.getPrice());
            dto.setImageUrl(p.getImageUrl());
            dto.setStatus(p.getStatus() != null ? p.getStatus().name() : null);
            dto.setSoldCount(p.getSoldCount());
            dto.setCreatedAt(p.getCreatedAt());

            if (p.getCategory() != null) {
                dto.setCategoryId(p.getCategory().getCategoryId());
                dto.setCategoryName(p.getCategory().getName());
            }
            if (p.getBrand() != null) {
                dto.setBrandId(p.getBrand().getBrandId());
                dto.setBrandName(p.getBrand().getName());
            }

            dto.setVariants(p.getProductVariants() != null
                    ? p.getProductVariants().stream().map(VariantSummary::from).collect(Collectors.toList())
                    : new ArrayList<>());
            return dto;
        }
    }

    @Data
    public static class VariantSummary {
        private String variantId;
        private String productId;
        private String size;
        private String color;
        private Integer stock;
        private String imageUrl;

        public static VariantSummary from(ProductVariant v) {
            VariantSummary dto = new VariantSummary();
            dto.setVariantId(v.getVariantId());
            dto.setProductId(v.getProduct() != null ? v.getProduct().getProductId() : null);
            dto.setSize(v.getSize());
            dto.setColor(v.getColor());
            dto.setStock(v.getStock());
            dto.setImageUrl(v.getImageUrl());
            return dto;
        }
    }

    @Data
    public static class ProductFormData {
        private String name;
        private String description;
        private BigDecimal price;
        private String imageUrl;
        private String categoryId;
        private String brandId;
        private String status;
    }

    @Data
    public static class VariantFormData {
        private String size;
        private String color;
        private Integer stock;
        private String imageUrl;
    }

    @Data
    public static class OptionItem {
        private String value;
        private String label;

        public OptionItem(String value, String label) {
            this.value = value;
            this.label = label;
        }
    }

    private int nullSafeCompare(String a, String b) {
        if (a == null && b == null)
            return 0;
        if (a == null)
            return 1;
        if (b == null)
            return -1;
        return a.compareToIgnoreCase(b);
    }
}
