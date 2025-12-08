package com.example.online_shoe_store.Entity;


import jakarta.persistence.*;
import lombok.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;


@Entity
@Table(name = "reviews")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Review {

    @Id
    @Column(name = "review_id", length = 36)
    private String reviewId;

    @Column(name = "rating", nullable = false)
    private Integer rating; // 1-5 stars

    @Column(name = "comment", columnDefinition = "TEXT")
    private String comment;

    @Column(name = "review_date", nullable = false)
    private LocalDateTime reviewDate;

    @Column(name = "is_active")
    private Boolean isActive; // Để admin có thể ẩn review không phù hợp

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

    @OneToMany (mappedBy = "review",
            cascade = CascadeType.ALL,
            fetch = FetchType. LAZY)
    private List<ReviewImage> review_images = new ArrayList<>();
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "variant_id", foreignKey = @ForeignKey(name = "FK_Variant_Review"))
    private ProductVariant productvariant;


    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id", foreignKey = @ForeignKey(name = "FK_User_Review"))
    private User user;


}
