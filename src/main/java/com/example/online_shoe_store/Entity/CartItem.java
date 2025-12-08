package com.example.online_shoe_store.Entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.Min;
import lombok.*;

import java.time.LocalDateTime;
import java.util.UUID;

@Entity
@Table(name = "cart_items", indexes = {
        @Index(name = "idx_cartitem_cart", columnList = "cart_id"),
        @Index(name = "idx_cartitem_variant", columnList = "variant_id")
})
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString(exclude = {"cart", "productVariant"})
@EqualsAndHashCode(of = "cartItemId")
public class CartItem {

    @Id
    @Column(name = "cart_item_id", length = 36, nullable = false, updatable = false)
    private String cartItemId;

    @Min(value = 1, message = "Số lượng phải ít nhất là 1")
    @Column(name = "quantity", nullable = false)
    @Builder.Default
    private Integer quantity = 1;

    @Column(name = "added_at", nullable = false, updatable = false)
    private LocalDateTime addedAt;

    @PrePersist
    protected void onCreate() {
        if (cartItemId == null) {
            cartItemId = UUID.randomUUID().toString();
        }
        if (addedAt == null) {
            addedAt = LocalDateTime.now();
        }
        if (quantity == null) {
            quantity = 1;
        }
    }

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "cart_id", nullable = false, foreignKey = @ForeignKey(name = "FK_Cart_CartItem"))
    private Cart cart;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "variant_id", nullable = false, foreignKey = @ForeignKey(name = "FK_CartItem_ProductVariant"))
    private ProductVariant productVariant;
}
