package com.example.online_shoe_store.Service;

public interface OtpService {
    //Tao OTP
    String generateOtp(String phone);

    //Kiem tra OTP
    boolean validateOtp(String phone, String otp);
}
