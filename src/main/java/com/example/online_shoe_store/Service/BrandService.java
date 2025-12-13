package com.example.online_shoe_store.Service;

import com.example.online_shoe_store.Entity.Brand;
import com.example.online_shoe_store.Entity.Category;
import com.example.online_shoe_store.Repository.BrandRepository;
import com.example.online_shoe_store.Repository.CategoryRepository;
import com.example.online_shoe_store.dto.response.BrandResponse;
import com.example.online_shoe_store.mapper.BrandMapper;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = lombok.AccessLevel.PRIVATE, makeFinal = true)
public class BrandService {
    BrandRepository brandRepository;
    CategoryRepository categoryRepository;
    BrandMapper brandMapper;
    public List<BrandResponse> getAllBrands() {
        return  brandMapper.toBrandResponsesList(brandRepository.findAll());
    }

    public List<BrandResponse> getBrandsByCategoryId(String categoryId) {
        Category category = categoryRepository.findById(categoryId).orElse(null);
        if (category != null) {
            List<Brand> brands = category.getBrands();
            return brandMapper.toBrandResponsesList(brands);
        }
        return List.of();
    }


}
