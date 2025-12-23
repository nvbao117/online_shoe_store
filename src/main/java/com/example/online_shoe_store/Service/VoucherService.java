package com.example.online_shoe_store.Service;

import com.example.online_shoe_store.Entity.Brand;
import com.example.online_shoe_store.Entity.Category;
import com.example.online_shoe_store.Entity.Product;
import com.example.online_shoe_store.Entity.User;
import com.example.online_shoe_store.Entity.Voucher;
import com.example.online_shoe_store.Entity.enums.DiscountType;
import com.example.online_shoe_store.Entity.enums.NotificationType;
import com.example.online_shoe_store.Repository.BrandRepository;
import com.example.online_shoe_store.Repository.CategoryRepository;
import com.example.online_shoe_store.Repository.ProductRepository;
import com.example.online_shoe_store.Repository.UserRepository;
import com.example.online_shoe_store.Repository.VoucherRepository;
import com.example.online_shoe_store.dto.request.VoucherApplyRequest;
import com.example.online_shoe_store.dto.request.VoucherApplyRequestItem;
import com.example.online_shoe_store.dto.request.VoucherCreateRequest;
import com.example.online_shoe_store.dto.request.VoucherStatusUpdateRequest;
import com.example.online_shoe_store.dto.response.OptionItemResponse;
import com.example.online_shoe_store.dto.response.VoucherApplyResponse;
import com.example.online_shoe_store.dto.response.VoucherAdminListResponse;
import com.example.online_shoe_store.dto.response.VoucherMetadataResponse;
import com.example.online_shoe_store.dto.response.VoucherValidResponse;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.math.RoundingMode;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class VoucherService {

    private final VoucherRepository voucherRepository;
    private final CategoryRepository categoryRepository;
    private final BrandRepository brandRepository;
    private final ProductRepository productRepository;
    private final UserRepository userRepository;
    private final UserNotificationService userNotificationService;

    public List<VoucherAdminListResponse> getAdminVouchers() {
        LocalDateTime now = LocalDateTime.now();
        return voucherRepository.findAll(Sort.by(Sort.Direction.DESC, "createdAt"))
                .stream()
                .map(voucher -> mapToAdminResponse(voucher, now))
                .collect(Collectors.toList());
    }

    public List<VoucherValidResponse> getValidVouchers(BigDecimal subtotal, List<String> productIds) {
        BigDecimal safeSubtotal = subtotal != null ? subtotal : BigDecimal.ZERO;
        LocalDateTime now = LocalDateTime.now();
        List<Product> products = loadProducts(productIds);

        // Chỉ lấy voucher ACTIVE và còn hiệu lực theo thời gian
        return voucherRepository.findByStatusIgnoreCaseAndStartDateLessThanEqualAndEndDateGreaterThanEqual(
                        "ACTIVE",
                        now,
                        now
                )
                .stream()
                .filter(voucher -> isSubtotalEligible(voucher, safeSubtotal))
                .filter(voucher -> isScopeEligible(voucher, products))
                .map(this::mapToValidResponse)
                .collect(Collectors.toList());
    }

    public VoucherApplyResponse applyVoucher(VoucherApplyRequest request) {
        String code = request != null ? request.getVoucherCode() : null;
        BigDecimal subtotal = request != null ? request.getSubtotal() : null;
        List<VoucherApplyRequestItem> items = request != null ? request.getItems() : null;
        if (!StringUtils.hasText(code) || subtotal == null) {
            throw new IllegalArgumentException("Mã không tồn tại");
        }

        // B1: kiểm tra tồn tại + trạng thái
        Voucher voucher = voucherRepository.findByCodeIgnoreCase(code.trim())
                .orElseThrow(() -> new IllegalArgumentException("Mã không tồn tại"));

        if (!"ACTIVE".equals(normalizeStatus(voucher.getStatus()))) {
            throw new IllegalArgumentException("Mã không tồn tại");
        }

        // B2: kiểm tra thời gian hiệu lực
        LocalDateTime now = LocalDateTime.now();
        if (!isWithinActiveWindow(voucher, now)) {
            throw new IllegalArgumentException("Mã đã hết hạn");
        }

        // B3: kiểm tra giá trị tối thiểu
        BigDecimal eligibleSubtotal = resolveEligibleSubtotal(voucher, items, subtotal);
        if (eligibleSubtotal.compareTo(BigDecimal.ZERO) <= 0) {
            throw new IllegalArgumentException("Voucher không áp dụng cho sản phẩm này");
        }

        if (!isSubtotalEligible(voucher, usesScopedSubtotal(voucher) ? eligibleSubtotal : subtotal)) {
            throw new IllegalArgumentException("Đơn hàng chưa đủ giá trị tối thiểu");
        }

        // B4: tính giá trị giảm giá theo loại voucher
        BigDecimal discountAmount = calculateDiscountAmount(voucher, eligibleSubtotal);
        BigDecimal finalTotal = subtotal.subtract(discountAmount).max(BigDecimal.ZERO);

        return VoucherApplyResponse.builder()
                .discountAmount(discountAmount)
                .finalTotal(finalTotal)
                .build();
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
                throw new IllegalStateException(
                        "Voucher " + voucher.getCode() + " đã hết hạn và không thể thay đổi trạng thái.");
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
                .map(category -> new OptionItemResponse(category.getCategoryId(), category.getName(), null, null))
                .collect(Collectors.toList());

        List<Product> allProducts = productRepository.findAll(Sort.by("name"));
        Map<String, Map<String, Brand>> categoryBrandMap = new HashMap<>();

        for (Product product : allProducts) {
            if (product.getCategory() == null || product.getBrand() == null) {
                continue;
            }
            String categoryId = product.getCategory().getCategoryId();
            String brandId = product.getBrand().getBrandId();
            categoryBrandMap.computeIfAbsent(categoryId, key -> new HashMap<>())
                    .putIfAbsent(brandId, product.getBrand());
        }

        List<OptionItemResponse> brands = new ArrayList<>();
        for (Map.Entry<String, Map<String, Brand>> categoryEntry : categoryBrandMap.entrySet()) {
            String categoryId = categoryEntry.getKey();
            for (Brand brand : categoryEntry.getValue().values()) {
                brands.add(new OptionItemResponse(brand.getBrandId(), brand.getName(), categoryId, categoryId));
            }
        }
        brands.sort(Comparator.comparing(OptionItemResponse::getName, String.CASE_INSENSITIVE_ORDER));

        List<OptionItemResponse> products = allProducts
                .stream()
                .map(product -> new OptionItemResponse(
                        product.getProductId(),
                        product.getName(),
                        product.getBrand() != null ? product.getBrand().getBrandId() : null,
                        product.getCategory() != null ? product.getCategory().getCategoryId() : null
                ))
                .collect(Collectors.toList());

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

        // Gửi thông báo khuyến mãi đến tất cả users khi voucher ACTIVE
        if ("active".equalsIgnoreCase(saved.getStatus())) {
            sendPromotionNotificationToAllUsers(saved);
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
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");

        return VoucherAdminListResponse.builder()
                .voucherId(voucher.getVoucherId())
                .name(voucher.getName())
                .code(voucher.getCode())
                .discountLabel(formatDiscountLabel(voucher))
                .startDate(formatDate(voucher.getStartDate(), formatter))
                .endDate(formatDate(voucher.getEndDate(), formatter))
                .status(displayStatus)
                .expired(expired)
                .build();
    }

    private String formatDate(LocalDateTime date, DateTimeFormatter formatter) {
        if (date == null) {
            return "-";
        }
        return formatter.format(date);
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

    private boolean isWithinActiveWindow(Voucher voucher, LocalDateTime now) {
        if (voucher.getStartDate() == null || voucher.getEndDate() == null) {
            return false;
        }
        return !now.isBefore(voucher.getStartDate()) && !now.isAfter(voucher.getEndDate());
    }

    private boolean isSubtotalEligible(Voucher voucher, BigDecimal subtotal) {
        BigDecimal minOrder = voucher.getMinOrderValue() != null ? voucher.getMinOrderValue() : BigDecimal.ZERO;
        return subtotal.compareTo(minOrder) >= 0;
    }

    private VoucherValidResponse mapToValidResponse(Voucher voucher) {
        return VoucherValidResponse.builder()
                .code(voucher.getCode())
                .discountType(mapDiscountType(voucher.getDiscountType()))
                .discountValue(voucher.getDiscountValue())
                .description(voucher.getDescription())
                .maxDiscountAmount(voucher.getMaxDiscountValue())
                .build();
    }

    private String mapDiscountType(DiscountType discountType) {
        if (discountType == DiscountType.FIXED_AMOUNT) {
            return "FIXED";
        }
        return "PERCENT";
    }

    private BigDecimal calculateDiscountAmount(Voucher voucher, BigDecimal subtotal) {
        BigDecimal discountValue = voucher.getDiscountValue() != null ? voucher.getDiscountValue() : BigDecimal.ZERO;
        BigDecimal discountAmount;

        if (voucher.getDiscountType() == DiscountType.FIXED_AMOUNT) {
            discountAmount = discountValue;
        } else {
            discountAmount = subtotal.multiply(discountValue)
                    .divide(BigDecimal.valueOf(100), 2, RoundingMode.HALF_UP);
            if (voucher.getMaxDiscountValue() != null) {
                discountAmount = discountAmount.min(voucher.getMaxDiscountValue());
            }
        }

        if (discountAmount.compareTo(subtotal) > 0) {
            return subtotal;
        }
        return discountAmount;
    }

    private List<Product> loadProducts(List<String> productIds) {
        if (productIds == null || productIds.isEmpty()) {
            return Collections.emptyList();
        }
        List<String> cleaned = productIds.stream()
                .filter(StringUtils::hasText)
                .map(String::trim)
                .distinct()
                .collect(Collectors.toList());
        if (cleaned.isEmpty()) {
            return Collections.emptyList();
        }
        return productRepository.findAllById(cleaned);
    }

    private boolean isScopeEligible(Voucher voucher, List<Product> products) {
        if (products == null || products.isEmpty()) {
            return "all".equals(voucher.getAppliesToType());
        }
        return products.stream().anyMatch(product -> matchesScope(voucher, product));
    }

    private boolean usesScopedSubtotal(Voucher voucher) {
        return voucher != null && !"all".equals(voucher.getAppliesToType());
    }

    private BigDecimal resolveEligibleSubtotal(Voucher voucher, List<VoucherApplyRequestItem> items, BigDecimal subtotal) {
        if (voucher == null) {
            return BigDecimal.ZERO;
        }

        if ("all".equals(voucher.getAppliesToType())) {
            return subtotal != null ? subtotal : BigDecimal.ZERO;
        }

        if (items == null || items.isEmpty()) {
            return BigDecimal.ZERO;
        }

        Map<String, Product> productMap = productRepository.findAllById(
                        items.stream()
                                .map(VoucherApplyRequestItem::getProductId)
                                .filter(StringUtils::hasText)
                                .collect(Collectors.toList())
                )
                .stream()
                .collect(Collectors.toMap(Product::getProductId, product -> product));

        BigDecimal eligibleSubtotal = BigDecimal.ZERO;
        for (VoucherApplyRequestItem item : items) {
            if (item == null || !StringUtils.hasText(item.getProductId())) {
                continue;
            }
            Product product = productMap.get(item.getProductId());
            if (product == null) {
                continue;
            }
            if (!matchesScope(voucher, product)) {
                continue;
            }
            BigDecimal lineTotal = item.getLineTotal() != null ? item.getLineTotal() : BigDecimal.ZERO;
            eligibleSubtotal = eligibleSubtotal.add(lineTotal);
        }
        return eligibleSubtotal;
    }

    private boolean matchesScope(Voucher voucher, Product product) {
        String scope = voucher.getAppliesToType();
        if ("all".equals(scope)) {
            return true;
        }
        if ("category".equals(scope)) {
            return product.getCategory() != null
                    && Objects.equals(product.getCategory().getCategoryId(), voucher.getAppliesToCategoryId());
        }
        if ("brand".equals(scope)) {
            return product.getBrand() != null
                    && Objects.equals(product.getBrand().getBrandId(), voucher.getAppliesToBrandId());
        }
        if ("product".equals(scope)) {
            return Objects.equals(product.getProductId(), voucher.getAppliesToProductId());
        }
        return false;
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
        if (Objects.equals(scope, "brand")
                && (!StringUtils.hasText(request.getBrandId()) || !StringUtils.hasText(request.getCategoryId()))) {
            throw new IllegalArgumentException("Vui lòng chọn danh mục và thương hiệu áp dụng");
        }
        if (Objects.equals(scope, "product") && !StringUtils.hasText(request.getProductId())) {
            throw new IllegalArgumentException("Vui lòng chọn sản phẩm áp dụng");
        }
    }

    private void sendPromotionNotificationToAllUsers(Voucher voucher) {
        List<User> allUsers = userRepository.findAll();
        String discountLabel = formatDiscountLabel(voucher);
        String message = String.format(
                "Mã giảm giá %s - %s! Sử dụng mã: %s. Đơn tối thiểu: %s đ",
                discountLabel,
                voucher.getName(),
                voucher.getCode(),
                voucher.getMinOrderValue() != null ? voucher.getMinOrderValue().toPlainString() : "0");

        for (User user : allUsers) {
            userNotificationService.createNotification(
                    user,
                    NotificationType.PROMOTION,
                    "🎁 Voucher mới: " + voucher.getName(),
                    message,
                    "🎁",
                    null);
        }
    }
}