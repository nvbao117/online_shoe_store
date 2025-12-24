package com.example.online_shoe_store.Service.ai.tool;

import com.example.online_shoe_store.Entity.Order;
import com.example.online_shoe_store.Repository.OrderRepository;
import dev.langchain4j.agent.tool.Tool;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Optional;

/**
 * Order Tools - Công cụ cho Order/Logistics Agent
 */
@Component
@Slf4j
@RequiredArgsConstructor
public class OrderTools {

    private final OrderRepository orderRepository;

    @Tool("Tra cứu đơn hàng theo mã đơn")
    public String trackOrder(String orderId) {
        log.info("[OrderTools] Tracking order: {}", orderId);
        
        try {
            if (orderId == null || orderId.isBlank()) {
                return "Vui lòng cung cấp mã đơn hợp lệ.";
            }

            String id = orderId.replaceAll("[^0-9]", "");
            if (id.isBlank()) {
                return "Vui lòng cung cấp mã đơn hợp lệ.";
            }

            Optional<Order> orderOpt = orderRepository.findById(id);
            
            if (orderOpt.isPresent()) {
                Order order = orderOpt.get();
                return String.format("""
                    📦 Đơn hàng #%d
                    Trạng thái: %s
                    Ngày đặt: %s
                    Tổng tiền: %,dđ
                    """,
                    order.getOrderId(),
                    order.getStatus(),
                    order.getOrderDate(),
                    order.getTotalAmount() != null ? order.getTotalAmount().longValue() : 0L
                );
            }
        } catch (NumberFormatException e) {
            log.warn("Invalid order ID format: {}", orderId);
        }
        
        return "Không tìm thấy đơn hàng với mã: " + orderId;
    }

    @Tool("Tính phí vận chuyển dựa trên địa chỉ")
    public String calculateShipping(String address) {
        log.info("[OrderTools] Calculating shipping for: {}", address);
        
        if (address == null || address.isBlank()) {
            return "Vui lòng cung cấp địa chỉ giao hàng.";
        }

        // Simple shipping calculation based on location
        int shippingCost = 30000; // Default
        
        if (address.toLowerCase().contains("hồ chí minh") || 
            address.toLowerCase().contains("hcm")) {
            shippingCost = 20000;
        } else if (address.toLowerCase().contains("hà nội")) {
            shippingCost = 25000;
        } else if (address.toLowerCase().contains("đà nẵng")) {
            shippingCost = 28000;
        }
        
        return String.format("Phí vận chuyển đến %s: %,dđ\nDự kiến giao: 3-5 ngày", 
            address, shippingCost);
    }

    @Tool("Lấy thông tin trạng thái đơn hàng gần nhất của khách")
    public String getLastOrderStatus(Long userId) {
        log.info("[OrderTools] Getting last order for user: {}", userId);
        // TODO: Implement with actual user order lookup
        return "Đơn hàng gần nhất của bạn đang được xử lý. Vui lòng cung cấp mã đơn để tra cứu chi tiết.";
    }

    @Tool("Kiểm tra điều kiện hủy đơn hàng")
    public String checkCancelEligibility(String orderId) {
        log.info("[OrderTools] Checking cancel eligibility for: {}", orderId);
        
        try {
            if (orderId == null || orderId.isBlank()) {
                return "Vui lòng cung cấp mã đơn hợp lệ.";
            }

            String id = orderId.replaceAll("[^0-9]", "");
            if (id.isBlank()) {
                return "Vui lòng cung cấp mã đơn hợp lệ.";
            }

            Optional<Order> orderOpt = orderRepository.findById(id);
            
            if (orderOpt.isPresent()) {
                Order order = orderOpt.get();
                String status = order.getStatus() != null ? order.getStatus().toString().toUpperCase() : "";
                
                if (status.contains("PENDING") || status.contains("PROCESSING")) {
                    return "✅ Đơn hàng #" + orderId + " có thể hủy. Bạn có muốn tiếp tục?";
                } else if (status.contains("SHIPPED")) {
                    return "⚠️ Đơn hàng đã giao cho đơn vị vận chuyển. Vui lòng liên hệ hotline để hủy.";
                } else {
                    return "❌ Đơn hàng không thể hủy do đã " + status;
                }
            }
        } catch (NumberFormatException e) {
            log.warn("Invalid order ID format: {}", orderId);
        }
        
        return "Không tìm thấy đơn hàng";
    }

//    @Tool("Kiểm tra điều kiện hoàn tiền cho đơn hàng")
//    public String checkRefundEligibility(String orderId) {
//        log.info("[OrderTools] Checking refund eligibility for: {}", orderId);
//
//        try {
//            if (orderId == null || orderId.isBlank()) {
//                return "Vui lòng cung cấp mã đơn hợp lệ.";
//            }
//
//            String id = orderId.replaceAll("[^0-9]", "");
//            if (id.isBlank()) {
//                return "Vui lòng cung cấp mã đơn hợp lệ.";
//            }
//
//            Optional<Order> orderOpt = orderRepository.findById(id);
//
//            if (orderOpt.isPresent()) {
//                Order order = orderOpt.get();
//                String status = order.getStatus() != null ? order.getStatus().toString().toUpperCase() : "";
//
//                // Check if within 7 days
//                if (order.getOrderDate() != null) {
//                    java.time.LocalDateTime sevenDaysAgo = java.time.LocalDateTime.now().minusDays(7);
//                    boolean withinWindow = order.getOrderDate().isAfter(sevenDaysAgo);
//
//                    if (!withinWindow) {
//                        return "❌ Đơn hàng đã quá 7 ngày, không đủ điều kiện hoàn tiền theo chính sách.";
//                    }
//                }
//
//                if (status.contains("DELIVERED") || status.contains("COMPLETED")) {
//                    return String.format("""
//                        ✅ Đơn hàng #%s đủ điều kiện hoàn tiền!
//
//                        📋 Điều kiện:
//                        - Sản phẩm còn nguyên vẹn, chưa sử dụng
//                        - Có đầy đủ tem, nhãn mác
//
//                        💰 Số tiền hoàn: %,dđ
//                        ⏱️ Thời gian xử lý: 3-5 ngày làm việc
//                        """, orderId, order.getTotalAmount() != null ? order.getTotalAmount().longValue() : 0L);
//                } else if (status.contains("PENDING") || status.contains("PROCESSING")) {
//                    return "⚠️ Đơn hàng chưa giao, vui lòng HỦY ĐƠN thay vì yêu cầu hoàn tiền.";
//                } else {
//                    return "❌ Đơn hàng không đủ điều kiện hoàn tiền do trạng thái: " + status;
//                }
//            }
//        } catch (NumberFormatException e) {
//            log.warn("Invalid order ID format: {}", orderId);
//        }
//
//        return "Không tìm thấy đơn hàng";
//    }

//    @Tool("Phát hiện đơn hàng đáng ngờ (fraud detection)")
//    public String detectSuspiciousPatterns(String email, String phone) {
//        log.info("[OrderTools] Checking suspicious patterns for email: {}, phone: {}", email, phone);
//
//        // Placeholder implementation - in production, check:
//        // - Multiple orders from same IP in short time
//        // - High value orders from new accounts
//        // - Unusual shipping addresses
//        // - Known fraud patterns
//
//        StringBuilder sb = new StringBuilder("🔍 KẾT QUẢ KIỂM TRA GIAN LẬN:\n\n");
//
//        // Simulate checks
//        boolean suspicious = false;
//
//        if (email != null && email.contains("+") && email.contains("@gmail")) {
//            sb.append("⚠️ Email sử dụng alias Gmail (có dấu +)\n");
//            suspicious = true;
//        }
//
//        // Check for disposable email domains
//        if (email != null && (email.contains("tempmail") || email.contains("guerrilla") || email.contains("10minute"))) {
//            sb.append("🚨 Email tạm thời (disposable email)\n");
//            suspicious = true;
//        }
//
//        if (!suspicious) {
//            sb.append("✅ Không phát hiện dấu hiệu đáng ngờ\n");
//            sb.append("📋 Các kiểm tra đã thực hiện:\n");
//            sb.append("- Email hợp lệ\n");
//            sb.append("- Không có pattern bất thường\n");
//        } else {
//            sb.append("\n💡 Đề xuất: Xác minh qua điện thoại trước khi xử lý đơn");
//        }
//
//        return sb.toString();
//    }

//    @Tool("Lấy lịch sử đơn hàng của khách")
//    public String getOrderHistory(String email) {
//        log.info("[OrderTools] Getting order history for: {}", email);
//
//        // Simple implementation - in production, query by user email
//        List<Order> recentOrders = orderRepository.findAll().stream()
//                .sorted((a, b) -> {
//                    if (a.getOrderDate() == null) return 1;
//                    if (b.getOrderDate() == null) return -1;
//                    return b.getOrderDate().compareTo(a.getOrderDate());
//                })
//                .limit(5)
//                .toList();
//
//        if (recentOrders.isEmpty()) {
//            return "Không tìm thấy lịch sử đơn hàng.";
//        }
//
//        StringBuilder sb = new StringBuilder("📦 LỊCH SỬ ĐƠN HÀNG:\n\n");
//
//        for (Order order : recentOrders) {
//            sb.append(String.format("#%d | %s | %,dđ | %s\n",
//                order.getOrderId(),
//                order.getOrderDate() != null ?
//                    order.getOrderDate().format(java.time.format.DateTimeFormatter.ofPattern("dd/MM/yyyy")) : "N/A",
//                order.getTotalAmount() != null ? order.getTotalAmount().longValue() : 0L,
//                order.getStatus() != null ? order.getStatus() : "N/A"));
//        }
//
//        return sb.toString();
//    }
}
