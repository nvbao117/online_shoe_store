package com.example.online_shoe_store.Entity;

import com.example.online_shoe_store.Entity.enums.DiscountType;
import jakarta.persistence.*;
import jakarta.validation.constraints.*;
import lombok.*;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Entity
@Table(name = "voucher", indexes = {
        @Index(name = "idx_voucher_code", columnList = "code"),
        @Index(name = "idx_voucher_status", columnList = "status"),
        @Index(name = "idx_voucher_dates", columnList = "start_date, end_date")
})
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString(exclude = {"products", "orders", "users"})
@EqualsAndHashCode(of = "voucherId")
public class Voucher {

    @Id
    @Column(name = "voucher_id", length = 36)
    private String voucherId;

    @NotBlank(message = "Mã voucher không được để trống")
    @Size(max = 50, message = "Mã voucher tối đa 50 ký tự")
    @Column(name = "code", nullable = false, unique = true, length = 50)
    private String code;

    @NotBlank(message = "Tên voucher không được để trống")
    @Size(max = 100, message = "Tên voucher tối đa 100 ký tự")
    @Column(name = "name", nullable = false, length = 100)
    private String name;

    @Column(name = "description", columnDefinition = "TEXT")
    private String description;

    @Enumerated(EnumType.STRING)
    @Column(name = "discount_type", nullable = false, length = 20)
    @Builder.Default
    private DiscountType discountType = DiscountType.PERCENTAGE;

    @DecimalMin(value = "0.0", inclusive = false, message = "Giá trị giảm phải lớn hơn 0")
    @Column(name = "discount_value", nullable = false, precision = 10, scale = 2)
    private BigDecimal discountValue;

    @DecimalMin(value = "0.0", message = "Giá trị đơn hàng tối thiểu không được âm")
    @Column(name = "min_order_value", precision = 10, scale = 2)
    @Builder.Default
    private BigDecimal minOrderValue = BigDecimal.ZERO;

    @Column(name = "max_discount_value", precision = 10, scale = 2)
    private BigDecimal maxDiscountValue;

    @Size(max = 50, message = "Loại áp dụng tối đa 50 ký tự")
    @Column(name = "applies_to_type", length = 50)
    private String appliesToType; // all, category, product

    @Size(max = 50, message = "Loại khách hàng tối đa 50 ký tự")
    @Column(name = "customer_type", length = 50)
    private String customerType; // all, new, vip

    @Column(name = "usage_limit")
    private Integer usageLimit;

    @Column(name = "used_count")
    @Builder.Default
    private Integer usedCount = 0;

    @NotNull(message = "Ngày bắt đầu không được để trống")
    @Column(name = "start_date", nullable = false)
    private LocalDateTime startDate;

    @NotNull(message = "Ngày kết thúc không được để trống")
    @Column(name = "end_date", nullable = false)
    private LocalDateTime endDate;

    @Size(max = 20, message = "Trạng thái tối đa 20 ký tự")
    @Column(name = "status", length = 20)
    @Builder.Default
    private String status = "active";

    @Column(name = "created_by", length = 36)
    private String createdBy;

    @Column(name = "created_at", nullable = false, updatable = false)
    private LocalDateTime createdAt;

    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
        if (voucherId == null) {
            voucherId = UUID.randomUUID().toString();
        }
        if (status == null) {
            status = "active";
        }
        if (discountType == null) {
            discountType = DiscountType.PERCENTAGE;
        }
        if (usedCount == null) {
            usedCount = 0;
        }
        if (minOrderValue == null) {
            minOrderValue = BigDecimal.ZERO;
        }
    }

    @ManyToMany(mappedBy = "vouchers", fetch = FetchType.LAZY)
    @Builder.Default
    private List<Product> products = new ArrayList<>();

    @ManyToMany(mappedBy = "vouchers", fetch = FetchType.LAZY)
    @Builder.Default
    private List<Order> orders = new ArrayList<>();

    @ManyToMany(mappedBy = "vouchers", fetch = FetchType.LAZY)
    @Builder.Default
    private List<User> users = new ArrayList<>();
}
