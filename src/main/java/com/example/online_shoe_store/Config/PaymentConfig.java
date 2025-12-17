package com.example.online_shoe_store.Config;

import lombok.Getter;
import lombok.Setter;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

/**
 * Configuration class for VNPay and Momo payment gateways.
 * Credentials are loaded from application.properties.
 */
@Configuration
@ConfigurationProperties(prefix = "payment")
@Getter
@Setter
public class PaymentConfig {
    
    private VNPay vnpay = new VNPay();

    @Getter
    @Setter
    public static class VNPay {
        /** Merchant code from VNPay */
        private String tmnCode;
        
        /** Secret key for HMAC-SHA512 signature */
        private String hashSecret;
        
        /** VNPay payment URL (sandbox or production) */
        private String payUrl = "https://sandbox.vnpayment.vn/paymentv2/vpcpay.html";
        
        /** Your return URL after payment */
        private String returnUrl;
        private String refundUrl;
        private String refundIp;

        /** VNPay query API URL */
        private String queryUrl = "https://sandbox.vnpayment.vn/merchant_webapi/api/transaction";
    }

}
