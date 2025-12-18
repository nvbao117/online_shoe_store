package com.example.online_shoe_store.Controller;

import com.example.online_shoe_store.Entity.Payment;
import com.example.online_shoe_store.Entity.enums.PaymentStatus;
import com.example.online_shoe_store.Service.PaymentService;
import com.example.online_shoe_store.dto.request.PaymentCreateRequest;
import com.example.online_shoe_store.dto.request.RefundRequest;
import com.example.online_shoe_store.dto.response.PaymentDetailResponse;
import com.example.online_shoe_store.dto.response.PaymentResponse;
import com.example.online_shoe_store.dto.response.RefundResponse;
import com.example.online_shoe_store.exception.BusinessException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.net.URI;
import java.util.HashMap;
import java.util.Map;

/**
 * REST controller for payment operations.
 * Handles payment creation and gateway callbacks.
 */
@RestController
@RequestMapping(value = "/api/payments", produces = MediaType.APPLICATION_JSON_VALUE)
@RequiredArgsConstructor
@Slf4j
public class PaymentController {

    private final PaymentService paymentService;

    @PostMapping("/create")
    public ResponseEntity<PaymentResponse> createPayment(
            @Valid @RequestBody PaymentCreateRequest request,
            HttpServletRequest httpRequest) {

        String ipAddress = getClientIpAddress(httpRequest);
        log.info("Creating payment for order: {}, method: {}, IP: {}",
                request.getOrderId(), request.getPaymentMethod(), ipAddress);

        try {
            PaymentResponse response = paymentService.createPayment(request, ipAddress);
            return ResponseEntity.ok(response);
        } catch (BusinessException ex) {
            log.error("Business error creating payment: {}", ex.getMessage());
            return ResponseEntity.status(ex.getHttpStatus())
                    .body(PaymentResponse.builder()
                            .success(false)
                            .message(ex.getMessage())
                            .build());
        }
    }


    @GetMapping("/vnpay/callback")
    public ResponseEntity<Void> vnpayCallback(@RequestParam Map<String, String> params) {
        log.info("VNPay callback received with params: {}", params);

        try {
            PaymentResponse response = paymentService.processVNPayCallback(params);

            // Extract paymentId and get orderId from payment
            String paymentId = params.get("vnp_TxnRef");
            
            // Get orderId from payment details
            PaymentDetailResponse paymentDetails = paymentService.getPaymentDetails(paymentId);
            String orderId = paymentDetails.getOrderId();

            String redirectUrl = response.isSuccess()
                    ? "/checkout/success?orderId=" + orderId
                    : "/checkout/failure?orderId=" + orderId + "&code=" + params.get("vnp_ResponseCode");

            return ResponseEntity.status(HttpStatus.FOUND)
                    .location(URI.create(redirectUrl))
                    .build();
        } catch (Exception e) {
            log.error("Error processing VNPay callback", e);
            return ResponseEntity.status(HttpStatus.FOUND)
                    .location(URI.create("/checkout/failure?error=callback_error"))
                    .build();
        }
    }


    @GetMapping("/vnpay/ipn")
    public ResponseEntity<Map<String, String>> vnpayIPN(@RequestParam Map<String, String> params) {
        log.info("VNPay IPN received: {}", params);

        try {
            PaymentResponse response = paymentService.processVNPayCallback(params);

            Map<String, String> result = new HashMap<>();
            if (response.isSuccess()) {
                result.put("RspCode", "00");
                result.put("Message", "Confirm Success");
            } else {
                result.put("RspCode", "99");
                result.put("Message", "Confirm Fail: " + response.getMessage());
            }

            return ResponseEntity.ok(result);
        } catch (Exception e) {
            log.error("Error processing VNPay IPN", e);
            Map<String, String> result = new HashMap<>();
            result.put("RspCode", "99");
            result.put("Message", "IPN processing error");
            return ResponseEntity.ok(result);
        }
    }

    /**
     * Get payment status by payment ID
     */
    @GetMapping("/status/{paymentId}")
    public ResponseEntity<PaymentResponse> getPaymentStatus(@PathVariable String paymentId) {
        log.info("Getting payment status for payment: {}", paymentId);

        try {
            PaymentResponse response = paymentService.checkPaymentStatus(paymentId);
            return ResponseEntity.ok(response);
        } catch (BusinessException ex) {
            log.error("Error getting payment status: {}", ex.getMessage());
            return ResponseEntity.status(ex.getHttpStatus())
                    .body(PaymentResponse.builder()
                            .success(false)
                            .message(ex.getMessage())
                            .build());
        }
    }

    /**
     * Get payment details by payment ID
     */
    @GetMapping("/{paymentId}")
    public ResponseEntity<PaymentDetailResponse> getPaymentDetails(@PathVariable String paymentId) {
        log.info("Getting payment details for payment: {}", paymentId);

        try {
            PaymentDetailResponse response = paymentService.getPaymentDetails(paymentId);
            return ResponseEntity.ok(response);
        } catch (BusinessException ex) {
            log.error("Error getting payment details: {}", ex.getMessage());
            return ResponseEntity.status(ex.getHttpStatus()).build();
        }
    }

    /**
     * Get all payments for an order
     */
    @GetMapping("/order/{orderId}")
    public ResponseEntity<Page<PaymentResponse>> getPaymentsByOrder(
            @PathVariable String orderId,
            Pageable pageable) {

        log.info("Getting payments for order: {}", orderId);
        Page<Payment> payments = paymentService.getPaymentsByOrder(orderId, pageable);

        // Convert Payment entities to PaymentResponse DTOs
        Page<PaymentResponse> responsePage = payments.map(payment ->
                PaymentResponse.builder()
                        .success(payment.getPaymentStatus() == PaymentStatus.COMPLETED)
                        .message("Payment details")
                        .paymentId(payment.getPaymentId())
                        .transactionId(payment.getTransactionId())
                        .status(payment.getPaymentStatus())
                        .build()
        );

        return ResponseEntity.ok(responsePage);
    }

    /**
     * Get all payments for a user
     */
    @GetMapping("/user/{userId}")
    public ResponseEntity<Page<PaymentResponse>> getPaymentsByUser(
            @PathVariable String userId,
            Pageable pageable) {

        log.info("Getting payments for user: {}", userId);
        Page<Payment> payments = paymentService.getPaymentsByUser(userId, pageable);

        // Convert Payment entities to PaymentResponse DTOs
        Page<PaymentResponse> responsePage = payments.map(payment ->
                PaymentResponse.builder()
                        .success(payment.getPaymentStatus() == PaymentStatus.COMPLETED)
                        .message("Payment details")
                        .paymentId(payment.getPaymentId())
                        .transactionId(payment.getTransactionId())
                        .status(payment.getPaymentStatus())
                        .build()
        );

        return ResponseEntity.ok(responsePage);
    }

    /**
     * Process refund for an order
     */
    @PostMapping("/refund")
    public ResponseEntity<RefundResponse> processRefund(@Valid @RequestBody RefundRequest request) {
        log.info("Processing refund for order: {}", request.getOrderId());

        try {
            RefundResponse response = paymentService.processRefund(request);
            return ResponseEntity.ok(response);
        } catch (BusinessException ex) {
            log.error("Error processing refund: {}", ex.getMessage());
            return ResponseEntity.status(ex.getHttpStatus())
                    .body(RefundResponse.builder()
                            .success(false)
                            .message(ex.getMessage())
                            .build());
        }
    }

    /**
     * Cancel a pending payment
     */
    @PostMapping("/cancel/{paymentId}")
    public ResponseEntity<PaymentResponse> cancelPayment(
            @PathVariable String paymentId,
            @RequestParam(required = false) String reason) {

        log.info("Cancelling payment: {}, reason: {}", paymentId, reason);

        try {
            paymentService.cancelPayment(paymentId, reason);
            return ResponseEntity.ok(PaymentResponse.builder()
                    .success(true)
                    .message("Payment cancelled successfully")
                    .paymentId(paymentId)
                    .build());
        } catch (BusinessException ex) {
            log.error("Error cancelling payment: {}", ex.getMessage());
            return ResponseEntity.status(ex.getHttpStatus())
                    .body(PaymentResponse.builder()
                            .success(false)
                            .message(ex.getMessage())
                            .paymentId(paymentId)
                            .build());
        }
    }

    /**
     * Extracts client IP address from the request.
     */
    private String getClientIpAddress(HttpServletRequest request) {
        String xForwardedFor = request.getHeader("X-Forwarded-For");
        if (xForwardedFor != null && !xForwardedFor.isEmpty()) {
            return xForwardedFor.split(",")[0].trim();
        }

        String xRealIp = request.getHeader("X-Real-IP");
        if (xRealIp != null && !xRealIp.isEmpty()) {
            return xRealIp;
        }

        return request.getRemoteAddr();
    }
}