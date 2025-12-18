package com.example.online_shoe_store.Service.ai.tool;

import dev.langchain4j.agent.tool.Tool;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

/**
 * Support Tools - Công cụ hỗ trợ khách hàng
 */
@Component
@Slf4j
@RequiredArgsConstructor
public class SupportTools {

    @Tool("Kiểm tra chính sách đổi trả hàng")
    public String getReturnPolicy() {
        log.info("[SupportTools] Getting return policy");
        return """
            📋 CHÍNH SÁCH ĐỔI TRẢ:
            
            ✅ Điều kiện đổi/trả:
            - Trong vòng 7 ngày kể từ ngày nhận hàng
            - Sản phẩm còn nguyên tem, nhãn mác
            - Chưa qua sử dụng
            - Có hóa đơn mua hàng
            
            ❌ Không áp dụng:
            - Sản phẩm sale trên 50%
            - Sản phẩm đặt riêng theo yêu cầu
            
            💰 Hoàn tiền:
            - Hoàn 100% nếu lỗi từ shop
            - Hoàn 90% nếu đổi ý (trừ phí vận chuyển)
            """;
    }

    @Tool("Kiểm tra chính sách bảo hành")
    public String getWarrantyPolicy() {
        log.info("[SupportTools] Getting warranty policy");
        return """
            🛡️ CHÍNH SÁCH BẢO HÀNH:
            
            - Bảo hành 3 tháng với lỗi từ nhà sản xuất
            - Bảo hành đế, mũi giày, đường may
            - Không bảo hành: phai màu, mòn tự nhiên, do tác động ngoại lực
            
            📞 Liên hệ bảo hành: 1900-xxxx
            """;
    }

    @Tool("Tạo yêu cầu đổi/trả hàng")
    public String createReturnRequest(String orderId, String reason) {
        log.info("[SupportTools] Creating return request for order {} - reason: {}", orderId, reason);
        // TODO: Implement with actual ticket system
        String ticketId = "RET" + System.currentTimeMillis() % 100000;
        return String.format("""
            ✅ Đã tạo yêu cầu đổi/trả hàng!
            
            Mã yêu cầu: %s
            Đơn hàng: %s
            Lý do: %s
            
            Nhân viên sẽ liên hệ bạn trong 24h để xác nhận.
            """, ticketId, orderId, reason);
    }

    @Tool("Chuyển yêu cầu lên nhân viên hỗ trợ (escalate)")
    public String escalateToHuman(String issue, String priority) {
        log.info("[SupportTools] Escalating to human - issue: {}, priority: {}", issue, priority);
        String ticketId = "SUP" + System.currentTimeMillis() % 100000;
        return String.format("""
            🔔 Đã chuyển yêu cầu lên nhân viên hỗ trợ!
            
            Mã ticket: %s
            Độ ưu tiên: %s
            
            Nhân viên sẽ liên hệ bạn trong vòng:
            - HIGH: 1 giờ
            - NORMAL: 4 giờ
            - LOW: 24 giờ
            """, ticketId, priority.toUpperCase());
    }

    @Tool("Hướng dẫn bảo quản giày")
    public String getCareInstructions(String shoeType) {
        log.info("[SupportTools] Getting care instructions for: {}", shoeType);
        
        String instructions = switch (shoeType.toLowerCase()) {
            case "sneaker", "giày thể thao" -> """
                👟 CÁCH BẢO QUẢN SNEAKER:
                1. Vệ sinh bằng bàn chải mềm + xà phòng nhẹ
                2. Không ngâm nước, không máy giặt
                3. Phơi khô tự nhiên, tránh ánh nắng trực tiếp
                4. Dùng giấy báo nhét bên trong khi không đi
                5. Bảo quản nơi khô ráo, thoáng mát
                """;
            case "da", "leather" -> """
                👞 CÁCH BẢO QUẢN GIÀY DA:
                1. Lau bụi bằng khăn mềm sau mỗi lần sử dụng
                2. Đánh xi định kỳ 1-2 tuần/lần
                3. Tránh tiếp xúc nước, nếu ướt phải lau khô ngay
                4. Sử dụng khuôn giữ form
                5. Bảo quản trong hộp có lỗ thông khí
                """;
            default -> """
                👠 HƯỚNG DẪN BẢO QUẢN CHUNG:
                1. Vệ sinh sau mỗi lần sử dụng
                2. Để nơi khô ráo, thoáng mát
                3. Không phơi trực tiếp dưới nắng
                4. Xoay vòng sử dụng nhiều đôi
                """;
        };
        
        return instructions;
    }

    @Tool("Tạo phiếu khiếu nại chính thức")
    public String createComplaintTicket(String orderId, String issueType, String description) {
        log.info("[SupportTools] Creating complaint ticket for order {} - type: {}", orderId, issueType);
        
        String ticketId = "CMP" + System.currentTimeMillis() % 100000;
        String priority = determineComplaintPriority(issueType);
        
        return String.format("""
            🎫 PHIẾU KHIẾU NẠI ĐÃ TẠO!
            
            Mã phiếu: %s
            Đơn hàng: %s
            Loại vấn đề: %s
            Độ ưu tiên: %s
            
            Mô tả: %s
            
            ⏱️ Thời gian phản hồi dự kiến:
            - URGENT: 2 giờ
            - HIGH: 6 giờ
            - NORMAL: 24 giờ
            
            📞 Nếu cần hỗ trợ gấp: 1900-xxxx
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
            
            📊 Đánh giá: %d/5 sao
            💬 Nhận xét: %s
            
            Phản hồi của bạn giúp chúng tôi cải thiện dịch vụ.
            Chúc bạn một ngày tốt lành! 🌟
            """, emoji, rating, comment != null ? comment : "Không có");
    }

    @Tool("Thông tin vận chuyển và giao hàng")
    public String getShippingInfo() {
        log.info("[SupportTools] Getting shipping info");
        return """
            🚚 THÔNG TIN VẬN CHUYỂN:
            
            📍 Khu vực giao hàng:
            - Nội thành TP.HCM, Hà Nội: 1-2 ngày
            - Ngoại thành, các tỉnh khác: 3-5 ngày
            
            💰 Phí vận chuyển:
            - Đơn dưới 500K: 30,000đ
            - Đơn từ 500K-1tr: 20,000đ
            - Đơn trên 1 triệu: MIỄN PHÍ
            
            🏪 Đối tác vận chuyển:
            - GHN (Giao Hàng Nhanh)
            - GHTK (Giao Hàng Tiết Kiệm)
            - Viettel Post
            
            📦 Kiểm tra khi nhận hàng để đảm bảo đúng size/màu!
            """;
    }

    @Tool("Kiểm tra trạng thái bảo hành của sản phẩm")
    public String checkWarrantyStatus(String orderId) {
        log.info("[SupportTools] Checking warranty status for order: {}", orderId);
        
        // Placeholder - in production, check actual order date + warranty period
        return String.format("""
            🛡️ TRẠNG THÁI BẢO HÀNH:
            
            Đơn hàng: #%s
            Thời hạn bảo hành: 3 tháng
            Trạng thái: ✅ Còn hiệu lực
            
            📋 Điều kiện bảo hành:
            - Lỗi do nhà sản xuất
            - Đường may, đế giày, mũi giày
            
            ❌ Không bảo hành:
            - Hư hỏng do sử dụng sai cách
            - Phai màu tự nhiên
            - Mòn do sử dụng bình thường
            
            📞 Liên hệ bảo hành: 1900-xxxx
            """, orderId);
    }
}

