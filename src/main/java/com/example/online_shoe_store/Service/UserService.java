package com.example.online_shoe_store.Service;

import com.example.online_shoe_store.dto.request.RegisterRequest;

public interface UserService {

    /**
     * Đăng ký tài khoản mới.
     * @param request dữ liệu từ form
     * @param errorMessage chứa thông báo lỗi nếu đăng ký thất bại
     * @return true nếu đăng ký ok, false nếu lỗi
     */
    boolean register(RegisterRequest request, StringBuilder errorMessage);

    boolean updateProfile(String username, com.example.online_shoe_store.dto.request.UserProfileUpdateRequest request, StringBuilder errorMessage);

    boolean changePassword(String username, com.example.online_shoe_store.dto.request.ChangePasswordRequest request, StringBuilder errorMessage);
}
