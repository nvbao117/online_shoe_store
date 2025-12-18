package com.example.online_shoe_store.Controller.api;

import com.example.online_shoe_store.Entity.ShipDetail;
import com.example.online_shoe_store.Entity.User;
import com.example.online_shoe_store.Repository.ShipDetailRepository;
import com.example.online_shoe_store.Repository.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/address")
@RequiredArgsConstructor
@Slf4j
public class AddressAPIController {

    private final ShipDetailRepository shipDetailRepository;
    private final UserRepository userRepository;

    /**
     * Set an address as default
     */
    @PostMapping("/set-default/{addressId}")
    public ResponseEntity<?> setDefaultAddress(@PathVariable String addressId) {
        User user = getCurrentUser();
        if (user == null) {
            return ResponseEntity.status(401).body(Map.of("error", "Unauthorized"));
        }

        // Find the address
        ShipDetail address = shipDetailRepository.findById(addressId).orElse(null);
        if (address == null) {
            return ResponseEntity.badRequest().body(Map.of("error", "Address not found"));
        }

        // Verify address belongs to user
        if (!address.getUser().getUserId().equals(user.getUserId())) {
            return ResponseEntity.status(403).body(Map.of("error", "Access denied"));
        }

        // Remove default from all other addresses
        List<ShipDetail> userAddresses = shipDetailRepository.findByUserUserId(user.getUserId());
        for (ShipDetail addr : userAddresses) {
            if (addr.getIsDefault()) {
                addr.setIsDefault(false);
                shipDetailRepository.save(addr);
            }
        }

        // Set this address as default
        address.setIsDefault(true);
        shipDetailRepository.save(address);

        log.info("Set address {} as default for user {}", addressId, user.getUserId());

        return ResponseEntity.ok(Map.of(
                "success", true,
                "message", "Đã đặt làm địa chỉ mặc định"
        ));
    }

    /**
     * Get all addresses for current user
     */
    @GetMapping("/list")
    public ResponseEntity<?> getAddresses() {
        User user = getCurrentUser();
        if (user == null) {
            return ResponseEntity.status(401).body(Map.of("error", "Unauthorized"));
        }

        List<ShipDetail> addresses = shipDetailRepository.findByUserUserId(user.getUserId());
        return ResponseEntity.ok(addresses);
    }

    private User getCurrentUser() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth == null || !auth.isAuthenticated() || "anonymousUser".equals(auth.getPrincipal())) {
            return null;
        }
        String username = auth.getName();
        return userRepository.findByUsername(username).orElse(null);
    }
}
