package com.example.online_shoe_store.Entity;

import com.example.online_shoe_store.Entity.enums.Role;
import jakarta.persistence.*;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import lombok.*;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Entity
@Table(name = "users", indexes = {
        @Index(name = "idx_user_email", columnList = "email"),
        @Index(name = "idx_user_username", columnList = "username"),
        @Index(name = "idx_user_phone", columnList = "phone")
})
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString(exclude = {"orders", "cart", "vouchers", "shipDetails", "reviews"})
public class User {
    
    @Id
    @Column(name = "user_id", length = 36)
    private String userId;

    @NotBlank(message = "Username không được để trống")
    @Size(min = 3, max = 50, message = "Username phải từ 3-50 ký tự")
    @Column(name = "username", nullable = false, unique = true, length = 50)
    private String username;

    @NotBlank(message = "Password không được để trống")
    @Column(name = "password", nullable = false)
    private String password;

    @Email(message = "Email không hợp lệ")
    @NotBlank(message = "Email không được để trống")
    @Column(name = "email", nullable = false, unique = true, length = 100)
    private String email;

    @Pattern(regexp = "^[0-9]{10,11}$", message = "Số điện thoại phải có 10-11 chữ số")
    @Column(name = "phone", length = 15)
    private String phone;

    @Column(name = "name", length = 100)
    private String name;

    @Column(name = "created_at", nullable = false, updatable = false)
    private LocalDateTime createdAt;

    @Column(name = "is_active")
    @Builder.Default
    private Boolean isActive = true;

    @Column(name = "user_rank", length = 20)
    private String userRank;

    @Enumerated(EnumType.STRING)
    @Column(name = "role", nullable = false, length = 20)
    @Builder.Default
    private Role role = Role.USER;

    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
        if (userId == null) {
            userId = UUID.randomUUID().toString();
        }
        if (isActive == null) {
            isActive = true;
        }
        if (role == null) {
            role = Role.USER;
        }
        if (this.cart == null) {
            Cart newCart = new Cart();
            newCart.setUser(this);
            this.cart = newCart;
        }
    }

    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @Builder.Default
    private List<Order> orders = new ArrayList<>();

    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @Builder.Default
    private List<ShipDetail> shipDetails = new ArrayList<>();

    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @Builder.Default
    private List<Review> reviews = new ArrayList<>();

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "User_Voucher",
            joinColumns = {@JoinColumn(name = "user_id")},
            inverseJoinColumns = {@JoinColumn(name = "voucher_id")})
    @Builder.Default
    private List<Voucher> vouchers = new ArrayList<>();

    @OneToOne(mappedBy = "user", cascade = CascadeType.ALL, orphanRemoval = true)
    private Cart cart;
}
