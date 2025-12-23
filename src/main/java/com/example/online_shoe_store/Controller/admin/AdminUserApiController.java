package com.example.online_shoe_store.Controller.admin;

import com.example.online_shoe_store.Entity.Order;
import com.example.online_shoe_store.Entity.Payment;
import com.example.online_shoe_store.Entity.Review;
import com.example.online_shoe_store.Entity.User;
import com.example.online_shoe_store.Entity.enums.Role;
import com.example.online_shoe_store.Repository.OrderRepository;
import com.example.online_shoe_store.Repository.ReviewRepository;
import com.example.online_shoe_store.Repository.UserRepository;
import com.example.online_shoe_store.dto.response.ReviewResponse;
import com.example.online_shoe_store.mapper.ReviewMapper;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.math.RoundingMode;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@RestController
@RequestMapping("/api/admin/users")
@RequiredArgsConstructor
public class AdminUserApiController {

    private final UserRepository userRepository;
    private final OrderRepository orderRepository;
    private final ReviewRepository reviewRepository;
    private final ReviewMapper reviewMapper;

    @GetMapping
    public List<UserSummary> listUsers(@RequestParam(value = "search", required = false) String search,
            @RequestParam(value = "role", required = false) String role,
            @RequestParam(value = "active", required = false) Boolean active,
            @RequestParam(value = "sort", required = false, defaultValue = "createdAt") String sort,
            @RequestParam(value = "dir", required = false, defaultValue = "desc") String dir) {
        return userRepository.findAll().stream()
                .map(UserSummary::from)
                .filter(u -> {
                    if (search == null || search.isBlank())
                        return true;
                    String kw = search.toLowerCase();
                    return (u.getUsername() != null && u.getUsername().toLowerCase().contains(kw)) ||
                            (u.getEmail() != null && u.getEmail().toLowerCase().contains(kw)) ||
                            (u.getPhone() != null && u.getPhone().toLowerCase().contains(kw));
                })
                .filter(u -> {
                    if (role == null || role.isBlank())
                        return true;
                    return role.equalsIgnoreCase(u.getRole());
                })
                .filter(u -> {
                    if (active == null)
                        return true;
                    return Boolean.TRUE.equals(active) == Boolean.TRUE.equals(u.getIsActive());
                })
                .sorted((a, b) -> {
                    int multiplier = "asc".equalsIgnoreCase(dir) ? 1 : -1;
                    switch (sort) {
                        case "username":
                            return multiplier * nullSafeCompare(a.getUsername(), b.getUsername());
                        case "email":
                            return multiplier * nullSafeCompare(a.getEmail(), b.getEmail());
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
    public ResponseEntity<?> getUser(@PathVariable("id") String userId) {
        return userRepository.findById(userId)
                .map(UserSummary::from)
                .map(ResponseEntity::ok)
                .orElseGet(() -> ResponseEntity.notFound().build());
    }

    @GetMapping("/{id}/dashboard")
    public ResponseEntity<?> getUserDashboard(@PathVariable("id") String userId) {
        return userRepository.findById(userId)
                .map(user -> {
                    List<Order> orders = orderRepository.findByUserOrderByCreatedAtDesc(user);
                    UserDashboardResponse resp = new UserDashboardResponse();
                    resp.setUser(UserSummary.from(user));
                    resp.setStats(Stats.fromOrders(orders));
                    resp.setRecentOrders(orders.stream()
                            .limit(8)
                            .map(OrderDetail::from)
                            .collect(Collectors.toList()));
                    return ResponseEntity.ok(resp);
                })
                .orElseGet(() -> ResponseEntity.notFound().build());
    }

    /**
     * Lấy danh sách đánh giá của user
     */
    @GetMapping("/{id}/reviews")
    public ResponseEntity<List<ReviewResponse>> getUserReviews(@PathVariable("id") String userId) {
        List<Review> reviews = reviewRepository.findByUserIdOrderByReviewDateDesc(userId);
        List<ReviewResponse> responses = reviewMapper.toReviewResponseList(reviews);
        return ResponseEntity.ok(responses);
    }

    @PatchMapping("/{id}/toggle-active")
    public ResponseEntity<?> toggleActive(@PathVariable("id") String userId) {
        return userRepository.findById(userId)
                .map(user -> {
                    user.setIsActive(Boolean.FALSE.equals(user.getIsActive()));
                    userRepository.save(user);
                    return ResponseEntity.ok(Map.of(
                            "userId", user.getUserId(),
                            "isActive", user.getIsActive()));
                })
                .orElseGet(() -> ResponseEntity.notFound().build());
    }

    @PutMapping("/{id}/role")
    public ResponseEntity<?> updateRole(@PathVariable("id") String userId,
            @RequestBody RoleUpdateRequest request) {
        if (request == null || request.getRole() == null) {
            return ResponseEntity.badRequest().body(Map.of("error", "role is required"));
        }
        Role targetRole;
        try {
            targetRole = Role.valueOf(request.getRole().toUpperCase());
        } catch (IllegalArgumentException ex) {
            return ResponseEntity.badRequest().body(Map.of("error", "Invalid role"));
        }

        return userRepository.findById(userId)
                .map(user -> {
                    user.setRole(targetRole);
                    userRepository.save(user);
                    return ResponseEntity.ok(Map.of(
                            "userId", user.getUserId(),
                            "role", user.getRole().name()));
                })
                .orElseGet(() -> ResponseEntity.notFound().build());
    }

    @Data
    public static class UserSummary {
        private String userId;
        private String username;
        private String email;
        private String phone;
        private String name;
        private String role;
        private Boolean isActive;
        private LocalDateTime createdAt;

        public static UserSummary from(User user) {
            UserSummary dto = new UserSummary();
            dto.setUserId(user.getUserId());
            dto.setUsername(user.getUsername());
            dto.setEmail(user.getEmail());
            dto.setPhone(user.getPhone());
            dto.setName(user.getName());
            dto.setRole(user.getRole() != null ? user.getRole().name() : null);
            dto.setIsActive(user.getIsActive());
            dto.setCreatedAt(user.getCreatedAt());
            return dto;
        }
    }

    @Data
    public static class UserDashboardResponse {
        private UserSummary user;
        private Stats stats;
        private List<OrderDetail> recentOrders;
    }

    @Data
    public static class Stats {
        private Integer totalOrders;
        private BigDecimal totalSpend;
        private BigDecimal averageOrderValue;
        private Integer totalItems;
        private Integer completedOrders;
        private Integer pendingOrders;
        private LocalDateTime firstOrderAt;
        private LocalDateTime lastOrderAt;

        public static Stats fromOrders(List<Order> orders) {
            Stats stats = new Stats();
            if (orders == null || orders.isEmpty()) {
                stats.setTotalOrders(0);
                stats.setTotalSpend(BigDecimal.ZERO);
                stats.setAverageOrderValue(BigDecimal.ZERO);
                stats.setTotalItems(0);
                stats.setCompletedOrders(0);
                stats.setPendingOrders(0);
                return stats;
            }

            stats.setTotalOrders(orders.size());
            BigDecimal spend = orders.stream()
                    .map(o -> o.getFinalAmount() != null ? o.getFinalAmount() : o.getTotalAmount())
                    .filter(v -> v != null)
                    .reduce(BigDecimal.ZERO, BigDecimal::add);
            stats.setTotalSpend(spend);

            stats.setAverageOrderValue(spend.divide(BigDecimal.valueOf(orders.size()), 2, RoundingMode.HALF_UP));

            int items = orders.stream()
                    .flatMap(o -> o.getOrderItems() != null ? o.getOrderItems().stream() : Stream.empty())
                    .mapToInt(item -> item.getQuantity() != null ? item.getQuantity() : 0)
                    .sum();
            stats.setTotalItems(items);

            stats.setCompletedOrders((int) orders.stream()
                    .filter(o -> o.getStatus() != null && o.getStatus().name().equalsIgnoreCase("COMPLETED")).count());
            stats.setPendingOrders((int) orders.stream()
                    .filter(o -> o.getStatus() != null && o.getStatus().name().equalsIgnoreCase("PENDING")).count());

            stats.setLastOrderAt(orders.stream().map(Order::getOrderDate).filter(d -> d != null)
                    .max(LocalDateTime::compareTo).orElse(null));
            stats.setFirstOrderAt(orders.stream().map(Order::getOrderDate).filter(d -> d != null)
                    .min(LocalDateTime::compareTo).orElse(null));
            return stats;
        }
    }

    @Data
    public static class OrderDetail {
        private String orderId;
        private LocalDateTime orderDate;
        private String status;
        private String statusLabel;
        private BigDecimal totalAmount;
        private BigDecimal finalAmount;
        private Integer itemCount;
        private String paymentMethod;
        private String paymentStatus;

        public static OrderDetail from(Order order) {
            OrderDetail dto = new OrderDetail();
            dto.setOrderId(order.getOrderId());
            dto.setOrderDate(order.getOrderDate());
            dto.setStatus(order.getStatus() != null ? order.getStatus().name() : null);
            dto.setStatusLabel(order.getStatus() != null ? order.getStatus().getDescription() : null);
            dto.setTotalAmount(order.getTotalAmount());
            dto.setFinalAmount(order.getFinalAmount());
            int count = order.getOrderItems() != null ? order.getOrderItems().stream()
                    .mapToInt(oi -> oi.getQuantity() != null ? oi.getQuantity() : 0)
                    .sum() : 0;
            dto.setItemCount(count);

            Payment payment = order.getActivePayment();
            if (payment != null) {
                dto.setPaymentStatus(payment.getPaymentStatus() != null ? payment.getPaymentStatus().name() : null);
                if (payment.getPaymentMethod() != null) {
                    dto.setPaymentMethod(payment.getPaymentMethod().getMethodName());
                }
            }
            return dto;
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

    @Data
    public static class RoleUpdateRequest {
        private String role;
    }
}
