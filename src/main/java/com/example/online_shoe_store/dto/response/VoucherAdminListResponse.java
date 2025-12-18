package com.example.online_shoe_store.dto.response;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class VoucherAdminListResponse {
    private String voucherId;
    private String name;
    private String code;
    private String discountLabel;
    private String status;
    private boolean expired;
}
