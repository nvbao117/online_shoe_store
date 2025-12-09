package com.example.online_shoe_store.mapper;

import com.example.online_shoe_store.Entity.Category;
import com.example.online_shoe_store.dto.response.CategoryResponse;
import org.mapstruct.Mapper;

import java.util.List;

@Mapper(componentModel = "spring")
public interface CategoryMapper {
    CategoryResponse toCategoryResponse(Category category);
    List<CategoryResponse> toCategoryResponsesList(List<Category> categories);
}
