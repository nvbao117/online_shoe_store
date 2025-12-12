package com.example.online_shoe_store.Entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.*;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Entity
@Table(name = "categories", indexes = {
        @Index(name = "idx_category_name", columnList = "name")
})
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString(exclude = {"products", "brands"})
@EqualsAndHashCode(of = "categoryId")
public class Category {

    @Id
    @Column(name = "category_id", length = 36)
    private String categoryId;

    @NotBlank(message = "Tên danh mục không được để trống")
    @Size(max = 100, message = "Tên danh mục tối đa 100 ký tự")
    @Column(name = "name", nullable = false, unique = true, length = 100)
    private String name;

    @Column(name = "description", columnDefinition = "TEXT")
    private String description;

    @Column(name = "image_url", length = 500)
    private String imageUrl;

    @Column(name = "is_active")
    @Builder.Default
    private Boolean isActive = true;

    @Column(name = "created_at", nullable = false, updatable = false)
    private LocalDateTime createdAt;

    @OneToMany(mappedBy = "category", fetch = FetchType.LAZY)
    @Builder.Default
    private List<Product> products = new ArrayList<>();

    // NEW: một Category có nhiều Brand
    @OneToMany(mappedBy = "category", fetch = FetchType.LAZY)
    @Builder.Default
    private List<Brand> brands = new ArrayList<>();

    @PrePersist
    public void prePersist() {
        if (categoryId == null) {
            categoryId = UUID.randomUUID().toString();
        }
        if (createdAt == null) {
            createdAt = LocalDateTime.now();
        }
        if (isActive == null) {
            isActive = true;
        }
    }

    // NEW: khi xóa Category, set null cho category trong các Brand liên quan
    @PreRemove
    public void preRemove() {
        for (Brand b : brands) {
            b.setCategory(null);
        }
        // nếu muốn cũng có thể null các product.category khi xóa category
        for (Product p : products) {
            p.setCategory(null);
        }
    }
}