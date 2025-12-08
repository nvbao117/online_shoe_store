package com.example.online_shoe_store.Entity;

import com.example.online_shoe_store.Entity.enums.PaymentStatus;
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
    private String paymentId;

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

    @PrePersist
    protected void onCreate() {
        if (paymentStatus == null) {
            paymentStatus = PaymentStatus.PENDING;
        }
        if (paymentId == null) {
            paymentId = UUID.randomUUID().toString();
        }
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "payment_method_id", foreignKey = @ForeignKey(name = "FK_Payment_PaymentMethod"))
    private PaymentMethod paymentMethod;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "order_id", unique = true, foreignKey = @ForeignKey(name = "FK_Payment_Order"))
    private Order order;
}
