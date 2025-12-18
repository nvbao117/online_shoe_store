package com.example.online_shoe_store.dto.request;

import lombok.Data;

@Data
public class VoucherStatusUpdateRequest {
    private String voucherId;
    private String status;
}