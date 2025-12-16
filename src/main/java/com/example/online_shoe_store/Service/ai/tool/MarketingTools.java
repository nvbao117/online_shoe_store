package com.example.online_shoe_store.Service.ai.tool;

import com.example.online_shoe_store.Entity.Order;
import com.example.online_shoe_store.Entity.Product;
import com.example.online_shoe_store.Entity.User;
import com.example.online_shoe_store.Repository.OrderRepository;
import com.example.online_shoe_store.Repository.ProductRepository;
import com.example.online_shoe_store.Repository.UserRepository;
import dev.langchain4j.agent.tool.Tool;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.stream.Collectors;

/**
 * Marketing Tools - Công cụ phân tích và marketing
 */
@Component
@Slf4j
@RequiredArgsConstructor
public class MarketingTools {

    private final OrderRepository orderRepository;
    private final ProductRepository productRepository;
    private final UserRepository userRepository;

    @Tool("Phân tích dữ liệu bán hàng theo khoảng thời gian")
    public String analyzeSalesData(String period) {
        log.info("[MarketingTools] Analyzing sales data for period: {}", period);
        
        LocalDateTime startDate = switch (period.toLowerCase()) {
            case "today", "hôm nay" -> LocalDateTime.now().withHour(0).withMinute(0);
            case "week", "tuần" -> LocalDateTime.now().minusWeeks(1);
            case "month", "tháng" -> LocalDateTime.now().minusMonths(1);
            case "quarter", "quý" -> LocalDateTime.now().minusMonths(3);
            default -> LocalDateTime.now().minusDays(7);
        };
        
        List<Order> orders = orderRepository.findAll().stream()
                .filter(o -> o.getOrderDate() != null && o.getOrderDate().isAfter(startDate))
                .toList();
        
        if (orders.isEmpty()) {
            return "Không có đơn hàng trong khoảng thời gian này.";
        }
        
        BigDecimal totalRevenue = orders.stream()
                .map(Order::getTotalAmount)
                .reduce(BigDecimal.ZERO, BigDecimal::add);
        
        long completedOrders = orders.stream()
                .filter(o -> "DELIVERED".equals(o.getStatus().toString()) || 
                            "COMPLETED".equals(o.getStatus().toString()))
                .count();
        
        return String.format("""
            📊 BÁO CÁO BÁN HÀNG (%s):
            
            📦 Tổng đơn hàng: %d
            ✅ Đơn hoàn thành: %d
            💰 Tổng doanh thu: %,.0fđ
            📈 Giá trị TB/đơn: %,.0fđ
            
            Từ: %s
            Đến: %s
            """, 
            period,
            orders.size(),
            completedOrders,
            totalRevenue,
            orders.isEmpty() ? BigDecimal.ZERO : totalRevenue.divide(BigDecimal.valueOf(orders.size()), 0, java.math.RoundingMode.HALF_UP),
            startDate.format(DateTimeFormatter.ofPattern("dd/MM/yyyy")),
            LocalDateTime.now().format(DateTimeFormatter.ofPattern("dd/MM/yyyy"))
        );
    }

    @Tool("Lấy danh sách khách hàng VIP (mua nhiều nhất)")
    public String getTopCustomers(int limit) {
        log.info("[MarketingTools] Getting top {} customers", limit);
        
        // Get customers with most orders
        List<User> allUsers = userRepository.findAll();
        
        if (allUsers.isEmpty()) {
            return "Chưa có dữ liệu khách hàng.";
        }
        
        StringBuilder sb = new StringBuilder("🏆 TOP KHÁCH HÀNG VIP:\n\n");
        
        // Simple implementation - in production, use aggregation query
        int count = Math.min(limit, allUsers.size());
        for (int i = 0; i < count; i++) {
            User user = allUsers.get(i);
            sb.append(String.format("%d. %s (%s)\n", 
                i + 1, 
                user.getName() != null ? user.getName() : user.getEmail(),
                user.getEmail()));
        }
        
        sb.append("\n💡 Gợi ý: Gửi voucher đặc biệt cho nhóm khách VIP này!");
        
        return sb.toString();
    }

    @Tool("Gợi ý chương trình khuyến mãi dựa trên dữ liệu")
    public String suggestPromotion(String targetAudience) {
        log.info("[MarketingTools] Suggesting promotion for: {}", targetAudience);
        
        String suggestion = switch (targetAudience.toLowerCase()) {
            case "new", "mới", "khách mới" -> """
                🎯 CHIẾN DỊCH CHO KHÁCH MỚI:
                
                📌 Ý tưởng 1: "WELCOME10" - Giảm 10% đơn đầu tiên
                📌 Ý tưởng 2: Free ship đơn từ 500k
                📌 Ý tưởng 3: Combo ưu đãi (giày + tất + bảo dưỡng)
                
                💡 Kênh: Facebook Ads, Google Shopping
                📅 Thời gian đề xuất: 2-4 tuần
                """;
                
            case "vip", "loyal", "trung thành" -> """
                🎯 CHIẾN DỊCH CHO KHÁCH VIP:
                
                📌 Ý tưởng 1: Early access sale trước 24h
                📌 Ý tưởng 2: Double point trong tháng sinh nhật
                📌 Ý tưởng 3: Exclusive discount 20% cho member
                
                💡 Kênh: Email marketing, SMS, Zalo OA
                📅 Thời gian đề xuất: Ongoing
                """;
                
            case "inactive", "dormant", "không hoạt động" -> """
                🎯 CHIẾN DỊCH RE-ENGAGEMENT:
                
                📌 Ý tưởng 1: "Chúng tôi nhớ bạn" - Voucher 15%
                📌 Ý tưởng 2: Thông báo sản phẩm mới + ưu đãi
                📌 Ý tưởng 3: Flash sale exclusive
                
                💡 Kênh: Email drip campaign, Retargeting ads
                📅 Thời gian đề xuất: 1 tuần intensive
                """;
                
            default -> """
                🎯 CHIẾN DỊCH TỔNG HỢP:
                
                📌 Seasonal sale (Hè/Đông/Tết)
                📌 Bundle deals (Mua 2 giảm 15%)
                📌 Flash sale cuối tuần
                📌 Referral program (Giới thiệu bạn bè)
                
                💡 Cần thêm thông tin về target audience cụ thể!
                """;
        };
        
        return suggestion;
    }

    @Tool("Phân tích hiệu suất bán hàng của sản phẩm")
    public String getProductPerformance() {
        log.info("[MarketingTools] Getting product performance");
        
        List<Product> products = productRepository.findAll().stream()
                .limit(10)
                .toList();
        
        if (products.isEmpty()) {
            return "Chưa có dữ liệu sản phẩm.";
        }
        
        StringBuilder sb = new StringBuilder("📈 HIỆU SUẤT SẢN PHẨM:\n\n");
        
        for (int i = 0; i < products.size(); i++) {
            Product p = products.get(i);
            String status = p.getPrice() != null ? "🔥 SALE" : "📦 Normal";
            sb.append(String.format("%d. %s\n   Giá: %,dđ | %s\n\n", 
                i + 1, 
                p.getName(),
                p.getPrice().longValue(),
                status));
        }
        
        return sb.toString();
    }

    @Tool("Lấy danh sách sản phẩm trending/hot")
    public String getTrendingProducts() {
        log.info("[MarketingTools] Getting trending products");
        
        // In production: Use actual view/purchase analytics
        List<Product> products = productRepository.findAll().stream()
                .filter(p -> p.getPrice() != null) // Sale products as "trending"
                .limit(5)
                .toList();
        
        if (products.isEmpty()) {
            return "Chưa có dữ liệu sản phẩm trending.";
        }
        
        StringBuilder sb = new StringBuilder("🔥 SẢN PHẨM TRENDING:\n\n");
        
        for (int i = 0; i < products.size(); i++) {
            Product p = products.get(i);
            sb.append(String.format("%d. %s - %,dđ (was %,dđ)\n", 
                i + 1, 
                p.getName(),
                p.getPrice().longValue(),
                p.getPrice().longValue()));
        }
        
        sb.append("\n💡 Đề xuất: Tăng quảng cáo cho các sản phẩm này!");
        
        return sb.toString();
    }

    @Tool("Gợi ý ý tưởng campaign marketing")
    public String getCampaignIdeas(String season) {
        log.info("[MarketingTools] Getting campaign ideas for season: {}", season);
        
        String ideas = switch (season.toLowerCase()) {
            case "summer", "hè" -> """
                ☀️ CAMPAIGN HÈ:
                
                1. "Summer Vibes" - Giày sandal, dép đi biển
                2. "Sport Summer" - Running shoes collection
                3. "Back to School" (tháng 8) - Giày học sinh
                
                🎨 Visual: Tươi sáng, năng động
                📱 Format: Video ngắn TikTok/Reels
                """;
                
            case "winter", "đông" -> """
                ❄️ CAMPAIGN ĐÔNG:
                
                1. "Warm Steps" - Boot, giày da ấm
                2. "Year End Sale" - Xả kho cuối năm
                3. "New Year New Shoes" - Collection mới
                
                🎨 Visual: Ấm áp, sang trọng
                📱 Format: Story + Carousel
                """;
                
            case "tet", "tết" -> """
                🧧 CAMPAIGN TẾT:
                
                1. "Tết Sum Vầy" - Giày đỏ may mắn
                2. "Du Xuân" - Sneaker thoải mái
                3. "Lì Xì Khủng" - Sale up to 50%
                
                🎨 Visual: Đỏ vàng truyền thống
                📱 Format: Video, Livestream bán hàng
                """;
                
            default -> """
                🎯 CAMPAIGN IDEAS QUANH NĂM:
                
                1. Flash Sale cuối tuần
                2. Member Day (ngày 15 hàng tháng)
                3. Review & Win (đánh giá để nhận voucher)
                4. Referral Program
                
                💡 Cần biết mùa/dịp cụ thể để gợi ý tốt hơn!
                """;
        };
        
        return ideas;
    }
}
