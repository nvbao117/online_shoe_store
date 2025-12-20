package com.example.online_shoe_store.Controller.api;

import com.example.online_shoe_store.Service.ai.clip.ClipSearchClient;
import com.example.online_shoe_store.dto.response.ImageSearchResult;
import com.example.online_shoe_store.Repository.ProductRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;

/**
 * REST API for semantic image search
 */
@RestController
@RequestMapping("/api/search")
@RequiredArgsConstructor
@Slf4j
public class ImageSearchController {

    private final ClipSearchClient clipSearchClient;
    private final ProductRepository productRepository;

    /**
     * Search products by image upload
     */
    @PostMapping("/image")
    public ResponseEntity<?> searchByImage(
            @RequestParam("file") MultipartFile file,
            @RequestParam(defaultValue = "12") int topK) {
        
        log.info("🔍 Image search - file: {}, size: {} bytes", 
            file.getOriginalFilename(), file.getSize());

        if (!clipSearchClient.isHealthy()) {
            return ResponseEntity.status(HttpStatus.SERVICE_UNAVAILABLE)
                .body(Map.of("error", "CLIP service is not available"));
        }

        List<ImageSearchResult> results = clipSearchClient.searchByImage(file, topK);
        enrichResults(results);

        return ResponseEntity.ok(Map.of(
            "count", results.size(),
            "results", results
        ));
    }

    /**
     * Search products by text description
     */
    @PostMapping("/text")
    public ResponseEntity<?> searchByText(@RequestBody Map<String, Object> request) {
        String query = (String) request.get("query");
        int topK = (int) request.getOrDefault("topK", 12);

        log.info("🔍 Text search - query: '{}'", query);

        if (!clipSearchClient.isHealthy()) {
            return ResponseEntity.status(HttpStatus.SERVICE_UNAVAILABLE)
                .body(Map.of("error", "CLIP service is not available"));
        }

        List<ImageSearchResult> results = clipSearchClient.searchByText(query, topK);
        enrichResults(results);

        return ResponseEntity.ok(Map.of(
            "query", query,
            "count", results.size(),
            "results", results
        ));
    }

    /**
     * Check CLIP service health
     */
    @GetMapping("/health")
    public ResponseEntity<?> healthCheck() {
        boolean healthy = clipSearchClient.isHealthy();
        return ResponseEntity.ok(Map.of(
            "clip_service", healthy ? "available" : "unavailable"
        ));
    }

    /**
     * Enrich results with product info from database
     */
    private void enrichResults(List<ImageSearchResult> results) {
        for (ImageSearchResult result : results) {
            productRepository.findById(result.getProductId()).ifPresent(product -> {
                result.setProductName(product.getName());
                result.setPrice(product.getPrice() != null ? product.getPrice().toString() : "0");
                result.setBrandName(product.getBrand() != null ? product.getBrand().getName() : null);
                result.setCategoryName(product.getCategory() != null ? product.getCategory().getName() : null);
                
                // Normalize image URL if needed
                if (result.getImageUrl() == null || result.getImageUrl().isBlank()) {
                    result.setImageUrl(normalizeImageUrl(product.getImageUrl()));
                }
            });
        }
    }

    private String normalizeImageUrl(String raw) {
        if (raw == null) return "";
        String v = raw.replace("\\", "/").trim();
        
        if (v.startsWith("/src/data/images/products/")) {
            return "/images/products/" + v.substring("/src/data/images/products/".length());
        }
        if (v.startsWith("src/data/images/products/")) {
            return "/images/products/" + v.substring("src/data/images/products/".length());
        }
        if (!v.startsWith("/") && !v.startsWith("http")) {
            return "/images/products/" + v;
        }
        return v;
    }
}
