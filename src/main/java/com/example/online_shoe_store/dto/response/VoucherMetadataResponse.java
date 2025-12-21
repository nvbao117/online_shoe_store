package com.example.online_shoe_store.dto.response;

import lombok.Builder;
import lombok.Data;

import java.util.List;

@Data
@Builder
public class VoucherMetadataResponse {
    private List<OptionItemResponse> categories;
    private List<OptionItemResponse> brands;
    private List<OptionItemResponse> products;
}