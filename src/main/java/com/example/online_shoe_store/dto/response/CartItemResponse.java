package com.example.online_shoe_store.dto.response;

import lombok.*;
import java.math.BigDecimal;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CartItemResponse {
    private String cartItemId;
    private String productId;
    private String productName;
    private String variantId;
    private String size;
    private String color;
    private String imageUrl;
    private BigDecimal price;      // Đơn giá
    private int quantity;          // Số lượng
    private BigDecimal totalPrice; // Số tiền (Đơn giá * Số lượng)
}