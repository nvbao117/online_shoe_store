package com.example.online_shoe_store.Service.ai.tool;

import com.example.online_shoe_store.Entity.Product;
import com.example.online_shoe_store.Repository.ProductRepository;
import dev.langchain4j.agent.tool.Tool;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.stream.Collectors;

/**
 * Sales Tools - Công cụ cho Sales Agent
 */
@Component
@Slf4j
@RequiredArgsConstructor
public class SalesTools {

    private final ProductRepository productRepository;

    @Tool("Lấy danh sách sản phẩm bán chạy nhất")
    public String getBestSellers() {
        log.info("[SalesTools] Getting best sellers");
        // TODO: Implement với actual sales data
        List<Product> products = productRepository.findAll()
                .stream()
                .limit(5)
                .toList();
        
        return formatProductList(products, "Sản phẩm bán chạy");
    }

    @Tool("Lấy sản phẩm mới nhất")
    public String getNewArrivals() {
        log.info("[SalesTools] Getting new arrivals");
        List<Product> products = productRepository.findAll()
                .stream()
                .sorted((a, b) -> b.getCreatedAt().compareTo(a.getCreatedAt()))
                .limit(5)
                .toList();
        
        return formatProductList(products, "Sản phẩm mới");
    }

    @Tool("Kiểm tra giá và khuyến mãi của sản phẩm theo ID")
    public String checkPriceAndPromotion(String productId) {
        log.info("[SalesTools] Checking price for product: {}", productId);
        return productRepository.findById(productId)
                .map(p -> String.format(
                    "Sản phẩm: %s\nGiá gốc: %,dđ\nGiá sale: %,dđ\nTiết kiệm: %,dđ",
                    p.getName(),
                    p.getPrice().longValue(),
                    p.getPrice() != null ? p.getPrice().longValue() : p.getPrice().longValue(),
                    p.getPrice() != null ? p.getPrice().longValue() - p.getPrice().longValue() : 0
                ))
                .orElse("Không tìm thấy sản phẩm");
    }

    @Tool("Áp dụng mã giảm giá và tính tổng tiền")
    public String applyDiscountCode(String code, Double totalAmount) {
        log.info("[SalesTools] Applying discount code: {} to amount: {}", code, totalAmount);
        // TODO: Implement với actual voucher system
        double discount = 0;
        if ("WELCOME10".equalsIgnoreCase(code)) {
            discount = totalAmount * 0.1;
        } else if ("SALE20".equalsIgnoreCase(code)) {
            discount = totalAmount * 0.2;
        }
        
        if (discount > 0) {
            return String.format("Áp dụng mã %s thành công!\nGiảm: %,.0fđ\nTổng còn: %,.0fđ", 
                code, discount, totalAmount - discount);
        }
        return "Mã giảm giá không hợp lệ hoặc đã hết hạn";
    }

    private String formatProductList(List<Product> products, String title) {
        if (products.isEmpty()) return "Không có sản phẩm";
        
        StringBuilder sb = new StringBuilder(title).append(":\n");
        for (int i = 0; i < products.size(); i++) {
            Product p = products.get(i);
            sb.append(String.format("%d. %s - %,dđ\n", 
                i + 1, p.getName(), p.getPrice().longValue()));
        }
        return sb.toString();
    }

    @Tool("Lấy sản phẩm đang trending/hot")
    public String getTrendingProducts() {
        log.info("[SalesTools] Getting trending products");
        
        // In production: Use actual analytics (view count, purchase rate)
        List<Product> products = productRepository.findAll().stream()
                .filter(p -> p.getPrice() != null) // Sale products = more interest
                .sorted((a, b) -> b.getCreatedAt().compareTo(a.getCreatedAt()))
                .limit(5)
                .toList();
        
        if (products.isEmpty()) {
            return "Hiện không có sản phẩm trending.";
        }
        
        StringBuilder sb = new StringBuilder("🔥 SẢN PHẨM TRENDING:\n\n");
        for (int i = 0; i < products.size(); i++) {
            Product p = products.get(i);
            long saved = p.getPrice().longValue() - (p.getPrice() != null ? p.getPrice().longValue() : p.getPrice().longValue());
            sb.append(String.format("%d. %s\n   💰 %,dđ (Tiết kiệm %,dđ)\n\n", 
                i + 1, p.getName(), 
                p.getPrice() != null ? p.getPrice().longValue() : p.getPrice().longValue(),
                saved));
        }
        
        return sb.toString();
    }

    @Tool("Lấy sản phẩm theo mùa hiện tại")
    public String getSeasonalProducts() {
        log.info("[SalesTools] Getting seasonal products");
        
        // Determine current season in Vietnam
        int month = java.time.LocalDate.now().getMonthValue();
        String season;
        String recommendation;
        
        if (month >= 4 && month <= 9) {
            season = "Mùa Hè/Mưa";
            recommendation = "Giày sandal, dép, giày thể thao thoáng khí";
        } else {
            season = "Mùa Đông/Khô";
            recommendation = "Boot, giày da, giày lót ấm";
        }
        
        List<Product> products = productRepository.findAll().stream()
                .limit(5)
                .toList();
        
        StringBuilder sb = new StringBuilder();
        sb.append(String.format("🌤️ GỢI Ý CHO %s:\n\n", season.toUpperCase()));
        sb.append(String.format("💡 Nên mua: %s\n\n", recommendation));
        sb.append(formatProductList(products, "Sản phẩm phù hợp"));
        
        return sb.toString();
    }

    @Tool("Gợi ý sản phẩm cá nhân hóa dựa trên sở thích")
    public String getPersonalizedRecommendations(String preference, String size) {
        log.info("[SalesTools] Getting personalized recommendations - preference: {}, size: {}", preference, size);
        
        // In production: Use ML model + user history
        StringBuilder sb = new StringBuilder("🎯 GỢI Ý DÀNH RIÊNG CHO BẠN:\n\n");
        
        if (preference != null && !preference.isBlank()) {
            sb.append(String.format("Dựa trên sở thích: %s\n", preference));
        }
        if (size != null && !size.isBlank()) {
            sb.append(String.format("Size của bạn: %s\n\n", size));
        }
        
        List<Product> products = productRepository.findAll().stream()
                .limit(5)
                .toList();
        
        for (int i = 0; i < products.size(); i++) {
            Product p = products.get(i);
            sb.append(String.format("%d. 👟 %s\n   💰 %,dđ\n   ⭐ Phù hợp với style của bạn!\n\n",
                i + 1, p.getName(), p.getPrice().longValue()));
        }
        
        sb.append("💡 Tip: Đặt ngay để nhận ưu đãi Free Ship!");
        
        return sb.toString();
    }

    @Tool("So sánh hai sản phẩm")
    public String compareProducts(String productId1, String productId2) {
        log.info("[SalesTools] Comparing products {} and {}", productId1, productId2);
        
        var product1 = productRepository.findById(productId1);
        var product2 = productRepository.findById(productId2);
        
        if (product1.isEmpty() || product2.isEmpty()) {
            return "Không tìm thấy một hoặc cả hai sản phẩm để so sánh.";
        }
        
        Product p1 = product1.get();
        Product p2 = product2.get();
        
        return String.format("""
            📊 SO SÁNH SẢN PHẨM:
            
            ╔═══════════════════════════════════════╗
            ║ %s
            ╠═══════════════════════════════════════╣
            ║ Giá: %,dđ
            ║ Thương hiệu: %s
            ╚═══════════════════════════════════════╝
            
            ╔═══════════════════════════════════════╗
            ║ %s
            ╠═══════════════════════════════════════╣
            ║ Giá: %,dđ
            ║ Thương hiệu: %s
            ╚═══════════════════════════════════════╝
            
            💡 Đề xuất: %s giá tốt hơn!
            """,
            p1.getName(), p1.getPrice().longValue(), 
            p1.getBrand() != null ? p1.getBrand().getName() : "N/A",
            p2.getName(), p2.getPrice().longValue(),
            p2.getBrand() != null ? p2.getBrand().getName() : "N/A",
            p1.getPrice().compareTo(p2.getPrice()) < 0 ? p1.getName() : p2.getName()
        );
    }
}

