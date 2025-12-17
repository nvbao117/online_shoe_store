package com.example.online_shoe_store.Service;

import com.example.online_shoe_store.Entity.Order;
import com.example.online_shoe_store.config.PaymentConfig;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import java.math.BigDecimal;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;


@Service
@RequiredArgsConstructor
@Slf4j
public class VNPayService {
    private final PaymentConfig paymentConfig;
    private final RestTemplate restTemplate;

    private static final String VNP_VERSION = "2.1.0";
    private static final String VNP_COMMAND_PAY = "pay";
    private static final String VNP_COMMAND_REFUND = "refund";
    private static final String VNP_CURR_CODE = "VND";
    private static final String VNP_ORDER_TYPE = "other";
    private static final String VNP_TRANSACTION_TYPE_REFUND = "02";

    /**
     * Create payment URL for VNPay gateway
     */
    public String createPaymentUrl(Order order, String paymentId, String bankCode,
                                   String language, String ipAddress) {
        // Use paymentId as vnp_TxnRef to allow retry (each retry = new paymentId)
        String vnpTxnRef = paymentId;
        String vnpOrderInfo = "Thanh toán đơn hàng: " + order.getOrderId();

        long amount = order.getTotalAmount().multiply(BigDecimal.valueOf(100)).longValue();
        Map<String, String> vnpParams = new TreeMap<>();
        vnpParams.put("vnp_Version", VNP_VERSION);
        vnpParams.put("vnp_Command", VNP_COMMAND_PAY);
        vnpParams.put("vnp_TmnCode", paymentConfig.getVnpay().getTmnCode());
        vnpParams.put("vnp_Amount", String.valueOf(amount));
        vnpParams.put("vnp_CurrCode", VNP_CURR_CODE);
        vnpParams.put("vnp_TxnRef", vnpTxnRef);
        vnpParams.put("vnp_OrderInfo", vnpOrderInfo);
        vnpParams.put("vnp_OrderType", VNP_ORDER_TYPE);
        vnpParams.put("vnp_Locale", language != null ? language : "vn");
        vnpParams.put("vnp_ReturnUrl", paymentConfig.getVnpay().getReturnUrl());
        vnpParams.put("vnp_IpAddr", ipAddress != null ? ipAddress : "127.0.0.1");
        vnpParams.put("vnp_CreateDate", formatDateTime(LocalDateTime.now()));
        vnpParams.put("vnp_ExpireDate", formatDateTime(LocalDateTime.now().plusMinutes(15)));

        if (bankCode != null && !bankCode.isEmpty()) {
            vnpParams.put("vnp_BankCode", bankCode);
        }

        // Build query string and hash data
        String queryString = buildQueryString(vnpParams);
        String vnpSecureHash = hmacSHA512(paymentConfig.getVnpay().getHashSecret(),
                extractHashData(vnpParams));

        String paymentUrl = paymentConfig.getVnpay().getPayUrl() + "?" + queryString +
                "&vnp_SecureHash=" + vnpSecureHash;

        log.info("Generated VNPay payment URL for order: {} with paymentId: {}",
                order.getOrderId(), paymentId);
        log.debug("Payment URL: {}", paymentUrl);

        return paymentUrl;
    }

    /**
     * Process refund through VNPay
     */
    public Map<String, String> processRefund(String originalTransactionId,
                                             BigDecimal refundAmount,
                                             String reason) {
        log.info("Processing refund for transaction: {}, amount: {}, reason: {}",
                originalTransactionId, refundAmount, reason);

        // In production, you would need to store the original transaction date
        // For now, we'll use current date
        String transactionDate = formatDateTime(LocalDateTime.now());

        Map<String, String> vnpParams = new TreeMap<>();
        vnpParams.put("vnp_Version", VNP_VERSION);
        vnpParams.put("vnp_Command", VNP_COMMAND_REFUND);
        vnpParams.put("vnp_TmnCode", paymentConfig.getVnpay().getTmnCode());
        vnpParams.put("vnp_TransactionType", VNP_TRANSACTION_TYPE_REFUND);
        vnpParams.put("vnp_TxnRef", generateRefundTxnRef()); // New transaction reference for refund
        vnpParams.put("vnp_Amount", refundAmount.multiply(BigDecimal.valueOf(100)).toString());
        vnpParams.put("vnp_OrderInfo", "Hoàn tiền: " + reason);
        vnpParams.put("vnp_TransactionNo", originalTransactionId);
        vnpParams.put("vnp_TransactionDate", transactionDate);
        vnpParams.put("vnp_CreateDate", formatDateTime(LocalDateTime.now()));
        vnpParams.put("vnp_IpAddr", paymentConfig.getVnpay().getRefundIp());
        vnpParams.put("vnp_CreateBy", "MERCHANT");

        // Build query string
        String queryString = buildQueryString(vnpParams);
        String vnpSecureHash = hmacSHA512(paymentConfig.getVnpay().getHashSecret(),
                extractHashData(vnpParams));

        // Add secure hash
        queryString += "&vnp_SecureHash=" + vnpSecureHash;

        // Call VNPay refund API
        String refundUrl = paymentConfig.getVnpay().getRefundUrl();
        Map<String, String> requestParams = new HashMap<>();
        requestParams.put("vnp_RequestData", queryString);

        try {
            // In production, you would make an HTTP POST request to VNPay
            // For simulation, we'll return a mock response
            log.info("Calling VNPay refund API: {}", refundUrl);
            log.info("Refund request data: {}", queryString);

            // Simulate API call
            Map<String, String> response = new HashMap<>();

            // Simulate successful refund (00 = success in VNPay)
            response.put("vnp_ResponseCode", "00");
            response.put("vnp_Message", "Refund Success");
            response.put("vnp_TxnRef", vnpParams.get("vnp_TxnRef"));
            response.put("vnp_TransactionNo", UUID.randomUUID().toString().substring(0, 12));
            response.put("vnp_TransactionDate", transactionDate);
            response.put("vnp_TransactionType", VNP_TRANSACTION_TYPE_REFUND);
            response.put("vnp_Amount", vnpParams.get("vnp_Amount"));

            log.info("Refund response: {}", response);
            return response;

        } catch (Exception e) {
            log.error("Error calling VNPay refund API", e);

            Map<String, String> errorResponse = new HashMap<>();
            errorResponse.put("vnp_ResponseCode", "99");
            errorResponse.put("vnp_Message", "Refund failed: " + e.getMessage());
            return errorResponse;
        }
    }

    /**
     * Validate VNPay callback signature
     */
    public boolean validateCallBack(Map<String, String> params) {
        String vnpSecureHash = params.get("vnp_SecureHash");
        if (vnpSecureHash == null || vnpSecureHash.isEmpty()) {
            log.error("VNPay callback missing vnp_SecureHash");
            return false;
        }

        Map<String, String> sortedParams = new TreeMap<>(params);
        sortedParams.remove("vnp_SecureHash");
        sortedParams.remove("vnp_SecureHashType");

        String hashData = extractHashData(sortedParams);
        String calculatedHash = hmacSHA512(paymentConfig.getVnpay().getHashSecret(), hashData);

        boolean isValid = calculatedHash.equalsIgnoreCase(vnpSecureHash);

        if (!isValid) {
            log.error("VNPay callback signature validation failed");
            log.debug("Expected hash: {}, Calculated hash: {}", vnpSecureHash, calculatedHash);
        } else {
            log.info("VNPay callback signature validated successfully");
        }

        return isValid;
    }

    /**
     * Check if payment was successful based on response code
     */
    public boolean isPaymentSuccessful(String responseCode) {
        return "00".equals(responseCode);
    }

    /**
     * Generate refund transaction reference
     */
    private String generateRefundTxnRef() {
        return "REFUND_" + System.currentTimeMillis() + "_" +
                UUID.randomUUID().toString().substring(0, 8);
    }

    /**
     * Build query string from parameters
     */
    private String buildQueryString(Map<String, String> params) {
        StringBuilder query = new StringBuilder();
        for (Map.Entry<String, String> entry : params.entrySet()) {
            if (query.length() > 0) {
                query.append("&");
            }
            String encodedValue = URLEncoder.encode(entry.getValue(), StandardCharsets.US_ASCII);
            query.append(entry.getKey()).append("=").append(encodedValue);
        }
        return query.toString();
    }

    /**
     * Extract hash data from parameters
     */
    private String extractHashData(Map<String, String> params) {
        StringBuilder hashData = new StringBuilder();
        for (Map.Entry<String, String> entry : params.entrySet()) {
            if (entry.getValue() != null && !entry.getValue().isEmpty()) {
                if (hashData.length() > 0) {
                    hashData.append("&");
                }
                String encodedValue = URLEncoder.encode(entry.getValue(), StandardCharsets.US_ASCII);
                hashData.append(entry.getKey()).append("=").append(encodedValue);
            }
        }
        return hashData.toString();
    }

    /**
     * Calculate HMAC-SHA512 signature
     */
    private String hmacSHA512(String key, String data) {
        try {
            Mac hmac = Mac.getInstance("HmacSHA512");
            SecretKeySpec secretKeySpec = new SecretKeySpec(
                    key.getBytes(StandardCharsets.UTF_8),
                    "HmacSHA512"
            );
            hmac.init(secretKeySpec);
            byte[] hash = hmac.doFinal(data.getBytes(StandardCharsets.UTF_8));

            StringBuilder result = new StringBuilder();
            for (byte b : hash) {
                result.append(String.format("%02x", b));
            }
            return result.toString();
        } catch (Exception e) {
            log.error("Error calculating HMAC-SHA512", e);
            throw new RuntimeException("Error calculating HMAC-SHA512", e);
        }
    }

    /**
     * Format LocalDateTime for VNPay (yyyyMMddHHmmss)
     */
    private String formatDateTime(LocalDateTime dateTime) {
        return dateTime.format(DateTimeFormatter.ofPattern("yyyyMMddHHmmss"));
    }

    /**
     * Parse VNPay date string to LocalDateTime
     */
    public LocalDateTime parseVNPayDate(String dateString) {
        if (dateString == null || dateString.isEmpty()) {
            return null;
        }
        try {
            return LocalDateTime.parse(dateString, DateTimeFormatter.ofPattern("yyyyMMddHHmmss"));
        } catch (Exception e) {
            log.error("Error parsing VNPay date: {}", dateString, e);
            return null;
        }
    }

    /**
     * Get error description for VNPay response code
     */
    public String getErrorDescription(String responseCode) {
        switch (responseCode) {
            case "00": return "Giao dịch thành công";
            case "07": return "Trừ tiền thành công. Giao dịch bị nghi ngờ (liên quan tới lừa đảo, giao dịch bất thường).";
            case "09": return "Giao dịch không thành công do: Thẻ/Tài khoản của khách hàng chưa đăng ký dịch vụ InternetBanking tại ngân hàng.";
            case "10": return "Giao dịch không thành công do: Khách hàng xác thực thông tin thẻ/tài khoản không đúng quá 3 lần";
            case "11": return "Giao dịch không thành công do: Đã hết hạn chờ thanh toán. Xin quý khách vui lòng thực hiện lại giao dịch.";
            case "12": return "Giao dịch không thành công do: Thẻ/Tài khoản của khách hàng bị khóa.";
            case "13": return "Giao dịch không thành công do Quý khách nhập sai mật khẩu xác thực giao dịch (OTP). Xin quý khách vui lòng thực hiện lại giao dịch.";
            case "24": return "Giao dịch không thành công do: Khách hàng hủy giao dịch";
            case "51": return "Giao dịch không thành công do: Tài khoản của quý khách không đủ số dư để thực hiện giao dịch.";
            case "65": return "Giao dịch không thành công do: Tài khoản của Quý khách đã vượt quá hạn mức giao dịch trong ngày.";
            case "75": return "Ngân hàng thanh toán đang bảo trì.";
            case "79": return "Giao dịch không thành công do: KH nhập sai mật khẩu thanh toán quá số lần quy định. Xin quý khách vui lòng thực hiện lại giao dịch";
            case "99": return "Các lỗi khác (lỗi còn lại, không có trong danh sách mã lỗi đã liệt kê)";
            default: return "Lỗi không xác định. Mã lỗi: " + responseCode;
        }
    }
}