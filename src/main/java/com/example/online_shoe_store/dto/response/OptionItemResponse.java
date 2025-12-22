package com.example.online_shoe_store.dto.response;

import lombok.Data;

@Data
public class OptionItemResponse {
    private String id;
    private String name;
    private String parentId;
    private String categoryId;

    public OptionItemResponse(String id, String name, String parentId) {
        this.id = id;
        this.name = name;
        this.parentId = parentId;
        this.categoryId = null;
    }

    public OptionItemResponse(String id, String name, String parentId, String categoryId) {
        this.id = id;
        this.name = name;
        this.parentId = parentId;
        this.categoryId = categoryId;
    }
}