package com.example.online_shoe_store.Entity;

import jakarta.persistence.*;
import lombok.*;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.UUID;


@Entity
@Table(name = "payments")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Payment {

    @Id
    @Column(name = "payment_id", length = 36)
    private String paymentId;

    @Column(name = "payment_date")
    private LocalDateTime paymentDate;

    @Column(name = "amount", nullable = false, precision = 10, scale = 2)
    private BigDecimal amount;

    @Column(name = "payment_status", nullable = false, length = 50)
    private String paymentStatus; // pending, completed, failed, refunded


    //thanh toán qua VNPay, Momo,
    //cổng thanh toán sẽ trả về một chuỗi mã duy nhất (ví dụ: PAY-12345ABC).
    @Column(name = "transaction_id", unique = true, length = 100)
    private String transactionId;


    @PrePersist
    protected void onCreate() {
        if (paymentStatus == null) {
            paymentStatus = "pending";
        }
        if (paymentId == null) {
            paymentId = UUID.randomUUID().toString();
        }
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "payment_method_id ", foreignKey = @ForeignKey(name = "FK_Payment_PaymentMethod"))
    private PaymentMethod paymentmethod;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "order_id")   // khóa ngoại nằm trên bảng User
    private Order order;





}
