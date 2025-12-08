package com.example.online_shoe_store.Entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.*;

import java.util.UUID;

@Entity
@Table(name = "review_images")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString(exclude = {"review"})
@EqualsAndHashCode(of = "imageId")
public class ReviewImage {

    @Id
    @Column(name = "image_id", length = 36)
    private String imageId;

    @NotBlank(message = "URL hình ảnh không được để trống")
    @Size(max = 500, message = "URL tối đa 500 ký tự")
    @Column(name = "image_url", nullable = false, length = 500)
    private String imageUrl;

    @Column(name = "alt_text", length = 200)
    private String altText;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "review_id", nullable = false, foreignKey = @ForeignKey(name = "FK_Review_ReviewImage"))
    private Review review;

    @PrePersist
    public void prePersist() {
        if (imageId == null) {
            imageId = UUID.randomUUID().toString();
        }
    }
}
