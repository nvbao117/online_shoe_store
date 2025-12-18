package com.example.online_shoe_store.Service;

import com.example.online_shoe_store.Entity.Brand;
import com.example.online_shoe_store.Entity.Category;
import com.example.online_shoe_store.Entity.Product;
import com.example.online_shoe_store.Entity.Voucher;
import com.example.online_shoe_store.Entity.enums.DiscountType;
import com.example.online_shoe_store.Repository.BrandRepository;
import com.example.online_shoe_store.Repository.CategoryRepository;
import com.example.online_shoe_store.Repository.ProductRepository;
import com.example.online_shoe_store.Repository.VoucherRepository;
import com.example.online_shoe_store.dto.request.VoucherCreateRequest;
import com.example.online_shoe_store.dto.request.VoucherStatusUpdateRequest;
import com.example.online_shoe_store.dto.response.OptionItemResponse;
import com.example.online_shoe_store.dto.response.VoucherAdminListResponse;
import com.example.online_shoe_store.dto.response.VoucherMetadataResponse;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.*;

@Service
@RequiredArgsConstructor
public class VoucherService {

    private final VoucherRepository voucherRepository;
    private final CategoryRepository categoryRepository;
    private final BrandRepository brandRepository;
    private final ProductRepository productRepository;

    public List<VoucherAdminListResponse> getAdminVouchers() {
        LocalDateTime now = LocalDateTime.now();
        return voucherRepository.findAll(Sort.by(Sort.Direction.DESC, "createdAt"))
                .stream()
                .map(voucher -> mapToAdminResponse(voucher, now))
                .toList();
    }

    @Transactional
    public void updateStatuses(List<VoucherStatusUpdateRequest> updates) {
        if (updates == null || updates.isEmpty()) {
            return;
        }

        Map<String, String> updateMap = new HashMap<>();
        updates.forEach(item -> updateMap.put(item.getVoucherId(), normalizeStatus(item.getStatus())));

        List<Voucher> vouchers = voucherRepository.findAllById(updateMap.keySet());
        if (vouchers.size() != updateMap.keySet().size()) {
            throw new NoSuchElementException("Một hoặc nhiều voucher không tồn tại");
        }

        LocalDateTime now = LocalDateTime.now();
        for (Voucher voucher : vouchers) {
            if (isExpired(voucher, now)) {
                throw new IllegalStateException("Voucher " + voucher.getCode() + " đã hết hạn và không thể thay đổi trạng thái.");
            }

            String newStatus = updateMap.get(voucher.getVoucherId());
            if ("EXPIRED".equals(newStatus)) {
                throw new IllegalArgumentException("Không thể đặt trạng thái voucher thành EXPIRED thủ công.");
            }
            voucher.setStatus(newStatus.toLowerCase(Locale.ROOT));
        }

        voucherRepository.saveAll(vouchers);
    }

    @Transactional
    public void deleteExpiredVoucher(String voucherId) {
        Voucher voucher = voucherRepository.findById(voucherId)
                .orElseThrow(() -> new NoSuchElementException("Voucher không tồn tại"));

        if (!isExpired(voucher, LocalDateTime.now())) {
            throw new IllegalStateException("Chỉ có thể xóa voucher đã hết hạn.");
        }

        voucherRepository.delete(voucher);
    }

    public VoucherMetadataResponse getMetadata() {
        List<OptionItemResponse> categories = categoryRepository.findAll(Sort.by("name"))
                .stream()
                .map(category -> new OptionItemResponse(category.getCategoryId(), category.getName(), null))
                .toList();

        List<OptionItemResponse> brands = brandRepository.findAll(Sort.by("name"))
                .stream()
                .map(brand -> new OptionItemResponse(brand.getBrandId(), brand.getName(),
                        brand.getCategory() != null ? brand.getCategory().getCategoryId() : null))
                .toList();

        List<OptionItemResponse> products = productRepository.findAll(Sort.by("name"))
                .stream()
                .map(product -> new OptionItemResponse(product.getProductId(), product.getName(),
                        product.getBrand() != null ? product.getBrand().getBrandId() : null))
                .toList();

        return VoucherMetadataResponse.builder()
                .categories(categories)
                .brands(brands)
                .products(products)
                .build();
    }

    @Transactional
    public VoucherAdminListResponse createVoucher(VoucherCreateRequest request) {
        validateCreateRequest(request);

        LocalDate startDate = LocalDate.parse(request.getStartDate());
        LocalDate endDate = LocalDate.parse(request.getEndDate());
        if (endDate.isBefore(startDate)) {
            throw new IllegalArgumentException("Ngày kết thúc phải lớn hơn hoặc bằng ngày bắt đầu");
        }

        if (voucherRepository.existsByCodeIgnoreCase(request.getCode())) {
            throw new IllegalArgumentException("Mã voucher đã tồn tại");
        }

        Voucher voucher = Voucher.builder()
                .name(request.getName())
                .code(request.getCode())
                .description(request.getDescription())
                .discountType(parseDiscountType(request.getDiscountType()))
                .discountValue(request.getDiscountValue())
                .minOrderValue(request.getMinOrderValue() != null ? request.getMinOrderValue() : BigDecimal.ZERO)
                .customerType(request.getCustomerType())
                .appliesToType(resolveScope(request.getScope()))
                .status(normalizeStatus(request.getStatus()).toLowerCase(Locale.ROOT))
                .startDate(startDate.atStartOfDay())
                .endDate(endDate.atTime(LocalTime.MAX))
                .build();

        Product targetProduct = attachScopeTargets(voucher, request);

        Voucher saved = voucherRepository.save(voucher);
        if (targetProduct != null) {
            targetProduct.getVouchers().add(saved);
            productRepository.save(targetProduct);
        }
        return mapToAdminResponse(saved, LocalDateTime.now());
    }

    private Product attachScopeTargets(Voucher voucher, VoucherCreateRequest request) {
        String scope = resolveScope(request.getScope());
        switch (scope) {
            case "all" -> {
                voucher.setAppliesToCategoryId(null);
                voucher.setAppliesToBrandId(null);
                voucher.setAppliesToProductId(null);
                return null;
            }
            case "category" -> {
                Category category = categoryRepository.findById(request.getCategoryId())
                        .orElseThrow(() -> new NoSuchElementException("Danh mục không tồn tại"));
                voucher.setAppliesToCategoryId(category.getCategoryId());
                return null;
            }
            case "brand" -> {
                Brand brand = brandRepository.findById(request.getBrandId())
                        .orElseThrow(() -> new NoSuchElementException("Thương hiệu không tồn tại"));
                String categoryId = Optional.ofNullable(brand.getCategory())
                        .map(Category::getCategoryId)
                        .orElse(request.getCategoryId());
                if (!StringUtils.hasText(categoryId)) {
                    throw new IllegalArgumentException("Vui lòng chọn danh mục cho thương hiệu");
                }
                voucher.setAppliesToCategoryId(categoryId);
                voucher.setAppliesToBrandId(brand.getBrandId());
                return null;
            }
            case "product" -> {
                Product product = productRepository.findById(request.getProductId())
                        .orElseThrow(() -> new NoSuchElementException("Sản phẩm không tồn tại"));
                if (product.getBrand() == null) {
                    throw new IllegalStateException("Sản phẩm phải gắn với thương hiệu");
                }

                voucher.setAppliesToProductId(product.getProductId());
                voucher.setAppliesToBrandId(product.getBrand().getBrandId());
                if (product.getCategory() != null) {
                    voucher.setAppliesToCategoryId(product.getCategory().getCategoryId());
                }
                voucher.getProducts().add(product);
                return product;
            }
            default -> throw new IllegalArgumentException("Phạm vi voucher không hợp lệ");
        }
    }

    private VoucherAdminListResponse mapToAdminResponse(Voucher voucher, LocalDateTime now) {
        boolean expired = isExpired(voucher, now);
        String normalizedStatus = normalizeStatus(voucher.getStatus());
        String displayStatus = expired ? "EXPIRED" : normalizedStatus;

        return VoucherAdminListResponse.builder()
                .voucherId(voucher.getVoucherId())
                .name(voucher.getName())
                .code(voucher.getCode())
                .discountLabel(formatDiscountLabel(voucher))
                .status(displayStatus)
                .expired(expired)
                .build();
    }

    private String formatDiscountLabel(Voucher voucher) {
        BigDecimal value = voucher.getDiscountValue();
        if (value == null) {
            return "-";
        }

        String numeric = value.stripTrailingZeros().toPlainString();
        if (voucher.getDiscountType() == DiscountType.PERCENTAGE) {
            return numeric + "% off";
        }
        return numeric + " off";
    }

    private boolean isExpired(Voucher voucher, LocalDateTime now) {
        return voucher.getEndDate() != null && voucher.getEndDate().isBefore(now);
    }

    private String normalizeStatus(String status) {
        if (!StringUtils.hasText(status)) {
            return "INACTIVE";
        }
        String upper = status.trim().toUpperCase(Locale.ROOT);
        return switch (upper) {
            case "ACTIVE" -> "ACTIVE";
            case "INACTIVE" -> "INACTIVE";
            case "EXPIRED" -> "EXPIRED";
            default -> "INACTIVE";
        };
    }

    private DiscountType parseDiscountType(String discountType) {
        if (!StringUtils.hasText(discountType)) {
            return DiscountType.PERCENTAGE;
        }
        try {
            return DiscountType.valueOf(discountType.trim().toUpperCase(Locale.ROOT));
        } catch (IllegalArgumentException ex) {
            throw new IllegalArgumentException("Discount Type không hợp lệ. Chỉ hỗ trợ % hoặc Amount");
        }
    }

    private String resolveScope(String scope) {
        if (!StringUtils.hasText(scope)) {
            return "all";
        }
        return switch (scope.trim().toUpperCase(Locale.ROOT)) {
            case "ALL" -> "all";
            case "CATEGORY" -> "category";
            case "BRAND" -> "brand";
            case "PRODUCT" -> "product";
            default -> throw new IllegalArgumentException("Phạm vi voucher không hợp lệ");
        };
    }

    private void validateCreateRequest(VoucherCreateRequest request) {
        if (!StringUtils.hasText(request.getName()) || !StringUtils.hasText(request.getCode())) {
            throw new IllegalArgumentException("Tên và mã voucher là bắt buộc");
        }

        if (!StringUtils.hasText(request.getStartDate()) || !StringUtils.hasText(request.getEndDate())) {
            throw new IllegalArgumentException("Vui lòng chọn ngày bắt đầu và ngày kết thúc");
        }

        if (request.getDiscountValue() == null || request.getDiscountValue().compareTo(BigDecimal.ZERO) <= 0) {
            throw new IllegalArgumentException("Giá trị giảm phải lớn hơn 0");
        }

        if (request.getMinOrderValue() != null && request.getMinOrderValue().compareTo(BigDecimal.ZERO) < 0) {
            throw new IllegalArgumentException("Giá trị đơn hàng tối thiểu không được âm");
        }

        String scope = resolveScope(request.getScope());
        if (Objects.equals(scope, "category") && !StringUtils.hasText(request.getCategoryId())) {
            throw new IllegalArgumentException("Vui lòng chọn danh mục áp dụng");
        }
        if (Objects.equals(scope, "brand") && (!StringUtils.hasText(request.getBrandId()) || !StringUtils.hasText(request.getCategoryId()))) {
            throw new IllegalArgumentException("Vui lòng chọn danh mục và thương hiệu áp dụng");
        }
        if (Objects.equals(scope, "product") && !StringUtils.hasText(request.getProductId())) {
            throw new IllegalArgumentException("Vui lòng chọn sản phẩm áp dụng");
        }
    }
}