package com.example.online_shoe_store.Entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.UUID;

@Entity
@Table(name = "review_images")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReviewImage {
    @Id
    @Column(name = "image_id", length = 36)
    private String image_id ;
    @Column(name = "image_url")
    private String image_url;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "review_id", foreignKey = @ForeignKey(name = "FK_Review_ReviewImage"))
    private Review review;

    @PrePersist
    public void prePersist() {
        if (image_id == null) {
            image_id = UUID.randomUUID().toString();
        }
    }
}
