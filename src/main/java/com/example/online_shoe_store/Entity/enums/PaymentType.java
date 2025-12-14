package com.example.online_shoe_store.Entity.enums;

public enum PaymentType {
    PAYMENT("Thanh toán"),
    REFUND("Hoàn tiền"),
    CHARGEBACK("Tranh chấp"),
    PARTIAL_REFUND("Hoàn tiền một phần"),
    CAPTURE("Thu tiền"), // Dùng cho payment gateways
    AUTHORIZATION("Ủy quyền");

    private final String description;

    PaymentType(String description) {
        this.description = description;
    }

    public String getDescription() {
        return description;
    }
}