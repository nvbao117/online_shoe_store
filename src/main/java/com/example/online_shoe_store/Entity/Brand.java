package com.example.online_shoe_store.Entity;

import jakarta.persistence.*;
import lombok.*;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Entity
@Table(name = "brands")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Brand {
    @Id
    @Column(name = "brand_id", length = 36)
    private String brandId;

    @Column(name = "name", nullable = false, unique = true, length = 100)
    private String name;

    @Column(name = "description", columnDefinition = "TEXT")
    private String description;

    @OneToMany (mappedBy = "brand",
            fetch = FetchType. LAZY)
    private List<Product> products = new ArrayList<>();

    @PrePersist
    public void prePersist() {
        if (brandId == null) {
            brandId = UUID.randomUUID().toString();
        }
    }

    @PreRemove
    public void preRemove() {
        for(Product p : products) {
            p.setBrand(null);
        }
    }
}
