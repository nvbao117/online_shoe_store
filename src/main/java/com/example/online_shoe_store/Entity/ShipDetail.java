package com.example.online_shoe_store.Entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Entity
@Table(name = "ship_details")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ShipDetail {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long ship_detail_id;
    private String recipient_name;
    private String phone;
    private String province;
    private String district;
    private String ward;
    private String detail ;
    private LocalDateTime created_at;
}
