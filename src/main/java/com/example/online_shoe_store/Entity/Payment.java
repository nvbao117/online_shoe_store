package com.example.online_shoe_store.Entity;

import com.example.online_shoe_store.Entity.enums.PaymentStatus;
import com.example.online_shoe_store.Entity.enums.PaymentType;
import jakarta.persistence.*;
import jakarta.validation.constraints.DecimalMin;
import lombok.*;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.UUID;

@Entity
@Table(name = "payments", indexes = {
        @Index(name = "idx_payment_order", columnList = "order_id"),
        @Index(name = "idx_payment_status", columnList = "payment_status"),
        @Index(name = "idx_payment_transaction", columnList = "transaction_id")
})
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString(exclude = {"paymentMethod", "order"})
@EqualsAndHashCode(of = "paymentId")
public class Payment {

    @Id
    @Column(name = "payment_id", length = 36)
    @Builder.Default
    private String paymentId = UUID.randomUUID().toString();

    @Column(name = "payment_date")
    private LocalDateTime paymentDate;

    @DecimalMin(value = "0.0", message = "Số tiền không được âm")
    @Column(name = "amount", nullable = false, precision = 10, scale = 2)
    private BigDecimal amount;

    @Enumerated(EnumType.STRING)
    @Column(name = "payment_status", nullable = false, length = 20)
    @Builder.Default
    private PaymentStatus paymentStatus = PaymentStatus.PENDING;

    // Mã giao dịch từ cổng thanh toán (VNPay, Momo, etc.)
    @Column(name = "transaction_id", unique = true, length = 100)
    private String transactionId;

    // Thông tin đơn hàng gửi lên cổng thanh toán
    @Column(name = "order_info", length = 255)
    private String orderInfo;

    // Mã phản hồi từ cổng thanh toán
    @Column(name = "response_code", length = 10)
    private String responseCode;

    // Mã ngân hàng (nếu thanh toán qua ngân hàng)
    @Column(name = "bank_code", length = 20)
    private String bankCode;

    // Thời gian thanh toán thành công từ cổng
    @Column(name = "pay_date")
    private LocalDateTime payDate;

    @Column(name = "client_ip", length = 45)
    private String clientIp;

    @Column(name = "payment_url", columnDefinition = "TEXT")
    private String paymentUrl;

    @Column(name = "failure_reason", length = 500)
    private String failureReason;

    @Column(name = "cancelled_at")
    private LocalDateTime cancelledAt;

    @Builder.Default
    @Column(name = "created_at", nullable = false)
    private LocalDateTime createdAt = LocalDateTime.now();

    @Builder.Default
    @Column(name = "updated_at", nullable = false)
    private LocalDateTime updatedAt = LocalDateTime.now();

    @Column(name = "attempt_count")
    @Builder.Default
    private Integer attemptCount = 1;

    @Column(name = "card_type", length = 20)
    private String cardType;

    @Enumerated(EnumType.STRING)
    @Column(name = "payment_type", length = 20)
    @Builder.Default
    private PaymentType paymentType = PaymentType.PAYMENT;

    @PreUpdate
    protected void onUpdate() {
        this.updatedAt = LocalDateTime.now();
    }


    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "payment_method_id", foreignKey = @ForeignKey(name = "FK_Payment_PaymentMethod"))
    private PaymentMethod paymentMethod;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "order_id", foreignKey = @ForeignKey(name = "FK_Payment_Order"))
    private Order order;

    @Column(name = "parent_payment_id", length = 36)
    private String parentPaymentId;

    public boolean isRefund() {
        return paymentType == PaymentType.REFUND;
    }

    public boolean isChargeback() {
        return paymentType == PaymentType.CHARGEBACK;
    }
}
