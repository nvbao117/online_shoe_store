package com.example.online_shoe_store.dto.orchestrator;

import dev.langchain4j.model.output.structured.Description;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

/**
 * Các entities được trích xuất từ tin nhắn người dùng
 */

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ExtractedEntities {

    //=========================================
    // PRODUCT INFO
    //=========================================

    @Description("Thương hiệu giày. VD: Nike, Adidas, Puma, Biti's. Để null nếu không đề cập.")
    private String brand;

    @Description("Loại/danh mục giày. VD: chạy bộ, bóng chuyền,...")
    private String category;

    @Description("Size giày (số nguyên). VD: 38, 42, 43. Nếu user nói '42.5' thì làm tròn lên 43.")
    private Integer size;

    @Description("Màu sắc. VD: đen, trắng, đỏ, xanh navy, be")
    private String color;

    @Description("Chất liệu. VD: da thật, da tổng hợp, vải canvas, mesh, suede")
    private String material;

    @Description("Đối tượng. Giá trị: Nam, Nữ, Unisex, Trẻ em")
    private String gender;

    @Description("Tên sản phẩm cụ thể nếu có. VD: Air Force 1, UltraBoost 21, Stan Smith")
    private String productName;

    @Description("Mã sản phẩm")
    private String productId;

    //=========================================
    // BUDGET
    //=========================================

    @Description("Ngân sách tối thiểu (VND, số nguyên). '500k' → 500000, '1 triệu' → 1000000")
    private BigDecimal minBudget;

    @Description("Ngân sách tối đa (VND, số nguyên). '2tr' → 2000000, '1.5 triệu' → 1500000")
    private BigDecimal maxBudget;

    //=========================================
    // ORDER INFO
    //=========================================

    @Description("Mã đơn hàng. VD: ORD123, DH001, #12345")
    private String orderId;

    @Description("Số lượng sản phẩm. Mặc định 1 nếu không đề cập.")
    private Integer quantity;

    //=========================================
    // USER MEASUREMENT
    //=========================================

    @Description("Chiều dài bàn chân (cm). VD: 'chân 25cm' → 25.0")
    private Double footLength;

    @Description("Chiều rộng bàn chân (cm). VD: 'chân rộng 10cm' → 10.0")
    private Double footWidth;

    //=========================================
    // COMPLAINT/RETURN
    //=========================================

    @Description("Loại khiếu nại. VD: hàng lỗi, giao chậm, sai màu, thái độ nhân viên")
    private String complaintType;

    @Description("Lý do đổi/trả. VD: size chật, size rộng, không thích, lỗi sản phẩm")
    private String returnReason;

    //=========================================
    // OTHER
    //=========================================

    @Description("Mã voucher/giảm giá nếu đề cập. VD: SALE50, FREESHIP, NEWUSER10")
    private String voucherCode;

    @Description("Tham chiếu thời gian. Giữ nguyên text. VD: hôm qua, tuần trước, tháng 11")
    private String timeReference;

    // kiem tra co entity nao duoc extract ko
    public boolean hasAnyEntity() {
        return brand != null || category != null || size != null ||
                color != null || orderId != null || productId != null ||
                minBudget != null || maxBudget != null || voucherCode != null;
    }


    // kiem tra co thong tin sp khoong
    public boolean hasProductInfo(){
        return brand != null || category != null || size != null ||
                color != null || orderId != null || productName != null ;
    }

    // kiem tra co thong tin budget ko
    public boolean hasBudgetInfo(){
        return minBudget != null || maxBudget != null ;
    }
}