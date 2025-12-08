package com.example.online_shoe_store.Entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.antlr.v4.runtime.misc.NotNull;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Entity
@Table(name = "cart")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Cart {
    @Id
    @Column(name = "cart_id", length = 36)
    private String cart_id;

    @Column(name = "created_at", nullable = false)
    private LocalDate created_at;

    @PrePersist
    protected void onCreate() {
        if (created_at == null) {
            created_at = LocalDate.now();
        }
        if (cart_id == null) {
            cart_id = UUID.randomUUID().toString();
        }
    }

    @OneToMany (mappedBy = "cart",
            cascade = CascadeType.ALL,
            orphanRemoval = true,
            fetch = FetchType. LAZY)
    private List<CartItem> cart_items = new ArrayList<>();

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id",
            nullable = false,
            unique = true,
            foreignKey = @ForeignKey(name = "FK_User_Cart"))
    private User user;




}
