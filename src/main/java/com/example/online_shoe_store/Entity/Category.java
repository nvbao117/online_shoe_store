package com.example.online_shoe_store.Entity;


import jakarta.persistence.*;
import lombok.*;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Entity
@Table(name = "categories")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Category {

    @Id
    @Column(name = "category_id", length = 36)
    private String categoryId;

    @Column(name = "name", nullable = false, unique = true, length = 100)
    private String name;

    //Mặc định trong Java, kiểu String được hibernate map sang varchar(255) , nên chỉ chứa tối đa 255 ký tự
    //Thuộc tính columnDefinition="TEXT" ép database sử dụng kiểu text thay vì varchar
    @Column(name = "description", columnDefinition = "TEXT")
    private String description;

    @OneToMany (mappedBy = "category",
            fetch = FetchType. LAZY
    )
    private List<Product> products = new ArrayList <>();


    @PrePersist
    public void prePersist() {
        if (categoryId == null) {
            categoryId = UUID.randomUUID().toString();
        }
    }
}
