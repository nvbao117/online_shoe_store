package com.example.online_shoe_store.Entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;
import java.util.UUID;

@Entity
@Table(name = "payment_methods")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class PaymentMethod {
    @Id
    @Column(name = "payment_method_id", length = 36)
    private String payment_method_id;
    @Column(name = "method_name")
    private String method_name ;

    @OneToMany(mappedBy = "paymentmethod",
            cascade = CascadeType.ALL,
            fetch = FetchType.LAZY
    )
    private List<Payment> payments;

    @PrePersist
    public void prePersist() {
        if (payment_method_id == null) {
            payment_method_id = UUID.randomUUID().toString();
        }
    }
}
