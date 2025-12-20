package com.example.online_shoe_store.Service.ai.clip;

import com.example.online_shoe_store.dto.response.ImageSearchResult;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.*;

/**
 * HTTP Client to call Python CLIP microservice
 */
@Service
@Slf4j
public class ClipSearchClient {

    @Value("${clip.service.url:http://localhost:8001}")
    private String clipServiceUrl;

    private final RestTemplate restTemplate;

    public ClipSearchClient() {
        this.restTemplate = new RestTemplate();
    }

    /**
     * Search products by image upload
     */
    public List<ImageSearchResult> searchByImage(MultipartFile file, int topK) {
        try {
            String url = clipServiceUrl + "/api/search/image?top_k=" + topK;
            
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.MULTIPART_FORM_DATA);

            MultiValueMap<String, Object> body = new LinkedMultiValueMap<>();
            body.add("file", new ByteArrayResource(file.getBytes()) {
                @Override
                public String getFilename() {
                    return file.getOriginalFilename();
                }
            });

            HttpEntity<MultiValueMap<String, Object>> requestEntity = new HttpEntity<>(body, headers);

            ResponseEntity<Map> response = restTemplate.exchange(
                    url, HttpMethod.POST, requestEntity, Map.class
            );

            return parseResults(response.getBody());

        } catch (IOException e) {
            log.error("Failed to read file: {}", e.getMessage());
            return Collections.emptyList();
        } catch (Exception e) {
            log.error("CLIP service error: {}", e.getMessage());
            return Collections.emptyList();
        }
    }

    /**
     * Search products by text description
     */
    public List<ImageSearchResult> searchByText(String query, int topK) {
        try {
            String url = clipServiceUrl + "/api/search/text";

            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);

            Map<String, Object> requestBody = new HashMap<>();
            requestBody.put("query", query);
            requestBody.put("top_k", topK);

            HttpEntity<Map<String, Object>> requestEntity = new HttpEntity<>(requestBody, headers);

            ResponseEntity<Map> response = restTemplate.exchange(
                    url, HttpMethod.POST, requestEntity, Map.class
            );

            return parseResults(response.getBody());

        } catch (Exception e) {
            log.error("CLIP service error: {}", e.getMessage());
            return Collections.emptyList();
        }
    }

    /**
     * Check if CLIP service is healthy
     */
    public boolean isHealthy() {
        try {
            String url = clipServiceUrl + "/health";
            ResponseEntity<Map> response = restTemplate.getForEntity(url, Map.class);
            return response.getStatusCode() == HttpStatus.OK;
        } catch (Exception e) {
            log.warn("CLIP service not available: {}", e.getMessage());
            return false;
        }
    }

    @SuppressWarnings("unchecked")
    private List<ImageSearchResult> parseResults(Map responseBody) {
        List<ImageSearchResult> results = new ArrayList<>();
        
        if (responseBody == null || !responseBody.containsKey("results")) {
            return results;
        }

        List<Map<String, Object>> resultsList = (List<Map<String, Object>>) responseBody.get("results");
        
        for (Map<String, Object> item : resultsList) {
            results.add(ImageSearchResult.builder()
                    .productId((String) item.get("product_id"))
                    .similarity(((Number) item.get("similarity")).doubleValue())
                    .imageUrl((String) item.get("image_url"))
                    .build());
        }

        return results;
    }
}
