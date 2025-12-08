package com.example.online_shoe_store.Entity;


import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.UUID;

@Entity
@Table(name = "cart_items")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class CartItem {
    @Id
    @Column(name = "cart_item_id", length = 36, nullable = false, updatable = false)
    private String cart_item_id;
    @Column(name = "quantity", nullable = false)
    private Integer quantity;

    @PrePersist
    protected void onCreate() {
        if (cart_item_id == null) {
            cart_item_id = UUID.randomUUID().toString();
        }
    }

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn (name = "cart_id",
            nullable = false,
            foreignKey = @ForeignKey(name = "FK_Cart_CartItems")
    )
    Cart cart;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "variant_id",
            nullable = false,
            foreignKey = @ForeignKey(name = "FK_CartItem_ProductVariant"))
    private ProductVariant productvariant;

}
