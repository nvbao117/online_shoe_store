package com.example.online_shoe_store.Entity;


import jakarta.persistence.*;
import lombok.*;

import java.math.BigDecimal;
import java.util.UUID;


@Entity
@Table(name = "order_items")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class OrderItem {

    @Id
    @Column(name = "order_item_id", length = 36)
    private String orderItemId;

    @Column(name = "quantity", nullable = false)
    private Integer quantity; // số lượng sản phẩm được đặt

    // 10:số chữ số được lưu trữ , 2 là số chữ số sau dấu phẩy
    @Column(name = "price", nullable = false, precision = 10, scale = 2)
    private BigDecimal price; // Giá tại thời điểm đặt hàng

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "order_id", foreignKey = @ForeignKey(name = "FK_Order_OrderItem"))
    private Order order;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "variant_id", foreignKey = @ForeignKey(name = "FK_VariantProduct_OrderItem"))
    private ProductVariant productvariant;


    @PrePersist
    public void prePersist() {
        if (orderItemId == null) {
            orderItemId = UUID.randomUUID().toString();
        }
    }


}