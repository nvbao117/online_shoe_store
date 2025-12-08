package com.example.online_shoe_store.Entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Entity
@Table(name = "voucher")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Voucher {
    @Id
    @Column(name = "voucher_id", length = 36)
    private String voucher_id;

    @Column(nullable = false, unique = true, length = 50, name = "code")
    private String code;
    @Column(name = "name")
    private String name;

    @Column(columnDefinition = "TEXT", name = "description")
    private String description;

    @Column(name = "discount_type")
    private String discount_type;
    @Column(name = "discount_value")
    private Double discount_value;
    @Column(name = "min_order_value")
    private Double min_order_value;
    @Column(name = "max_discount_value")
    private Double max_discount_value;
    @Column(name = "applies_to_type")
    private String applies_to_type;
    @Column(name = "customer_type")
    private String customer_type;
    @Column(name = "start_date")
    private LocalDateTime start_date;
    @Column(name = "end_date")
    private LocalDateTime end_date;
    @Column(name = "status")
    private String status;
    @Column(name = "created_by")
    private String created_by;
    @Column(name = "created_at")
    private LocalDateTime created_at;

    @PrePersist
    protected void onCreate() {
        created_at = LocalDateTime.now();
        if (voucher_id == null) {
            voucher_id = UUID.randomUUID().toString();
        }
        if (status == null) status = "active";

    }

    @ManyToMany (fetch = FetchType.LAZY)
    @JoinTable(name = "Product_Voucher",
            joinColumns = {@JoinColumn(name = "voucher_id")},
            inverseJoinColumns = {@JoinColumn(name = "product_id")} )
    private List<Product> products = new ArrayList<>();

    @ManyToMany (fetch = FetchType.LAZY)
    @JoinTable(name = "Order_Voucher",
            joinColumns = {@JoinColumn(name = "voucher_id")},
            inverseJoinColumns = {@JoinColumn(name = "order_id")} )
    private List<Order> orders = new ArrayList<>();

    @ManyToMany (fetch = FetchType.LAZY)
    @JoinTable(name = "User_Voucher",
            joinColumns = {@JoinColumn(name = "voucher_id")},
            inverseJoinColumns = {@JoinColumn(name = "user_id")} )
    private List<User> users = new ArrayList<>();




}
