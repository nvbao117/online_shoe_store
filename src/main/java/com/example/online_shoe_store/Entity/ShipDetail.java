package com.example.online_shoe_store.Entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.UUID;

@Entity
@Table(name = "ship_details")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ShipDetail {
    @Id
    @Column(name = "ship_detail_id", length = 36)
    private String ship_detail_id;
    @Column(name = "recipient_name")
    private String recipient_name;
    @Column(name = "phone")
    private String phone;
    @Column(name = "province")
    private String province;
    @Column(name = "district")
    private String district;
    @Column(name = "ward")
    private String ward;
    @Column(name = "detail")
    private String detail ;
    @Column(name = "created_at")
    private LocalDateTime created_at;
    @PrePersist
    protected void onCreate() {
        created_at = LocalDateTime.now();
        if (ship_detail_id == null) {
            ship_detail_id = UUID.randomUUID().toString();
        }
    }

    @ManyToOne(fetch = FetchType. LAZY)
    @JoinColumn (name = "user_id",
            foreignKey = @ForeignKey (name = "FK_ShipDetail_User"))
    private User user;

}
