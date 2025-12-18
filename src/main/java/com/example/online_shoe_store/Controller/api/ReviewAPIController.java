package com.example.online_shoe_store.Controller.api;

import com.example.online_shoe_store.Entity.User;
import com.example.online_shoe_store.Repository.UserRepository;
import com.example.online_shoe_store.Service.ReviewService;
import com.example.online_shoe_store.dto.response.PendingReviewResponse;
import com.example.online_shoe_store.dto.response.ReviewResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/reviews")
@RequiredArgsConstructor
@Slf4j
public class ReviewAPIController {

    private final ReviewService reviewService;
    private final UserRepository userRepository;

    /**
     * Lấy danh sách đánh giá của user đã đăng nhập
     */
    @GetMapping("/my-reviews")
    public ResponseEntity<List<ReviewResponse>> getMyReviews() {
        User user = getCurrentUser();
        if (user == null) {
            return ResponseEntity.status(401).build();
        }

        List<ReviewResponse> reviews = reviewService.getMyReviews(user);
        return ResponseEntity.ok(reviews);
    }

    /**
     * Lấy danh sách sản phẩm chờ đánh giá
     */
    @GetMapping("/pending")
    public ResponseEntity<List<PendingReviewResponse>> getPendingReviews() {
        User user = getCurrentUser();
        if (user == null) {
            return ResponseEntity.status(401).build();
        }

        List<PendingReviewResponse> pendingItems = reviewService.getPendingReviewItems(user);
        return ResponseEntity.ok(pendingItems);
    }

    /**
     * Gửi đánh giá mới
     */
    @PostMapping(consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<?> createReview(
            @RequestParam("variantId") String variantId,
            @RequestParam("rating") Integer rating,
            @RequestParam(value = "comment", required = false) String comment,
            @RequestParam(value = "images", required = false) List<MultipartFile> images) {

        User user = getCurrentUser();
        if (user == null) {
            return ResponseEntity.status(401)
                    .body(Map.of("success", false, "message", "Vui lòng đăng nhập"));
        }

        try {
            ReviewResponse response = reviewService.createReview(user, variantId, rating, comment, images);
            return ResponseEntity.ok(Map.of(
                    "success", true,
                    "message", "Đánh giá thành công!",
                    "data", response));
        } catch (Exception e) {
            log.error("Error creating review: {}", e.getMessage());
            return ResponseEntity.badRequest()
                    .body(Map.of("success", false, "message", e.getMessage()));
        }
    }

    private User getCurrentUser() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null && auth.isAuthenticated() && !"anonymousUser".equals(auth.getPrincipal())) {
            String username = auth.getName();
            return userRepository.findByUsername(username).orElse(null);
        }
        return null;
    }
}
