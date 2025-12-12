package com.example.online_shoe_store.specification;

import com.example.online_shoe_store.Entity.Product;
import com.example.online_shoe_store.dto.request.ProductFilterRequest;
import jakarta.persistence.criteria.Join;
import jakarta.persistence.criteria.JoinType;
import jakarta.persistence.criteria.Predicate;
import org.springframework.data.jpa.domain.Specification;

import java.math.BigDecimal;

public class ProductSpecification {

    public static Specification<Product> filter(ProductFilterRequest request) {
        return (root, query, criteriaBuilder) -> {
            Predicate predicate = criteriaBuilder.conjunction(); // JPA Predicate

            // Filter theo price
            if (request.getPrices() != null && !request.getPrices().isEmpty()) {
                Predicate pricePredicate = criteriaBuilder.disjunction();
                for (String range : request.getPrices()) {
                    String[] parts = range.split("-");
                    if (parts.length == 2) {
                        BigDecimal min = new BigDecimal(parts[0]);
                        BigDecimal max = new BigDecimal(parts[1]);
                        pricePredicate = criteriaBuilder.or(pricePredicate,
                                criteriaBuilder.between(root.get("price"), min, max));
                    }
                }
                predicate = criteriaBuilder.and(predicate, pricePredicate);
            }

            // Filter theo gender
//            if (request.getGender() != null && !request.getGender().isEmpty()) {
//                predicate = criteriaBuilder.and(predicate, root.get("gender").in(request.getGender()));
//            }

            // Filter theo size
            if (request.getSizes() != null && !request.getSizes().isEmpty()) {
                Join<Object, Object> sizeJoin = root.join("sizes", JoinType.INNER);
                predicate = criteriaBuilder.and(predicate, sizeJoin.in(request.getSizes()));
            }

            // Filter theo brand
            if (request.getBrands() != null && !request.getBrands().isEmpty()) {
                predicate = criteriaBuilder.and(predicate, root.get("brand").in(request.getBrands()));
            }

            return predicate;
        };
    }
}
