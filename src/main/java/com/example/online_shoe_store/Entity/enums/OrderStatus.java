package com.example.online_shoe_store.Entity.enums;

public enum OrderStatus {
    DRAFT("Đơn nháp"),                      // Đang tạo đơn, chưa submit
    // Chờ xử lý
    PENDING("Chờ xác nhận"),                 // Đã đặt, chờ xác nhận
    AWAITING_PAYMENT("Chờ thanh toán"),      // Đã xác nhận, chờ thanh toán
    PAYMENT_FAILED("Thanh toán thất bại"),   // Thanh toán thất bại, có thể retry

    // Đã xác nhận & xử lý
    CONFIRMED("Đã xác nhận"),                // Đã thanh toán/được xác nhận
    PROCESSING("Đang xử lý"),                // Đang chuẩn bị hàng
    READY_FOR_SHIPMENT("Sẵn sàng giao"),     // Đã đóng gói xong

    // Vận chuyển
    SHIPPED("Đã giao cho DVVC"),             // Đã bàn giao cho đơn vị vận chuyển
    IN_TRANSIT("Đang vận chuyển"),           // Đang trên đường giao
    OUT_FOR_DELIVERY("Đang giao hàng"),      // Shipper đang giao

    // Hoàn thành & Giao hàng
    DELIVERED("Đã giao hàng"),               // Đã giao cho khách
    COMPLETED("Hoàn thành"),                 // Đã hoàn tất (sau khi hết thời gian đổi trả)

    // Vấn đề & Hủy
    CANCELLED("Đã hủy"),                     // Đã hủy đơn
    EXPIRED("Hết hạn"),                      // Hết hạn thanh toán
    FAILED("Thất bại"),                      // Đơn hàng thất bại

    // Hoàn trả
    RETURN_REQUESTED("Yêu cầu trả hàng"),    // Khách yêu cầu trả hàng
    RETURN_IN_PROGRESS("Đang xử lý trả hàng"),// Đang xử lý trả hàng
    RETURNED("Đã trả hàng"),                 // Đã nhận lại hàng trả
    REFUNDED("Đã hoàn tiền"),                // Đã hoàn tiền
    PARTIALLY_REFUNDED("Đã hoàn tiền một phần"), // Hoàn tiền một phần

    // Đặc biệt
    ON_HOLD("Tạm giữ"),                      // Tạm dừng xử lý (cần kiểm tra)
    SUSPENDED("Tạm ngưng"),                  // Tạm ngưng do vấn đề
    FRAUD_REVIEW("Kiểm tra nghi ngờ gian lận"); // Nghi ngờ gian lận

    private final String description;

    OrderStatus(String description) {
        this.description = description;
    }

    public String getDescription() {
        return description;
    }
}
