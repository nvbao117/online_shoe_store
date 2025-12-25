package com.example.online_shoe_store.Controller.api;

import com.example.online_shoe_store.Service.VoucherService;
import com.example.online_shoe_store.dto.request.VoucherApplyRequest;
import com.example.online_shoe_store.dto.request.VoucherCreateRequest;
import com.example.online_shoe_store.dto.request.VoucherStatusUpdateRequest;
import com.example.online_shoe_store.dto.request.VoucherValidRequest;
import com.example.online_shoe_store.dto.response.VoucherApplyResponse;
import com.example.online_shoe_store.dto.response.VoucherAdminListResponse;
import com.example.online_shoe_store.dto.response.VoucherMetadataResponse;
import com.example.online_shoe_store.dto.response.VoucherValidResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/vouchers")
@RequiredArgsConstructor
public class VoucherApiController {

    private final VoucherService voucherService;

    @GetMapping
    public ResponseEntity<List<VoucherAdminListResponse>> getAdminVouchers() {
        return ResponseEntity.ok(voucherService.getAdminVouchers());
    }

    @GetMapping("/metadata")
    public ResponseEntity<VoucherMetadataResponse> getVoucherMetadata() {
        return ResponseEntity.ok(voucherService.getMetadata());
    }

    @GetMapping("/valid")
    public ResponseEntity<List<VoucherValidResponse>> getValidVouchers(
            @RequestParam(value = "subtotal", required = false) BigDecimal subtotal,
            @RequestParam(value = "productIds", required = false) List<String> productIds
    ) {
        return ResponseEntity.ok(voucherService.getValidVouchers(subtotal, productIds));
    }

    @PostMapping("/valid")
    public ResponseEntity<List<VoucherValidResponse>> getValidVouchers(@RequestBody VoucherValidRequest request) {
        return ResponseEntity.ok(voucherService.getValidVouchers(request));
    }

    @PostMapping("/apply")
    public ResponseEntity<?> applyVoucher(@RequestBody VoucherApplyRequest request) {
        try {
            VoucherApplyResponse response = voucherService.applyVoucher(request);
            return ResponseEntity.ok(response);
        } catch (Exception ex) {
            return ResponseEntity.badRequest().body(Map.of("message", ex.getMessage()));
        }
    }

    @PostMapping
    public ResponseEntity<?> createVoucher(@RequestBody VoucherCreateRequest request) {
        try {
            VoucherAdminListResponse response = voucherService.createVoucher(request);
            Map<String, Object> body = new HashMap<>();
            body.put("message", "Tạo voucher thành công");
            body.put("voucher", response);
            return ResponseEntity.status(HttpStatus.CREATED).body(body);
        } catch (Exception ex) {
            return ResponseEntity.badRequest().body(Map.of("message", ex.getMessage()));
        }
    }

    @PutMapping("/status")
    public ResponseEntity<?> updateStatuses(@RequestBody List<VoucherStatusUpdateRequest> updates) {
        try {
            voucherService.updateStatuses(updates);
            return ResponseEntity.ok(Map.of("message", "Cập nhật trạng thái voucher thành công"));
        } catch (Exception ex) {
            return ResponseEntity.badRequest().body(Map.of("message", ex.getMessage()));
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteExpired(@PathVariable("id") String voucherId) {
        try {
            voucherService.deleteExpiredVoucher(voucherId);
            return ResponseEntity.ok(Map.of("message", "Đã xóa voucher hết hạn"));
        } catch (Exception ex) {
            return ResponseEntity.badRequest().body(Map.of("message", ex.getMessage()));
        }
    }
}