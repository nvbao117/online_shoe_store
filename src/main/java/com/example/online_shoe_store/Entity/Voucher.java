package com.example.online_shoe_store.Entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Entity
@Table(name = "voucher")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Voucher {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long voucher_id;

    @Column(nullable = false, unique = true, length = 50)
    private String code;

    private String name;

    @Column(columnDefinition = "TEXT")
    private String description;

    private String discount_type;

    private Double discount_value;

    private Double min_order_value;

    private Double max_discount_value;

    private String applies_to_type;

    private String customer_type;

    private LocalDateTime start_date;

    private LocalDateTime end_date;

    private String status;

    private String created_by;

    private LocalDateTime created_at;



}
