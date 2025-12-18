package com.example.online_shoe_store.dto.request;

import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ReviewFormRequest {
    @NotBlank(message = "Variant ID không được để trống")
    private String variantId;
    @Min(value = 1, message = "Rating tối thiểu là 1")
    @Max(value = 5, message = "Rating tối đa là 5")
    private Integer rating;
    @Size(max = 2000, message = "Bình luận tối đa 2000 ký tự")
    private String comment;
    @Size(max = 5, message = "Tối đa 5 hình ảnh")
    private List<String> imageUrls;
}
