package com.example.online_shoe_store.Entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import lombok.*;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Entity
@Table(name = "ship_details", indexes = {
        @Index(name = "idx_shipdetail_user", columnList = "user_id"),
        @Index(name = "idx_shipdetail_phone", columnList = "phone")
})
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString(exclude = {"user", "orders"})
@EqualsAndHashCode(of = "shipDetailId")
public class ShipDetail {

    @Id
    @Column(name = "ship_detail_id", length = 36)
    private String shipDetailId;

    @NotBlank(message = "Tên người nhận không được để trống")
    @Size(max = 100, message = "Tên người nhận tối đa 100 ký tự")
    @Column(name = "recipient_name", nullable = false, length = 100)
    private String recipientName;

    @NotBlank(message = "Số điện thoại không được để trống")
    @Pattern(regexp = "^[0-9]{10,11}$", message = "Số điện thoại phải có 10-11 chữ số")
    @Column(name = "phone", nullable = false, length = 15)
    private String phone;

    @NotBlank(message = "Tỉnh/Thành phố không được để trống")
    @Size(max = 100, message = "Tên tỉnh/thành phố tối đa 100 ký tự")
    @Column(name = "province", nullable = false, length = 100)
    private String province;

    @NotBlank(message = "Quận/Huyện không được để trống")
    @Size(max = 100, message = "Tên quận/huyện tối đa 100 ký tự")
    @Column(name = "district", nullable = false, length = 100)
    private String district;

    @NotBlank(message = "Phường/Xã không được để trống")
    @Size(max = 100, message = "Tên phường/xã tối đa 100 ký tự")
    @Column(name = "ward", nullable = false, length = 100)
    private String ward;

    @Size(max = 255, message = "Địa chỉ chi tiết tối đa 255 ký tự")
    @Column(name = "detail", length = 255)
    private String detail;

    @Column(name = "is_default")
    @Builder.Default
    private Boolean isDefault = false;

    @Column(name = "created_at", nullable = false, updatable = false)
    private LocalDateTime createdAt;

    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
        if (shipDetailId == null) {
            shipDetailId = UUID.randomUUID().toString();
        }
        if (isDefault == null) {
            isDefault = false;
        }
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id", nullable = false, foreignKey = @ForeignKey(name = "FK_ShipDetail_User"))
    private User user;

    @OneToMany(mappedBy = "shipDetail", fetch = FetchType.LAZY)
    @Builder.Default
    private List<Order> orders = new ArrayList<>();
}
