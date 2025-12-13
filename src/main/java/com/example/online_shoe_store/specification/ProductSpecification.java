package com.example.online_shoe_store.specification;

import com.example.online_shoe_store.Entity.Product;
import com.example.online_shoe_store.dto.request.ProductFilterRequest;
import jakarta.persistence.criteria.Join;
import jakarta.persistence.criteria.JoinType;
import jakarta.persistence.criteria.Predicate;
import org.springframework.data.jpa.domain.Specification;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

public class ProductSpecification {

    public static Specification<Product> filter(ProductFilterRequest request) {
        return (root, query, cb) -> {
            Predicate predicate = cb.conjunction();

            // ----- Lọc theo price -----
            if (request.getPrices() != null && !request.getPrices().isEmpty()) {
                List<Predicate> pricePredicates = new ArrayList<>();

                for (String range : request.getPrices()) {
                    String[] parts = range.split("-");
                    if (parts.length == 2) {
                        BigDecimal min = new BigDecimal(parts[0]);
                        BigDecimal max = new BigDecimal(parts[1]);
                        pricePredicates.add(cb.between(root.get("price"), min, max));
                    }
                }

                if (!pricePredicates.isEmpty()) {
                    predicate = cb.and(predicate, cb.or(pricePredicates.toArray(new Predicate[0])));
                }
            }
            // ----- Lọc theo brand -----
            if (request.getBrands() != null && !request.getBrands().isEmpty()) {
                // root.get("brand").get("brandId") phải đúng với tên trường trong Entity
                predicate = cb.and(
                        predicate,
                        root.get("brand").get("brandId").in(request.getBrands())
                );
            }

            // ----- Lọc theo size (join product_variant) -----
            if (request.getSizes() != null && !request.getSizes().isEmpty()) {

                // JOIN product → productVariants
                Join<?, ?> variantJoin = root.join("productVariants", JoinType.INNER);

                // WHERE product_variant.size IN (...)
                predicate = cb.and(
                        predicate,
                        variantJoin.get("size").in(request.getSizes())
                );

                // Tránh trùng sản phẩm khi join
                assert query != null;
                query.distinct(true);
            }


            return predicate;
        };
    }
}
