package com.example.online_shoe_store.Entity;


import jakarta.persistence.*;
import lombok.*;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Entity
@Table(name = "orders")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Order {

    @Id
    @Column(name = "order_id", length = 36)
    private String orderId;


    @Column(name = "total_amount", nullable = false, precision = 10, scale = 2)
    private BigDecimal totalAmount;

    @Column(name = "status", nullable = false, length = 50)
    private String status; // pending, processing, shipped, delivered, cancelled

    @Column(name = "order_date", nullable = false)
    private LocalDateTime orderDate;

    @Column(name = "shipping_fee", precision = 10, scale = 2)
    private BigDecimal shippingFee;


    //Trước khi mày thực hiện lệnh INSERT dòng dữ liệu này vào Database,chạy hàm onCreate()
    @PrePersist
    protected void onCreate() {
        orderDate = LocalDateTime.now();
        if (status == null) {
            status = "pending";
        }
        if (orderId == null) {
            orderId = UUID.randomUUID().toString();
        }
    }

    @OneToMany (mappedBy = "order",
            cascade = CascadeType.ALL,
            fetch = FetchType. LAZY)
    private List<OrderItem> orderitems = new ArrayList<>();

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id", foreignKey = @ForeignKey(name = "FK_Order_User"))
    private User user;

    @ManyToMany (fetch = FetchType.LAZY)
    @JoinTable(name = "Order_Voucher",
            joinColumns = {@JoinColumn(name = "order_id")},
            inverseJoinColumns = {@JoinColumn(name = "voucher_id")} )
    private List<Voucher> vouchers = new ArrayList<>();


    @OneToOne(mappedBy = "order", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private Payment payment;


}
