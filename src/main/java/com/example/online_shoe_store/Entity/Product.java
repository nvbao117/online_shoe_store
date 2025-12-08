package com.example.online_shoe_store.Entity;

import jakarta.persistence.*;
import lombok.*;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;


@Entity
@Table(name = "products")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Product {

    @Id
    @Column(name = "product_id", length = 36)
    private String productId;

    @Column(name = "name", nullable = false, length = 200)
    private String name;

    @Column(name = "description", columnDefinition = "TEXT")
    private String description;

    @Column(name = "price", nullable = false, precision = 10, scale = 2)
    private BigDecimal price;

    @Column(name = "image_url", length = 500)
    private String imageUrl;

    @Column(name = "status", length = 50)
    private String status; // active, inactive, discontinued

    @Column(name = "created_at", nullable = false, updatable = false)
    private LocalDateTime createdAt;

    @Column(name = "updated_at")
    private LocalDateTime updatedAt;


    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
        updatedAt = LocalDateTime.now();
        if (status == null) {
            status = "active";
        }
        if (productId == null) {
            productId = UUID.randomUUID().toString();
        }
    }

    @PreUpdate
    protected void onUpdate() {
        updatedAt = LocalDateTime.now();
    }

    @OneToMany (mappedBy = "product",
            cascade = CascadeType.ALL,
            fetch = FetchType. LAZY)
    private List<ProductVariant> productvariants = new ArrayList<>();

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn (name = "brand_id", foreignKey = @ForeignKey (name = "FK_Brand_Product"))
    private Brand brand;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn (name = "category_id", foreignKey = @ForeignKey (name = "FK_Category_Product"))
    private Category category;

    @ManyToMany (fetch = FetchType.LAZY)
    @JoinTable(name = "Product_Voucher",
            joinColumns = {@JoinColumn(name = "product_id")},
            inverseJoinColumns = {@JoinColumn(name = "voucher_id")} )
    private List<Voucher> vouchers = new ArrayList<>();


}
