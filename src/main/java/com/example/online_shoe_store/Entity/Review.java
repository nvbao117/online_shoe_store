package com.example.online_shoe_store.Entity;


import jakarta.persistence.*;
import lombok.*;
import java.time.LocalDateTime;


@Entity
@Table(name = "reviews")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Review {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "review_id")
    private Long reviewId;

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
    }
}
