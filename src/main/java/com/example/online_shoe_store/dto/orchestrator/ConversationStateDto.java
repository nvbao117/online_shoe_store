package com.example.online_shoe_store.dto.orchestrator;

import com.example.online_shoe_store.Entity.enums.IntentType;
import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.*;

import java.util.List;
import java.util.Map;

/**
 * DTO đại diện cho state của conversation
 * Được serialize thành JSON và lưu trong conversation_state.state_json
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@JsonInclude(JsonInclude.Include.NON_NULL)
public class ConversationStateDto {

    private String cartId;
    private IntentType currentIntent;

    /**
     * Pending confirmation (nếu có action cần xác nhận)
     */
    private PendingConfirmation pendingConfirmation;

    /**
     * Danh sách lỗi từ tool gần nhất
     */
    private List<String> lastToolErrors;

    /**
     * Context bổ sung
     */
    private Map<String, Object> additionalContext;

    /**
     * Sản phẩm đang được xem/thảo luận
     */
    private List<String> viewedProductIds;

    /**
     * Order ID đang được theo dõi
     */
    private String trackingOrderId;

    /**
     * Trạng thái thanh toán pending
     */
    private String pendingPaymentId;

    /**
     * Số lần retry liên tiếp
     */
    private Integer consecutiveRetries;

    /**
     * Đã escalate chưa
     */
    private Boolean isEscalated;

    /**
     * Thông tin user (nếu đã đăng nhập)
     */
    private UserContext userContext;

    @Data
    @Builder
    @NoArgsConstructor
    @AllArgsConstructor
    public static class PendingConfirmation {
        private String confirmationType; // ADD_TO_CART, PLACE_ORDER, CANCEL_ORDER, etc.
        private String message;
        private Map<String, Object> data;
        private Long expiresAt;
    }

    @Data
    @Builder
    @NoArgsConstructor
    @AllArgsConstructor
    public static class UserContext {
        private String userId;
        private String email;
        private String name;
        private String phone;
        private String membershipLevel;
    }
}
