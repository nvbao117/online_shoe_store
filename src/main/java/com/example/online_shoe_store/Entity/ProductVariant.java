package com.example.online_shoe_store.Entity;

import jakarta.persistence.*;
import lombok.*;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Entity
@Table(name = "product_variants")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ProductVariant {

    @Id
    @Column(name = "variant_id", length = 36)
    private String variantId;

    @Column(name = "size", nullable = false, length = 10)
    private String size;

    @Column(name = "color", nullable = false, length = 50)
    private String color;

    @Column(name = "stock", nullable = false)
    private Integer stock;

    @Column(name = "image_url", length = 500)
    private String imageUrl;

    @OneToMany (mappedBy = "productvariant",
            cascade = CascadeType.ALL,
            fetch = FetchType. LAZY)
    private List<OrderItem> orderitems = new ArrayList<>();

    @OneToMany (mappedBy = "productvariant",
            cascade = CascadeType.ALL,
            fetch = FetchType. LAZY)
    private List<Review> reviews = new ArrayList<>();

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "product_id", foreignKey = @ForeignKey(name = "FK_ProductVariant_Product"))
    private Product product;

    @OneToOne(mappedBy = "productvariant", cascade = CascadeType.ALL, orphanRemoval = true)   // trỏ ngược về tên biến bên User
    private CartItem cartitem;


    @PrePersist
    public void prePersist() {
        if (variantId == null) {
            variantId = UUID.randomUUID().toString();
        }
    }




}
