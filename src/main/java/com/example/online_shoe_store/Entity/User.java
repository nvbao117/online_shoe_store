package com.example.online_shoe_store.Entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Entity
@Table(name = "users")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
    @Id
    @Column(name = "user_id", length = 36)
    private String user_id;
    @Column(name = "username")
    private String username;
    @Column(name = "password")
    private String password;
    @Column(name = "email")
    private String email;
    @Column(name = "phone")
    private String phone;
    @Column(name = "name")
    private String name;
    @Column(name = "created_at")
    private LocalDate created_at;
    @Column(name = "is_active")
    private Boolean is_active;
    @Column(name = "user_rank")
    private String user_rank;
    @Enumerated(EnumType.STRING)
    @Column(name = "role", nullable = false, length = 20)
    private Role role = Role.USER;
    public enum Role {
        USER, ADMIN
    }
    @PrePersist
    protected void onCreate() {
        created_at = LocalDate.now();
        if (user_id == null) {
            user_id = UUID.randomUUID().toString();
        }
        if (this.cart == null) {
            Cart newCart = new Cart();
            newCart.setUser(this);
            this.cart = newCart;
        }
    }
    @OneToMany (mappedBy = "user",
            cascade = CascadeType.ALL,
            fetch = FetchType. LAZY)
    private List<Order> orders = new ArrayList<>();

    @OneToMany (mappedBy = "user",
            cascade = CascadeType.ALL,
            fetch = FetchType. LAZY)
    private List<ShipDetail> shipdetails = new ArrayList<>();

    @ManyToMany (fetch = FetchType.LAZY)
    @JoinTable(name = "User_Voucher",
            joinColumns = {@JoinColumn(name = "user_id")},
            inverseJoinColumns = {@JoinColumn(name = "voucher_id")} )
    private List<Voucher> vouchers = new ArrayList<>();

    @OneToOne(mappedBy = "user", cascade = CascadeType.ALL, orphanRemoval = true)   // trỏ ngược về tên biến bên User
    private Cart cart;
    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL, fetch = FetchType.LAZY, orphanRemoval = true)
    private List<Review> reviews = new ArrayList<>();


}
