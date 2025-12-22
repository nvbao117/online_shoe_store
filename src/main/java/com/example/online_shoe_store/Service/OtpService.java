package com.example.online_shoe_store.Service;

public interface OtpService {
    //Tao OTP
    String generateOtp(String key);
    String generateOtp(String key, String purpose);

    //Kiem tra OTP
    boolean validateOtp(String phone, String otp);
}
