package com.example.online_shoe_store.mapper;

import com.example.online_shoe_store.Entity.Brand;
import com.example.online_shoe_store.dto.response.BrandResponse;
import org.mapstruct.Mapper;

import java.util.List;

@Mapper(componentModel = "spring")
public interface BrandMapper {
    BrandResponse toBrandResponse(Brand brand);
    List<BrandResponse> toBrandResponsesList(List<Brand> brands);
}
