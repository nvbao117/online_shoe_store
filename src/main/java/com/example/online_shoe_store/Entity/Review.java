package com.example.online_shoe_store.Entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.Size;
import lombok.*;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Entity
@Table(name = "reviews", indexes = {
        @Index(name = "idx_review_user", columnList = "user_id"),
        @Index(name = "idx_review_variant", columnList = "variant_id"),
        @Index(name = "idx_review_rating", columnList = "rating"),
        @Index(name = "idx_review_date", columnList = "review_date")
})
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString(exclude = {"reviewImages", "productVariant", "user"})
@EqualsAndHashCode(of = "reviewId")
public class Review {

    @Id
    @Column(name = "review_id", length = 36)
    private String reviewId;

    @Min(value = 1, message = "Rating tối thiểu là 1")
    @Max(value = 5, message = "Rating tối đa là 5")
    @Column(name = "rating", nullable = false)
    private Integer rating;

    @Size(max = 2000, message = "Bình luận tối đa 2000 ký tự")
    @Column(name = "comment", columnDefinition = "TEXT")
    private String comment;

    @Column(name = "review_date", nullable = false, updatable = false)
    private LocalDateTime reviewDate;

    @Column(name = "is_active")
    @Builder.Default
    private Boolean isActive = true;

    @PrePersist
    protected void onCreate() {
        reviewDate = LocalDateTime.now();
        if (isActive == null) {
            isActive = true;
        }
        if (reviewId == null) {
            reviewId = UUID.randomUUID().toString();
        }
    }

    @OneToMany(mappedBy = "review", cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.LAZY)
    @Builder.Default
    private List<ReviewImage> reviewImages = new ArrayList<>();

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "variant_id", foreignKey = @ForeignKey(name = "FK_Variant_Review"))
    private ProductVariant productVariant;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id", nullable = false, foreignKey = @ForeignKey(name = "FK_User_Review"))
    private User user;
}
