package com.example.online_shoe_store.Service.ai.tool;

import com.example.online_shoe_store.Entity.ProductVariant;
import com.example.online_shoe_store.Repository.ProductVariantRepository;
import dev.langchain4j.agent.tool.Tool;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.stream.Collectors;

/**
 * Inventory Tools - Công cụ kiểm tra tồn kho
 */
@Component
@Slf4j
@RequiredArgsConstructor
public class InventoryTools {

    private final ProductVariantRepository variantRepository;

    @Tool("Kiểm tra tồn kho của sản phẩm theo ID và size")
    public String checkStock(String productId, String size) {
        List<ProductVariant> variants = variantRepository.findByProductProductId(productId);
        if (variants.isEmpty()) {
            return "Không tìm thấy sản phẩm với ID: " + productId;
        }
        for (ProductVariant v : variants) {
            if (v.getSize().equalsIgnoreCase(size)) {
                int stock = v.getStock();
                if (stock > 10) {
                    return String.format("Size %s còn %d đôi", size, stock);
                } else if (stock > 0) {
                    return String.format("Size %s chỉ còn %d đôi. Đặt ngay!", size, stock);
                } else {
                    return String.format("Size %s đã hết hàng", size);
                }
            }
        }
        return "Không tìm thấy size " + size + " cho sản phẩm này";
    }

    @Tool("Lấy danh sách size còn hàng của sản phẩm")
    public String getAvailableSizes(String productId) {
        List<ProductVariant> variants = variantRepository.findByProductProductId(productId);
        if (variants.isEmpty()) {
            return "Không tìm thấy sản phẩm";
        }
        String availableSizes = variants.stream()
                .filter(v -> v.getStock() > 0)
                .map(v -> String.format("%s (%d)", v.getSize(), v.getStock()))
                .collect(Collectors.joining(", "));
        
        if (availableSizes.isEmpty()) {
            return "Sản phẩm hiện đã hết hàng tất cả size";
        }
        return "Size còn hàng: " + availableSizes;
    }

    @Tool("Kiểm tra sản phẩm sắp hết hàng (low stock alert)")
    public String getLowStockProducts() {        
        List<ProductVariant> lowStockVariants = variantRepository.findAll().stream()
                .filter(v -> v.getStock() > 0 && v.getStock() <= 10)
                .limit(10)
                .toList();
        
        if (lowStockVariants.isEmpty()) {
            return "Tất cả sản phẩm đều hết hàng!";
        }
        
        StringBuilder sb = new StringBuilder("SẢN PHẨM SẮP HẾT HÀNG:\n\n");
        for (ProductVariant v : lowStockVariants) {
            sb.append(String.format("- %s | Size %s | Còn %d đôi\n",
                v.getProduct().getName(),
                v.getSize(),
                v.getStock()));
        }
        
        return sb.toString();
    }

    @Tool("Kiểm tra màu sắc còn hàng của sản phẩm")
    public String getAvailableColors(String productId) {        
        List<ProductVariant> variants = variantRepository.findByProductProductId(productId);
        
        if (variants.isEmpty()) {
            return "Không tìm thấy sản phẩm";
        }
        
        String colors = variants.stream()
                .filter(v -> v.getStock() > 0)
                .map(ProductVariant::getColor)
                .distinct()
                .collect(Collectors.joining(", "));
        
        return colors.isEmpty() ? "Hết hàng" : "Màu còn hàng: " + colors;
    }

    @Tool("Lấy danh sách sản phẩm cần nhập hàng khẩn cấp (critical low)")
    public String getCriticalLowStock() {        
        List<ProductVariant> criticalVariants = variantRepository.findAll().stream()
                .filter(v -> v.getStock() <= 3)
                .toList();
        
        if (criticalVariants.isEmpty()) {
            return "Không có sản phẩm nào ở mức critical!";
        }
        
        StringBuilder sb = new StringBuilder("SẢN PHẨM CẦN NHẬP HÀNG KHẨN CẤP:\n\n");
        long outOfStock = criticalVariants.stream().filter(v -> v.getStock() == 0).count();
        long criticalLow = criticalVariants.size() - outOfStock;
        
        sb.append(String.format("Hết hàng: %d variants\n", outOfStock));
        sb.append(String.format("Sắp hết (≤3): %d variants\n\n", criticalLow));
        
        criticalVariants.stream().limit(5).forEach(v -> 
            sb.append(String.format("- %s | Size %s | Stock: %d\n",
                v.getProduct().getName(),
                v.getSize(),
                v.getStock()))
        );
        
        if (criticalVariants.size() > 5) {
            sb.append(String.format("\n... và %d sản phẩm khác", criticalVariants.size() - 5));
        }
        
        return sb.toString();
    }

    @Tool("Gợi ý nhập hàng dựa trên tồn kho và nhu cầu")
    public String getRestockSuggestions() {
        log.info("[InventoryTools] Getting restock suggestions");
        
        // Get low stock items
        List<ProductVariant> lowStock = variantRepository.findAll().stream()
                .filter(v -> v.getStock() <= 5)
                .limit(10)
                .toList();
        
        if (lowStock.isEmpty()) {
            return "Hiện tại không cần nhập thêm hàng. Tồn kho đủ dùng!";
        }
        
        StringBuilder sb = new StringBuilder("GỢI Ý NHẬP HÀNG:\n\n");
        
        for (ProductVariant v : lowStock) {
            int suggestedQty = v.getStock() == 0 ? 50 : 30;
            sb.append(String.format("📌 %s - Size %s\n   Tồn: %d | Đề xuất nhập: %d\n\n",
                v.getProduct().getName(),
                v.getSize(),
                v.getStock(),
                suggestedQty));
        }
        
        sb.append("💡 Tip: Ưu tiên nhập sản phẩm bán chạy và size phổ biến (39-42)");
        
        return sb.toString();
    }
}
