package com.example.online_shoe_store.Entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.*;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Entity
@Table(name = "product_variants", indexes = {
        @Index(name = "idx_variant_product", columnList = "product_id"),
        @Index(name = "idx_variant_size_color", columnList = "size, color")
})
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString(exclude = {"orderItems", "reviews", "product", "cartItems"})
@EqualsAndHashCode(of = "variantId")
public class ProductVariant {

    @Id
    @Column(name = "variant_id", length = 36)
    private String variantId;

    @NotBlank(message = "Size không được để trống")
    @Size(max = 10, message = "Size tối đa 10 ký tự")
    @Column(name = "size", nullable = false, length = 10)
    private String size;

    @NotBlank(message = "Màu sắc không được để trống")
    @Size(max = 50, message = "Màu sắc tối đa 50 ký tự")
    @Column(name = "color", nullable = false, length = 50)
    private String color;

    @Min(value = 0, message = "Số lượng tồn kho không được âm")
    @Column(name = "stock", nullable = false)
    @Builder.Default
    private Integer stock = 0;

    @Column(name = "image_url", length = 500)
    private String imageUrl;

    @OneToMany(mappedBy = "productVariant", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @Builder.Default
    private List<OrderItem> orderItems = new ArrayList<>();

    @OneToMany(mappedBy = "productVariant", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @Builder.Default
    private List<Review> reviews = new ArrayList<>();

    @OneToMany(mappedBy = "productVariant", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @Builder.Default
    private List<CartItem> cartItems = new ArrayList<>();

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "product_id", foreignKey = @ForeignKey(name = "FK_ProductVariant_Product"))
    private Product product;

    @PrePersist
    public void prePersist() {
        if (variantId == null) {
            variantId = UUID.randomUUID().toString();
        }
        if (stock == null) {
            stock = 0;
        }
    }
}
