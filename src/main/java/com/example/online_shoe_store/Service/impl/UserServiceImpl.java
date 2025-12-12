package com.example.online_shoe_store.Service.impl;

import com.example.online_shoe_store.Entity.User;
import com.example.online_shoe_store.Repository.UserRepository;
import com.example.online_shoe_store.dto.request.RegisterRequest;
import com.example.online_shoe_store.Service.UserService;
import com.example.online_shoe_store.Service.OtpService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;
    private final OtpService otpService;

    public UserServiceImpl(UserRepository userRepository,
                           PasswordEncoder passwordEncoder,
                           OtpService otpService) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
        this.otpService = otpService;
    }


    @Override
    public boolean register(RegisterRequest request, StringBuilder errorMessage) {

        // 1. Kiểm tra mật khẩu trùng confirm
        if (!request.getPassword().equals(request.getConfirmPassword())) {
            errorMessage.append("Mật khẩu xác nhận không khớp");
            return false;
        }

        //1.1. Kiem Tra OTP
        if (!otpService.validateOtp(request.getMobileNumber(), request.getOtp())) {
            errorMessage.append("OTP không hợp lệ hoặc đã hết hạn");
            return false;
        }

        // 2. Kiểm tra trùng username / email / phone
        if (userRepository.existsByUsername(request.getUsername())) {
            errorMessage.append("Username đã tồn tại");
            return false;
        }

        if (userRepository.existsByEmail(request.getEmail())) {
            errorMessage.append("Email đã được sử dụng");
            return false;
        }

        if (request.getMobileNumber() != null && !request.getMobileNumber().isBlank()
                && userRepository.existsByPhone(request.getMobileNumber())) {
            errorMessage.append("Số điện thoại đã được sử dụng");
            return false;
        }

        // 3. Map DTO -> Entity User
        User user = new User();
        user.setUsername(request.getUsername());
        user.setPassword(passwordEncoder.encode(request.getPassword()));
        user.setEmail(request.getEmail());
        user.setPhone(request.getMobileNumber());
        user.setName(request.getFullName());
        // createdAt, userId, isActive, role, cart... đã xử lý trong @PrePersist của entity

        // 4. Lưu DB
        userRepository.save(user);

        return true;
    }
}
