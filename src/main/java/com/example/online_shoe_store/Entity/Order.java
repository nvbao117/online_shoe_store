package com.example.online_shoe_store.Entity;

import com.example.online_shoe_store.Entity.enums.OrderStatus;
import jakarta.persistence.*;
import jakarta.validation.constraints.DecimalMin;
import lombok.*;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Entity
@Table(name = "orders", indexes = {
        @Index(name = "idx_order_user", columnList = "user_id"),
        @Index(name = "idx_order_status", columnList = "status"),
        @Index(name = "idx_order_date", columnList = "order_date")
})
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString(exclude = {"orderItems", "user", "vouchers", "payment", "shipDetail"})
@EqualsAndHashCode(of = "orderId")
public class Order {

    @Id
    @Column(name = "order_id", length = 36)
    private String orderId;

    @DecimalMin(value = "0.0", message = "Tổng tiền không được âm")
    @Column(name = "total_amount", nullable = false, precision = 10, scale = 2)
    private BigDecimal totalAmount;

    @Enumerated(EnumType.STRING)
    @Column(name = "status", nullable = false, length = 20)
    @Builder.Default
    private OrderStatus status = OrderStatus.PENDING;

    @Column(name = "order_date", nullable = false, updatable = false)
    private LocalDateTime orderDate;

    @DecimalMin(value = "0.0", message = "Phí vận chuyển không được âm")
    @Column(name = "shipping_fee", precision = 10, scale = 2)
    @Builder.Default
    private BigDecimal shippingFee = BigDecimal.ZERO;

    @PrePersist
    protected void onCreate() {
        orderDate = LocalDateTime.now();
        if (status == null) {
            status = OrderStatus.PENDING;
        }
        if (orderId == null) {
            orderId = UUID.randomUUID().toString();
        }
        if (shippingFee == null) {
            shippingFee = BigDecimal.ZERO;
        }
    }

    @OneToMany(mappedBy = "order", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @Builder.Default
    private List<OrderItem> orderItems = new ArrayList<>();

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id", foreignKey = @ForeignKey(name = "FK_Order_User"))
    private User user;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ship_detail_id", foreignKey = @ForeignKey(name = "FK_Order_ShipDetail"))
    private ShipDetail shipDetail;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "Order_Voucher",
            joinColumns = {@JoinColumn(name = "order_id")},
            inverseJoinColumns = {@JoinColumn(name = "voucher_id")})
    @Builder.Default
    private List<Voucher> vouchers = new ArrayList<>();

    @OneToOne(mappedBy = "order", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private Payment payment;
}
