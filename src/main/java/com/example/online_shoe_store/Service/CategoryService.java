package com.example.online_shoe_store.Service;

import com.example.online_shoe_store.Entity.Brand;
import com.example.online_shoe_store.Entity.Category;
import com.example.online_shoe_store.Repository.CategoryRepository;
import com.example.online_shoe_store.dto.response.BrandResponse;
import com.example.online_shoe_store.dto.response.CategoryResponse;
import com.example.online_shoe_store.mapper.BrandMapper;
import com.example.online_shoe_store.mapper.CategoryMapper;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = lombok.AccessLevel.PRIVATE, makeFinal = true)

public class CategoryService {
    CategoryRepository categoryRepository;
    CategoryMapper categoryMapper;
    BrandMapper brandMapper;

    public List<CategoryResponse> getAllCategoriesResponses() {
        return categoryMapper.toCategoryResponsesList(categoryRepository.findAll());
    }
}
