package com.example.online_shoe_store.Entity.enums;

public enum PaymentStatus {

    INITIATED("Khởi tạo"),                   // Vừa được tạo

    // Chờ xử lý
    PENDING("Chờ thanh toán"),               // Đang chờ khách thanh toán
    PROCESSING("Đang xử lý"),                // Đang giao dịch với cổng thanh toán
    AUTHORIZED("Đã ủy quyền"),               // Đã ủy quyền (chờ capture)

    // Thành công
    COMPLETED("Hoàn thành"),                 // Thanh toán thành công
    CAPTURED("Đã thu tiền"),                 // Đã thu tiền (với payment gateway)
    SETTLED("Đã thanh toán"),                // Đã chuyển tiền về tài khoản

    // Thất bại
    FAILED("Thất bại"),                      // Thanh toán thất bại
    DECLINED("Bị từ chối"),                  // Bị ngân hàng/người dùng từ chối
    EXPIRED("Hết hạn"),                      // Hết hạn thanh toán
    ABANDONED("Bị bỏ qua"),                  // Khách không hoàn tất thanh toán

    // Hủy & Hoàn tiền
    CANCELLED("Đã hủy"),                     // Đã hủy thanh toán
    REFUNDED("Đã hoàn tiền"),                // Đã hoàn tiền toàn bộ
    PARTIALLY_REFUNDED("Hoàn tiền một phần"), // Hoàn tiền một phần

    // Chờ xác nhận
    AWAITING_CONFIRMATION("Chờ xác nhận"),   // Chờ xác nhận từ admin
    UNDER_REVIEW("Đang xem xét"),            // Đang xem xét giao dịch

    // Lỗi
    ERROR("Lỗi hệ thống"),                   // Lỗi hệ thống
    CHARGEBACK("Tranh chấp"),                // Khách khiếu nại với ngân hàng
    DISPUTED("Bị tranh chấp"),               // Đang tranh chấp
    FRAUD("Gian lận");                       // Phát hiện gian lận

    private final String description;

    PaymentStatus(String description) {
        this.description = description;
    }

    public String getDescription() {
        return description;
    }
}
