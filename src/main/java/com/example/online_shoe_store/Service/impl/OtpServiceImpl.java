package com.example.online_shoe_store.Service.impl;

import com.example.online_shoe_store.Service.OtpService;
import org.springframework.stereotype.Service;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ThreadLocalRandom;

@Service
public class OtpServiceImpl implements OtpService {

    private static final long EXPIRE_MILLIS = 5 * 60 * 1000; // 5 phút

    private static class OtpData {
        String code;
        long expiryTime;

        OtpData(String code, long expiryTime) {
            this.code = code;
            this.expiryTime = expiryTime;
        }
    }

    // lưu tạm trong RAM: key = phone, value = OTP + thời gian hết hạn
    private final Map<String, OtpData> otpStorage = new ConcurrentHashMap<>();

    @Override
    public String generateOtp(String phone) {
        String code = String.format("%06d",
                ThreadLocalRandom.current().nextInt(0, 1000000)); // 000000–999999

        long expiryTime = System.currentTimeMillis() + EXPIRE_MILLIS;
        otpStorage.put(phone, new OtpData(code, expiryTime));

        // IN RA CONSOLE (IntelliJ)
        System.out.println("=== OTP REGISTER ===");
        System.out.println("Phone: " + phone + " | OTP: " + code);
        System.out.println("====================");

        return code;
    }

    @Override
    public boolean validateOtp(String phone, String otp) {
        OtpData data = otpStorage.get(phone);
        if (data == null) {
            return false; // chưa tạo OTP hoặc đã xóa
        }

        // hết hạn
        if (System.currentTimeMillis() > data.expiryTime) {
            otpStorage.remove(phone);
            return false;
        }

        boolean ok = data.code.equals(otp);
        if (ok) {
            // Dùng xong thì xóa luôn => OTP 1 lần
            otpStorage.remove(phone);
        }
        return ok;
    }
}
