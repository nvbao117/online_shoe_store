package com.example.online_shoe_store.Service.ai.tool;

import com.example.online_shoe_store.Entity.Product;
import com.example.online_shoe_store.Repository.ProductRepository;
import com.example.online_shoe_store.Repository.ProductVariantRepository;
import dev.langchain4j.agent.tool.Tool;
import org.springframework.stereotype.Component;
import lombok.RequiredArgsConstructor;

import java.math.BigDecimal;
import java.util.List;
import java.util.stream.Collectors;

@Component
@RequiredArgsConstructor
public class ProductAdvisorTools {

    private final ProductRepository productRepository;
    private final ProductVariantRepository productVariantRepository;

    // --- TOOL 1: SEARCH (Đã cập nhật BigDecimal và bỏ Gender) ---
    @Tool("Tìm kiếm giày theo tiêu chí: từ khóa (running, sneaker...), hãng (brand), giá tối đa. Tham số không rõ thì để null.")
    public String searchShoes(String keyword, String brand, Double maxPrice) {

        // Chuyển đổi Double (từ AI) sang BigDecimal (của DB)
        BigDecimal maxPriceBD = maxPrice != null ? BigDecimal.valueOf(maxPrice) : null;

        // Gọi hàm search mới (minPrice để null mặc định)
        List<Product> products = productRepository.searchProductsDynamic(keyword, brand, null, maxPriceBD);

        if (products.isEmpty()) {
            return "Không tìm thấy sản phẩm nào phù hợp.";
        }

        // Trả về top 5 sản phẩm dạng text
        return products.stream().limit(5)
                .map(p -> String.format("- ID: %s | Tên: %s | Giá: %s | Brand: %s | Loại: %s",
                        p.getProductId(),
                        p.getName(),
                        p.getPrice().toPlainString(), // Hiển thị giá chuẩn
                        p.getBrand() != null ? p.getBrand().getName() : "N/A",
                        p.getCategory() != null ? p.getCategory().getName() : "N/A"))
                .collect(Collectors.joining("\n"));
    }

    // --- TOOL 2: CHECK INVENTORY (Giữ nguyên) ---
    @Tool("Kiểm tra tồn kho của một mã sản phẩm (ID) với size cụ thể.")
    public String checkInventory(String productId, String size) {
        boolean available = productVariantRepository.existsByProduct_ProductIdAndSizeAndStockGreaterThan(productId, size, 0);

        if (available) {
            return "✅ Sản phẩm này size " + size + " đang CÒN HÀNG, bạn có thể đặt ngay!";
        } else {
            return "❌ Rất tiếc, size " + size + " hiện đã HẾT HÀNG.";
        }
    }

    // --- TOOL 3: SIZE MAPPING (Giữ nguyên) ---
    @Tool("Chuyển đổi size giày hoặc tư vấn size dựa trên chiều dài chân (cm).")
    public String consultSize(Double footLengthCm, String brand) {
        if (footLengthCm == null) return "Bạn vui lòng cung cấp chiều dài chân (cm) để mình tính size nhé.";

        int size = (int) (footLengthCm + 15); // Công thức ước lượng
        if ("Nike".equalsIgnoreCase(brand)) size += 1; // Ví dụ Nike thường form nhỏ

        return "Với chiều dài chân " + footLengthCm + "cm, size khuyên dùng là: " + size + " (EU).";
    }
}