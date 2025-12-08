package com.example.online_shoe_store.Entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.*;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Entity
@Table(name = "payment_methods")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString(exclude = {"payments"})
@EqualsAndHashCode(of = "paymentMethodId")
public class PaymentMethod {

    @Id
    @Column(name = "payment_method_id", length = 36)
    private String paymentMethodId;

    @NotBlank(message = "Tên phương thức thanh toán không được để trống")
    @Size(max = 50, message = "Tên phương thức tối đa 50 ký tự")
    @Column(name = "method_name", nullable = false, length = 50)
    private String methodName;

    @Column(name = "description", length = 255)
    private String description;

    @Column(name = "is_active")
    @Builder.Default
    private Boolean isActive = true;

    @OneToMany(mappedBy = "paymentMethod", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @Builder.Default
    private List<Payment> payments = new ArrayList<>();

    @PrePersist
    public void prePersist() {
        if (paymentMethodId == null) {
            paymentMethodId = UUID.randomUUID().toString();
        }
        if (isActive == null) {
            isActive = true;
        }
    }
}
