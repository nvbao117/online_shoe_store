package com.example.online_shoe_store.dto.response;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class OptionItemResponse {
    private String id;
    private String name;
    private String parentId;
}