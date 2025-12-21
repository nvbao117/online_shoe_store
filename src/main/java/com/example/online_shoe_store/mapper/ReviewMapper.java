package com.example.online_shoe_store.mapper;

import com.example.online_shoe_store.Entity.Order;
import com.example.online_shoe_store.Entity.OrderItem;
import com.example.online_shoe_store.Entity.Review;
import com.example.online_shoe_store.Entity.ReviewImage;
import com.example.online_shoe_store.dto.response.PendingReviewResponse;
import com.example.online_shoe_store.dto.response.ReviewResponse;
import org.mapstruct.*;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Mapper(componentModel = "spring")
public interface ReviewMapper {

    /**
     * Map Review entity sang ReviewResponse DTO
     */
    @Mapping(target = "variantId", source = "productVariant.variantId")
    @Mapping(target = "productName", source = "productVariant.product.name", defaultValue = "Sản phẩm")
    @Mapping(target = "variantColor", source = "productVariant.color", defaultValue = "")
    @Mapping(target = "variantSize", source = "productVariant.size", defaultValue = "")
    @Mapping(target = "productImage", source = "productVariant.imageUrl", qualifiedByName = "formatImageUrl")
    @Mapping(target = "imageUrls", source = "reviewImages", qualifiedByName = "mapReviewImages")
    @Mapping(target = "username", source = "user.username", defaultValue = "Ẩn danh")
    ReviewResponse toReviewResponse(Review review);

    /**
     * Map danh sách Review sang danh sách ReviewResponse
     */
    List<ReviewResponse> toReviewResponseList(List<Review> reviews);

    /**
     * Helper method: Map OrderItem và Order
     */
    default PendingReviewResponse mapToPendingReview(OrderItem item, Order order) {
        if (item == null || order == null) {
            return null;
        }

        String productImage = "/images/placeholder.png";
        if (item.getProductVariant() != null && item.getProductVariant().getImageUrl() != null) {
            productImage = item.getProductVariant().getImageUrl();
            if (productImage.startsWith("src/data")) {
                productImage = productImage.replace("src/data", "");
            }
        }

        return PendingReviewResponse.builder()
                .orderItemId(item.getOrderItemId())
                .orderId(order.getOrderId())
                .variantId(item.getProductVariant() != null ? item.getProductVariant().getVariantId() : null)
                .productName(item.getProductVariant() != null && item.getProductVariant().getProduct() != null
                        ? item.getProductVariant().getProduct().getName()
                        : "Sản phẩm")
                .variantColor(item.getProductVariant() != null ? item.getProductVariant().getColor() : "")
                .variantSize(item.getProductVariant() != null ? item.getProductVariant().getSize() : "")
                .productImage(productImage)
                .deliveredDate(order.getDeliveredAt())
                .build();
    }

    /**
     * Format image URL - xử lý path legacy
     */
    @Named("formatImageUrl")
    default String formatImageUrl(String imageUrl) {
        if (imageUrl == null) {
            return "/images/placeholder.png";
        }
        if (imageUrl.startsWith("src/data")) {
            return imageUrl.replace("src/data", "");
        }
        return imageUrl;
    }

    /**
     * Map danh sách ReviewImage sang danh sách URL
     */
    @Named("mapReviewImages")
    default List<String> mapReviewImages(List<ReviewImage> reviewImages) {
        if (reviewImages == null) {
            return new ArrayList<>();
        }
        return reviewImages.stream()
                .map(ReviewImage::getImageUrl)
                .collect(Collectors.toList());
    }
}
