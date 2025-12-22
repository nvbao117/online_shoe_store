package com.example.online_shoe_store.Service.impl;

import com.example.online_shoe_store.Service.OtpService;
import org.springframework.stereotype.Service;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ThreadLocalRandom;

@Service
public class OtpServiceImpl implements OtpService {

    private static final long EXPIRE_MILLIS = 5 * 60 * 1000; // 5 phút
    private static final long RATE_LIMIT_MILLIS = 60 * 1000; // 60 giây (1 phút)

    private static class OtpData {
        String code;
        long expiryTime;
        long lastSentTime; // Thời gian gửi OTP lần cuối

        OtpData(String code, long expiryTime, long lastSentTime) {
            this.code = code;
            this.expiryTime = expiryTime;
            this.lastSentTime = lastSentTime;
        }
    }

    // lưu tạm trong RAM: key = phone/email, value = OTP + thời gian hết hạn
    private final Map<String, OtpData> otpStorage = new ConcurrentHashMap<>();

    @Override
    public String generateOtp(String key) {
        return generateOtp(key, "DEFAULT");
    }
    
    @Override
    public String generateOtp(String key, String purpose) {
        long currentTime = System.currentTimeMillis();
        
        // Kiểm tra rate limiting: nếu đã gửi trong vòng 60s thì không cho gửi lại
        OtpData existing = otpStorage.get(key);
        if (existing != null && (currentTime - existing.lastSentTime) < RATE_LIMIT_MILLIS) {
            long remainingSeconds = (RATE_LIMIT_MILLIS - (currentTime - existing.lastSentTime)) / 1000;
            throw new RuntimeException("Vui lòng đợi " + remainingSeconds + " giây trước khi gửi lại OTP");
        }

        String code = String.format("%06d",
                ThreadLocalRandom.current().nextInt(0, 1000000)); // 000000–999999

        long expiryTime = currentTime + EXPIRE_MILLIS;
        otpStorage.put(key, new OtpData(code, expiryTime, currentTime));

        // Log OTP (chỉ log, không in console - OTP sẽ được gửi qua email)
        // Chỉ log trong môi trường development để debug
        if (purpose.equals("RESET_PASSWORD")) {
            // OTP reset password sẽ được gửi qua email, không cần log
            // Chỉ log trong trường hợp cần debug
        } else {
            // Các OTP khác (như REGISTER) vẫn có thể log để debug
            System.out.println("=== OTP "+ purpose +" ===");
            System.out.println("Key: " + key + " | OTP: " + code);
            System.out.println("Expiry: " + (expiryTime - currentTime) / 1000 + " seconds");
            System.out.println("====================");
        }

        return code;
    }

    @Override
    public boolean validateOtp(String key, String otp) {
        OtpData data = otpStorage.get(key);
        if (data == null) {
            return false; // chưa tạo OTP hoặc đã xóa
        }

        // hết hạn
        if (System.currentTimeMillis() > data.expiryTime) {
            otpStorage.remove(key);
            return false;
        }

        boolean ok = data.code.equals(otp);
        if (ok) {
            // Dùng xong thì xóa luôn => OTP 1 lần
            otpStorage.remove(key);
        }
        return ok;
    }
}
