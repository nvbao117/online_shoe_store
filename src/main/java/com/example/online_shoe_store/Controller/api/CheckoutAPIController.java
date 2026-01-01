
package com.example.online_shoe_store.Controller.api;

import com.example.online_shoe_store.Entity.ShipDetail;
import com.example.online_shoe_store.Entity.User;
import com.example.online_shoe_store.Repository.ShipDetailRepository;
import com.example.online_shoe_store.Repository.UserRepository;
import com.example.online_shoe_store.Service.CartService;
import com.example.online_shoe_store.Service.CheckoutService;
import com.example.online_shoe_store.Service.PaymentService;
import com.example.online_shoe_store.dto.request.CheckoutRequest;
import com.example.online_shoe_store.dto.request.PaymentCreateRequest;
import com.example.online_shoe_store.dto.response.CartItemResponse;
import com.example.online_shoe_store.dto.response.PaymentResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/checkout")
@RequiredArgsConstructor
@Slf4j
public class CheckoutAPIController {

    private final CartService cartService;
    private final CheckoutService checkoutService;
    private final PaymentService paymentService;
    private final ShipDetailRepository shipDetailRepository;
    private final UserRepository userRepository;

    /**
     * Get checkout data: user info, cart items, addresses
     */
    @GetMapping("/data")
    public ResponseEntity<?> getCheckoutData(HttpSession session) {
        User user = getCurrentUser();
        if (user == null) {
            return ResponseEntity.status(401).body(Map.of("error", "Unauthorized"));
        }

        @SuppressWarnings("unchecked")
        List<String> selectedItems = (List<String>) session.getAttribute("selectedCartItems");
        if (selectedItems == null || selectedItems.isEmpty()) {
            return ResponseEntity.badRequest().body(Map.of("error", "No items selected"));
        }

        List<CartItemResponse> cartItems = cartService.getCartItemsByIds(selectedItems);
        BigDecimal subtotal = cartItems.stream()
                .map(CartItemResponse::getTotalPrice)
                .reduce(BigDecimal.ZERO, BigDecimal::add);

        List<ShipDetail> addresses = shipDetailRepository.findByUserUserId(user.getUserId());
        ShipDetail defaultAddress = shipDetailRepository
                .findByUserUserIdAndIsDefaultTrue(user.getUserId())
                .orElse(null);

        Map<String, Object> response = new HashMap<>();
        response.put("user", Map.of(
                "name", user.getName() != null ? user.getName() : "",
                "email", user.getEmail() != null ? user.getEmail() : "",
                "phone", user.getPhone() != null ? user.getPhone() : ""
        ));
        response.put("cartItems", cartItems);
        response.put("subtotal", subtotal);
        response.put("total", subtotal);
        response.put("addresses", addresses.stream().map(this::mapAddress).toList());
        response.put("defaultAddress", defaultAddress != null ? mapAddress(defaultAddress) : null);

        return ResponseEntity.ok(response);
    }

    /**
     * Place order via API
     */
    @PostMapping("/place-order")
    public ResponseEntity<?> placeOrder(@RequestBody CheckoutRequest request, 
                                        HttpSession session,
                                        HttpServletRequest httpRequest) {
        User user = getCurrentUser();
        if (user == null) {
            return ResponseEntity.status(401).body(Map.of("error", "Unauthorized"));
        }

        @SuppressWarnings("unchecked")
        List<String> selectedItems = (List<String>) session.getAttribute("selectedCartItems");
        if (selectedItems == null || selectedItems.isEmpty()) {
            return ResponseEntity.badRequest().body(Map.of("error", "No items selected"));
        }

        try {
            // Place order
            String orderId = checkoutService.placeOrder(user, request, selectedItems);
            
            String paymentMethod = request.getPaymentMethod();
            
            if ("cod".equalsIgnoreCase(paymentMethod)) {
                // COD payment
                PaymentCreateRequest paymentRequest = PaymentCreateRequest.builder()
                        .orderId(orderId)
                        .paymentMethod("COD")
                        .build();

                String clientIp = getClientIp(httpRequest);
                PaymentResponse paymentResponse = paymentService.createPayment(paymentRequest, clientIp);

                if (paymentResponse.isSuccess()) {
                    // Soft delete cart items for COD
                    checkoutService.softDeleteUserCartItems(user, selectedItems);
                    session.removeAttribute("selectedCartItems");
                    
                    return ResponseEntity.ok(Map.of(
                            "success", true,
                            "orderId", orderId,
                            "paymentMethod", "COD",
                            "message", "Đặt hàng thành công"
                    ));
                }
            } else if ("vnpay".equalsIgnoreCase(paymentMethod)) {
                // VNPay payment
                PaymentCreateRequest paymentRequest = PaymentCreateRequest.builder()
                        .orderId(orderId)
                        .paymentMethod("VNPAY")
                        .build();

                String clientIp = getClientIp(httpRequest);
                PaymentResponse paymentResponse = paymentService.createPayment(paymentRequest, clientIp);

                if (paymentResponse.isSuccess() && paymentResponse.getPaymentUrl() != null) {
                    return ResponseEntity.ok(Map.of(
                            "success", true,
                            "orderId", orderId,
                            "paymentMethod", "VNPAY",
                            "paymentUrl", paymentResponse.getPaymentUrl()
                    ));
                }
            }

            return ResponseEntity.badRequest().body(Map.of("error", "Payment failed"));

        } catch (Exception e) {
            log.error("Error placing order", e);
            return ResponseEntity.badRequest().body(Map.of("error", e.getMessage()));
        }
    }

    private Map<String, Object> mapAddress(ShipDetail addr) {
        Map<String, Object> map = new HashMap<>();
        map.put("id", addr.getShipDetailId());
        map.put("recipientName", addr.getRecipientName());
        map.put("phone", addr.getPhone());
        map.put("email", addr.getEmail());
        map.put("detail", addr.getDetail());
        map.put("province", addr.getProvince());
        map.put("district", addr.getDistrict());
        map.put("ward", addr.getWard());
        map.put("isDefault", addr.getIsDefault());
        return map;
    }

    private User getCurrentUser() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth == null || !auth.isAuthenticated() || "anonymousUser".equals(auth.getPrincipal())) {
            return null;
        }
        String username = auth.getName();
        return userRepository.findByUsername(username).orElse(null);
    }

    private String getClientIp(HttpServletRequest request) {
        String ip = request.getHeader("X-Forwarded-For");
        if (ip == null || ip.isEmpty() || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("X-Real-IP");
        }
        if (ip == null || ip.isEmpty() || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        return ip;
    }
}
