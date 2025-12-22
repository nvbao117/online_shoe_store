package com.example.online_shoe_store.Controller.profile;

import com.example.online_shoe_store.Entity.User;
import com.example.online_shoe_store.Repository.UserRepository;
import com.example.online_shoe_store.Service.UserService;
import com.example.online_shoe_store.dto.response.UserProfileResponse;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;
import org.springframework.security.core.Authentication;

@RestController
@RequiredArgsConstructor
@FieldDefaults(level = lombok.AccessLevel.PRIVATE, makeFinal = true)
public class UserProfileController {

    UserRepository userRepository;
    UserService userService;

    @GetMapping("/api/me")
    public UserProfileResponse me(Authentication authentication) {

        if (authentication == null || !authentication.isAuthenticated()) {
            throw new ResponseStatusException(HttpStatus.UNAUTHORIZED);
        }

        String username = authentication.getName();

        User user = userRepository.findByUsername(username).orElseThrow();

        return UserProfileResponse.builder()
                .username(user.getUsername())
                .email(user.getEmail())
                .phone(user.getPhone())
                .name(user.getName())
                .build();
    }

    @org.springframework.web.bind.annotation.PutMapping("/api/me")
    public org.springframework.http.ResponseEntity<?> updateProfile(
            @org.springframework.web.bind.annotation.RequestBody @jakarta.validation.Valid com.example.online_shoe_store.dto.request.UserProfileUpdateRequest request,
            org.springframework.validation.BindingResult bindingResult,
            Authentication authentication) {
        if (bindingResult.hasErrors()) {
            return org.springframework.http.ResponseEntity.badRequest().body(bindingResult.getFieldError().getDefaultMessage());
        }
        StringBuilder error = new StringBuilder();
        if (userService.updateProfile(authentication.getName(), request, error)) {
            return org.springframework.http.ResponseEntity.ok("Cập nhật thành công");
        }
        return org.springframework.http.ResponseEntity.badRequest().body(error.toString());
    }

    @org.springframework.web.bind.annotation.PutMapping("/api/me/password")
    public org.springframework.http.ResponseEntity<?> changePassword(
            @org.springframework.web.bind.annotation.RequestBody @jakarta.validation.Valid com.example.online_shoe_store.dto.request.ChangePasswordRequest request,
            org.springframework.validation.BindingResult bindingResult,
            Authentication authentication) {
        if (bindingResult.hasErrors()) {
            return org.springframework.http.ResponseEntity.badRequest().body(bindingResult.getFieldError().getDefaultMessage());
        }
        StringBuilder error = new StringBuilder();
        if (userService.changePassword(authentication.getName(), request, error)) {
            return org.springframework.http.ResponseEntity.ok("Đổi mật khẩu thành công");
        }
        return org.springframework.http.ResponseEntity.badRequest().body(error.toString());
    }


}
