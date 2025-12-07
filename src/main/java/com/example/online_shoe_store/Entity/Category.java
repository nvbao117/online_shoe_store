package com.example.online_shoe_store.Entity;


import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "categories")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Category {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "category_id")
    private Long categoryId;

    @Column(name = "name", nullable = false, unique = true, length = 100)
    private String name;

    //Mặc định trong Java, kiểu String được hibernate map sang varchar(255) , nên chỉ chứa tối đa 255 ký tự
    //Thuộc tính columnDefinition="TEXT" ép database sử dụng kiểu text thay vì varchar
    @Column(name = "description", columnDefinition = "TEXT")
    private String description;
}
