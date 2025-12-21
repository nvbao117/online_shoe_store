package com.example.online_shoe_store.Service.ai.tool;

import dev.langchain4j.agent.tool.Tool;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import com.example.online_shoe_store.Service.notification.SupportEmailService;

/**
 * Support Tools - Công cụ hỗ trợ khách hàng
 */
@Component
@Slf4j
@RequiredArgsConstructor
public class SupportTools {

    private final SupportEmailService supportEmailService;

    @Tool("Tạo yêu cầu đổi/trả hàng")
    public String createReturnRequest(String orderId, String reason) {
        log.info("[SupportTools] Creating return request for order {} - reason: {}", orderId, reason);

        String normalizedOrderId = normalizeOrderId(orderId);
        String normalizedReason = normalizeReason(reason);

        if (normalizedOrderId == null) {
            return "Vui lòng cung cấp MÃ ĐƠN HÀNG hợp lệ (chỉ cần phần số, ví dụ: 12345).";
        }

        if (normalizedReason == null) {
            return "Vui lòng cho biết LÝ DO đổi/trả (ví dụ: Không vừa size, Sản phẩm lỗi, Giao sai hàng).";
        }

        String ticketId = "RET" + System.currentTimeMillis() % 100000;
        return String.format("""
            Đã tạo yêu cầu đổi/trả hàng!
            
            Mã yêu cầu: %s
            Đơn hàng: %s
            Lý do: %s
            
            Nhân viên sẽ liên hệ bạn trong 24h để xác nhận.
            """, ticketId, normalizedOrderId, normalizedReason);
    }

    private String normalizeOrderId(String orderId) {
        if (orderId == null) return null;
        String raw = orderId.trim();
        if (raw.isEmpty()) return null;
        // Block obvious placeholder text the LLM might pass through
        String upper = raw.toUpperCase();
        if (upper.contains("NHẬP MÃ") || upper.contains("MÃ ĐƠN") || upper.contains("YOUR ORDER")) {
            return null;
        }
        String digits = raw.replaceAll("[^0-9]", "");
        return digits.isEmpty() ? null : digits;
    }

    private String normalizeReason(String reason) {
        if (reason == null) return null;
        String raw = reason.trim();
        if (raw.isEmpty()) return null;
        String upper = raw.toUpperCase();
        if (upper.contains("LÝ DO") || upper.contains("VD") || upper.contains("VÍ DỤ")) {
            // looks like an instruction template rather than a user-provided reason
            return null;
        }
        return raw;
    }

        @Tool("Chuyển yêu cầu lên nhân viên hỗ trợ (escalate)")
        public String escalateToHuman(String issue, String priority, String sessionId, String transcript) {
        log.info("[SupportTools] Escalating to human - issue: {}, priority: {}, session: {}", issue, priority, sessionId);
        String ticketId = "SUP" + System.currentTimeMillis() % 100000;

        boolean emailed = supportEmailService.sendEscalationEmail(
            sessionId != null ? sessionId : "unknown",
            issue,
            priority != null ? priority.toUpperCase() : "NORMAL",
            null,
            transcript
        );

        String contactLine = emailed
            ? "Đã gửi email cho đội CSKH."
            : "(Email chưa gửi được – sẽ thử lại sau hoặc nhân viên sẽ kiểm tra thủ công)";

        return String.format("""
            Đã chuyển yêu cầu lên nhân viên hỗ trợ!

            Mã ticket tạm thời: %s
            Độ ưu tiên: %s
            %s

            Nhân viên sẽ liên hệ bạn trong vòng:
            - HIGH: 1 giờ
            - NORMAL: 4 giờ
            - LOW: 24 giờ
            """, ticketId, priority.toUpperCase(), contactLine);
        }

    @Tool("Tạo phiếu khiếu nại chính thức")
    public String createComplaintTicket(String orderId, String issueType, String description) {
        log.info("[SupportTools] Creating complaint ticket for order {} - type: {}", orderId, issueType);
        
        String ticketId = "CMP" + System.currentTimeMillis() % 100000;
        String priority = determineComplaintPriority(issueType);
        
        return String.format("""
            PHIẾU KHIẾU NẠI ĐÃ TẠO!
            
            Mã phiếu: %s
            Đơn hàng: %s
            Loại vấn đề: %s
            Độ ưu tiên: %s
            
            Mô tả: %s
            
            Thời gian phản hồi dự kiến:
            - URGENT: 2 giờ
            - HIGH: 6 giờ
            - NORMAL: 24 giờ
            
            Nếu cần hỗ trợ gấp: 0397179146
            """, ticketId, orderId, issueType, priority, description);
    }

    private String determineComplaintPriority(String issueType) {
        if (issueType == null) return "NORMAL";
        
        return switch (issueType.toLowerCase()) {
            case "lỗi sản phẩm", "product defect", "hàng lỗi" -> "URGENT";
            case "giao sai hàng", "wrong item", "thiếu hàng" -> "HIGH";
            case "chậm giao", "delay" -> "NORMAL";
            default -> "NORMAL";
        };
    }

    @Tool("Thu thập đánh giá khách hàng sau hỗ trợ")
    public String collectFeedback(String sessionId, int rating, String comment) {
        log.info("[SupportTools] Collecting feedback for session {} - rating: {}", sessionId, rating);
        
        // In production: Store in database
        String emoji = rating >= 4 ? "😊" : rating >= 3 ? "😐" : "😞";
        
        return String.format("""
            %s Cảm ơn bạn đã đánh giá!
            
            Đánh giá: %d/5 sao
            Nhận xét: %s
            
            Phản hồi của bạn giúp chúng tôi cải thiện dịch vụ.
            Chúc bạn một ngày tốt lành!
            """, emoji, rating, comment != null ? comment : "Không có");
    }


}

