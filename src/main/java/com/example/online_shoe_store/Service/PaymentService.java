package com.example.online_shoe_store.Service;

import com.example.online_shoe_store.Entity.Order;
import com.example.online_shoe_store.Entity.Payment;
import com.example.online_shoe_store.Entity.PaymentMethod;
import com.example.online_shoe_store.Entity.enums.NotificationType;
import com.example.online_shoe_store.Entity.enums.OrderStatus;
import com.example.online_shoe_store.Entity.enums.PaymentStatus;
import com.example.online_shoe_store.Entity.enums.PaymentType;
import com.example.online_shoe_store.Repository.OrderRepository;
import com.example.online_shoe_store.Repository.PaymentMethodRepository;
import com.example.online_shoe_store.Repository.PaymentRepository;
import com.example.online_shoe_store.dto.request.PaymentCreateRequest;
import com.example.online_shoe_store.dto.request.RefundRequest;
import com.example.online_shoe_store.dto.response.PaymentDetailResponse;
import com.example.online_shoe_store.dto.response.PaymentResponse;
import com.example.online_shoe_store.dto.response.RefundResponse;
import com.example.online_shoe_store.exception.order.InvalidOrderStatusException;
import com.example.online_shoe_store.exception.order.OrderAlreadyPaidException;
import com.example.online_shoe_store.exception.order.OrderNotFoundException;
import com.example.online_shoe_store.exception.payment.*;
import com.example.online_shoe_store.exception.validation.InvalidAmountException;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.concurrent.ConcurrentHashMap;

@Service
@RequiredArgsConstructor
@Slf4j
public class PaymentService {

    private final PaymentRepository paymentRepository;
    private final PaymentMethodRepository paymentMethodRepository;
    private final OrderRepository orderRepository;
    private final VNPayService vnPayService;
    private final NotificationService notificationService;
    private final UserNotificationService userNotificationService;
    private final CheckoutService checkoutService;
    private final Map<String, Object> paymentLocks = new ConcurrentHashMap<>();

    @Transactional
    public PaymentResponse createPayment(PaymentCreateRequest request, String ipAddress) {
        String orderId = request.getOrderId();

        synchronized (paymentLocks.computeIfAbsent(orderId, k -> new Object())) {
            try {
                log.info("Creating payment for order: {}, method: {}", orderId, request.getPaymentMethod());
                Order order = orderRepository.findById(orderId)
                        .orElseThrow(() -> new OrderNotFoundException("Order not found: " + orderId));

                validateOrderForPayment(order);
                PaymentMethod paymentMethod = paymentMethodRepository
                        .findByMethodName(request.getPaymentMethod().toUpperCase())
                        .orElseThrow(() -> new PaymentMethodNotFoundException(
                                "PaymentMethod not found: " + request.getPaymentMethod()));

                if (!paymentMethod.getIsActive()) {
                    throw new PaymentMethodNotActiveException("Payment method is not active");
                }

                String methodName = request.getPaymentMethod().toUpperCase();
                List<Payment> existingPayments = paymentRepository.findByOrderOrderId(order.getOrderId());
                Optional<Payment> activePaymentOpt = existingPayments.stream()
                        .filter(p -> p.getPaymentStatus() == PaymentStatus.PENDING ||
                                p.getPaymentStatus() == PaymentStatus.PROCESSING)
                        .findFirst();

                if (activePaymentOpt.isPresent()) {
                    Payment existingPayment = activePaymentOpt.get();

                    if ("VNPAY".equals(methodName)) {
                        // Tái sử dụng url nếu còn hiệu lực
                        if (existingPayment.getPaymentUrl() != null &&
                                existingPayment.getUpdatedAt().isAfter(LocalDateTime.now().minusMinutes(15))) {
                            log.info("Reusing existing VNPay payment URL for order: {}", orderId);

                            return PaymentResponse.builder()
                                    .success(true)
                                    .message("Payment URL retrieved successfully")
                                    .paymentUrl(existingPayment.getPaymentUrl())
                                    .paymentId(existingPayment.getPaymentId())
                                    .status(existingPayment.getPaymentStatus())
                                    .build();
                        }
                        log.info("Deleting expired payment {} for retry", existingPayment.getPaymentId());

                        paymentRepository.delete(existingPayment);
                        paymentRepository.flush();
                    }
                }
                Payment payment = Payment.builder()
                        .order(order)
                        .paymentMethod(paymentMethod)
                        .amount(order.getTotalAmount())
                        .paymentStatus(PaymentStatus.PENDING)
                        .orderInfo("Thanh toán đơn hàng: " + order.getOrderId())
                        .clientIp(ipAddress)
                        .attemptCount(1)
                        .build();

                payment = paymentRepository.save(payment);
                log.info("Created payment record: {} for order: {}", payment.getPaymentId(), order.getOrderId());

                String paymentUrl = null;

                if ("VNPAY".equals(methodName)) {
                    paymentUrl = vnPayService.createPaymentUrl(
                            order,
                            payment.getPaymentId(),
                            request.getBankCode(),
                            request.getLanguage(),
                            ipAddress);

                    if (paymentUrl != null && !paymentUrl.isEmpty()) {
                        payment.setPaymentUrl(paymentUrl);
                        payment.setPaymentStatus(PaymentStatus.PENDING);
                        paymentRepository.save(payment);

                        order.setStatus(OrderStatus.AWAITING_PAYMENT);
                        order.setPaymentExpiryAt(LocalDateTime.now().plusHours(24));
                        orderRepository.save(order);
                    }
                } else if ("COD".equals(methodName)) {
                    payment.setPaymentStatus(PaymentStatus.COMPLETED);
                    payment.setPaymentDate(LocalDateTime.now());
                    paymentRepository.save(payment);

                    order.setStatus(OrderStatus.PENDING);
                    order.setConfirmedAt(LocalDateTime.now());
                    orderRepository.save(order);

                    log.info("COD payment auto-confirmed for order: {}", order.getOrderId());

                    notificationService.sendPaymentSuccessNotification(order, payment);

                    // Tạo thông báo in-app cho người dùng
                    userNotificationService.createNotification(
                            order.getUser(),
                            NotificationType.ORDER_UPDATE,
                            "Đặt hàng thành công",
                            "Đơn hàng #" + order.getOrderId().substring(0, 8)
                                    + "... đã được đặt thành công. Chúng tôi sẽ xác nhận và giao hàng sớm nhất!",
                            "🛒",
                            order.getOrderId());

                    return PaymentResponse.builder()
                            .success(true)
                            .message("COD order confirmed successfully")
                            .paymentId(payment.getPaymentId())
                            .status(PaymentStatus.COMPLETED)
                            .build();
                } else {
                    throw new UnsupportedPaymentMethodException("Unsupported payment method: " + methodName);
                }
                if (paymentUrl == null || paymentUrl.isEmpty()) {
                    payment.setPaymentStatus(PaymentStatus.FAILED);
                    payment.setFailureReason("Failed to generate payment URL");
                    paymentRepository.save(payment);

                    throw new PaymentProcessingException("Failed to generate payment URL");
                }

                return PaymentResponse.builder()
                        .success(true)
                        .message("Payment URL created successfully")
                        .paymentUrl(paymentUrl)
                        .paymentId(payment.getPaymentId())
                        .status(payment.getPaymentStatus())
                        .build();
            } finally {
                paymentLocks.remove(orderId);
            }
        }
    }

    @Transactional
    public PaymentResponse processVNPayCallback(Map<String, String> params) {
        log.info("Processing VNPay callback with params: {}", params);

        String vnp_TxnRef = params.get("vnp_TxnRef");
        String vnp_ResponseCode = params.get("vnp_ResponseCode");

        if (vnp_TxnRef == null) {
            log.error("Missing vnp_TxnRef in callback");
            throw new InvalidPaymentException("Missing transaction reference");
        }

        synchronized (paymentLocks.computeIfAbsent(vnp_TxnRef, k -> new Object())) {
            try {
                if (!vnPayService.validateCallBack(new HashMap<>(params))) {
                    log.error("VNPay callback signature validation failed for payment: {}", vnp_TxnRef);
                    throw new InvalidPaymentException("Invalid signature");
                }

                String paymentId = vnp_TxnRef;

                Payment payment = paymentRepository.findById(paymentId)
                        .orElseThrow(() -> new PaymentNotFoundException("Payment not found: " + paymentId));

                if (payment.getPaymentStatus() == PaymentStatus.COMPLETED) {
                    log.info("Payment already completed: {}", paymentId);
                    return PaymentResponse.builder()
                            .success(true)
                            .message("Payment already completed")
                            .paymentId(paymentId)
                            .status(PaymentStatus.COMPLETED)
                            .build();
                }

                String vnpAmount = params.get("vnp_Amount");
                if (vnpAmount == null) {
                    log.error("Missing amount in callback");
                    throw new InvalidPaymentException("Missing amount");
                }

                BigDecimal callbackAmount = new BigDecimal(vnpAmount).divide(BigDecimal.valueOf(100));

                if (callbackAmount.compareTo(payment.getAmount()) != 0) {
                    log.error("Amount mismatch! Payment: {}, Callback: {}",
                            payment.getAmount(), callbackAmount);

                    payment.setPaymentStatus(PaymentStatus.FAILED);
                    payment.setFailureReason("Amount mismatch");
                    paymentRepository.save(payment);

                    throw new PaymentProcessingException("Amount mismatch - possible fraud attempt");
                }

                Order order = payment.getOrder();
                boolean isSuccess = vnPayService.isPaymentSuccessful(vnp_ResponseCode);
                if (isSuccess) {
                    payment.setPaymentStatus(PaymentStatus.COMPLETED);
                    payment.setPaymentDate(LocalDateTime.now());
                    payment.setPayDate(LocalDateTime.now());
                    payment.setTransactionId(params.get("vnp_TransactionNo"));
                    payment.setResponseCode(vnp_ResponseCode);
                    payment.setBankCode(params.get("vnp_BankCode"));
                    payment.setCardType(params.get("vnp_CardType"));
                    paymentRepository.save(payment);

                    order.setStatus(OrderStatus.CONFIRMED);
                    order.setConfirmedAt(LocalDateTime.now());
                    order.setPaidAt(LocalDateTime.now());
                    orderRepository.save(order);

                    log.info("VNPay payment completed for order: {}", order.getOrderId());

                    // Soft delete cart items after successful payment
                    checkoutService.softDeleteCartItemsByOrderId(order.getOrderId());

                    notificationService.sendPaymentSuccessNotification(order, payment);

                    // Tạo thông báo in-app cho người dùng
                    userNotificationService.createNotification(
                            order.getUser(),
                            NotificationType.ORDER_UPDATE,
                            "Thanh toán thành công",
                            "Đơn hàng #" + order.getOrderId().substring(0, 8)
                                    + "... đã thanh toán thành công qua VNPay. Chúng tôi sẽ chuẩn bị hàng và giao sớm nhất!",
                            "✅",
                            order.getOrderId());
                } else {
                    payment.setPaymentStatus(PaymentStatus.FAILED);
                    payment.setResponseCode(vnp_ResponseCode);
                    payment.setFailureReason(getVNPayErrorDescription(vnp_ResponseCode));
                    paymentRepository.save(payment);

                    order.setStatus(OrderStatus.PAYMENT_FAILED);
                    orderRepository.save(order);

                    log.warn("VNPay payment failed for order: {} with code: {}",
                            order.getOrderId(), vnp_ResponseCode);

                    notificationService.sendPaymentFailureNotification(order, payment);

                    // Thông báo in-app khi thanh toán thất bại
                    userNotificationService.createNotification(
                            order.getUser(),
                            NotificationType.ORDER_UPDATE,
                            "Thanh toán thất bại",
                            "Thanh toán cho đơn hàng #" + order.getOrderId().substring(0, 8)
                                    + "... không thành công. Vui lòng thử lại!",
                            "❌",
                            order.getOrderId());
                }

                return PaymentResponse.builder()
                        .success(isSuccess)
                        .message(isSuccess ? "Payment successful"
                                : "Payment failed: " + getVNPayErrorDescription(vnp_ResponseCode))
                        .paymentId(payment.getPaymentId())
                        .transactionId(params.get("vnp_TransactionNo"))
                        .status(payment.getPaymentStatus())
                        .build();
            } finally {
                paymentLocks.remove(vnp_TxnRef);
            }
        }
    }

    @Transactional
    public PaymentResponse checkPaymentStatus(String paymentId) {
        Payment payment = paymentRepository.findById(paymentId)
                .orElseThrow(() -> new PaymentNotFoundException("Payment not found: " + paymentId));

        Order order = payment.getOrder();

        if (payment.getPaymentStatus() == PaymentStatus.PENDING &&
                order.getPaymentExpiryAt() != null &&
                order.getPaymentExpiryAt().isBefore(LocalDateTime.now())) {
            payment.setPaymentStatus(PaymentStatus.EXPIRED);
            paymentRepository.save(payment);

            order.setStatus(OrderStatus.EXPIRED);
            order.setExpiredAt(LocalDateTime.now());
            orderRepository.save(order);

            log.info("Payment expired: {}", paymentId);
        }
        return PaymentResponse.builder()
                .success(payment.getPaymentStatus() == PaymentStatus.COMPLETED)
                .message("Payment status: " + payment.getPaymentStatus().getDescription())
                .paymentId(paymentId)
                .status(payment.getPaymentStatus())
                .transactionId(payment.getTransactionId())
                .build();
    }

    @Transactional
    public RefundResponse processRefund(RefundRequest request) {
        String orderId = request.getOrderId();

        synchronized (paymentLocks.computeIfAbsent(orderId, k -> new Object())) {
            try {
                Order order = orderRepository.findById(orderId)
                        .orElseThrow(() -> new OrderNotFoundException("Order not found: " + orderId));

                // Validate order for refund
                if (order.getStatus() != OrderStatus.COMPLETED &&
                        order.getStatus() != OrderStatus.DELIVERED &&
                        order.getStatus() != OrderStatus.RETURNED) {
                    throw new InvalidOrderStatusException(
                            "Order cannot be refunded. Current status: " + order.getStatus());
                }

                Payment originalPayment = order.getSuccessfulPayment();
                if (originalPayment == null) {
                    throw new PaymentNotFoundException("No successful payment found for order");
                }

                BigDecimal refundAmount = request.getRefundAmount();

                if (refundAmount == null || refundAmount.compareTo(BigDecimal.ZERO) <= 0) {
                    throw new InvalidAmountException("Refund amount must be greater than 0");
                }

                if (refundAmount.compareTo(originalPayment.getAmount()) > 0) {
                    throw new InvalidAmountException("Refund amount cannot exceed original payment amount");
                }
                Payment refundPayment = Payment.builder()
                        .order(order)
                        .paymentMethod(originalPayment.getPaymentMethod())
                        .amount(refundAmount.negate()) // Negative amount for refund
                        .paymentStatus(PaymentStatus.PENDING)
                        .paymentType(PaymentType.REFUND)
                        .orderInfo("Hoàn tiền đơn hàng: " + orderId + " - " + request.getReason())
                        .parentPaymentId(originalPayment.getPaymentId())
                        .build();

                refundPayment = paymentRepository.save(refundPayment);
                boolean refundSuccess = false;
                String transactionId = null;

                if ("VNPAY".equals(originalPayment.getBankCode())) {
                    Map<String, String> refundResult = vnPayService.processRefund(
                            originalPayment.getTransactionId(),
                            refundAmount,
                            request.getReason());

                    refundSuccess = "00".equals(refundResult.get("vnp_ResponseCode"));
                    transactionId = refundResult.get("vnp_TransactionNo");

                } else if ("COD".equals(originalPayment.getPaymentMethod().getMethodName())) {
                    // COD refund - manual processing
                    refundSuccess = true;
                }
                if (refundSuccess) {
                    refundPayment.setPaymentStatus(PaymentStatus.COMPLETED);
                    refundPayment.setPaymentDate(LocalDateTime.now());
                    refundPayment.setTransactionId(transactionId);
                    paymentRepository.save(refundPayment);

                    // Update order status
                    if (refundAmount.compareTo(originalPayment.getAmount()) == 0) {
                        order.setStatus(OrderStatus.REFUNDED);
                    } else {
                        order.setStatus(OrderStatus.PARTIALLY_REFUNDED);
                    }
                    orderRepository.save(order);

                    log.info("Refund processed successfully for order: {}, amount: {}",
                            orderId, refundAmount);

                    notificationService.sendRefundNotification(order, refundPayment);

                } else {
                    refundPayment.setPaymentStatus(PaymentStatus.FAILED);
                    refundPayment.setFailureReason("Refund failed");
                    paymentRepository.save(refundPayment);

                    throw new PaymentProcessingException("Refund processing failed");
                }

                return RefundResponse.builder()
                        .success(true)
                        .message("Refund processed successfully")
                        .refundId(refundPayment.getPaymentId())
                        .refundAmount(refundAmount)
                        .transactionId(transactionId)
                        .status(refundPayment.getPaymentStatus())
                        .build();
            } finally {
                paymentLocks.remove(orderId);
            }
        }
    }

    public PaymentDetailResponse getPaymentDetails(String paymentId) {
        Payment payment = paymentRepository.findById(paymentId)
                .orElseThrow(() -> new PaymentNotFoundException("Payment not found: " + paymentId));

        return PaymentDetailResponse.builder()
                .paymentId(payment.getPaymentId())
                .orderId(payment.getOrder().getOrderId())
                .amount(payment.getAmount())
                .paymentStatus(payment.getPaymentStatus())
                .paymentMethod(payment.getPaymentMethod().getMethodName())
                .paymentDate(payment.getPaymentDate())
                .createdAt(payment.getCreatedAt())
                .bankCode(payment.getBankCode())
                .cardType(payment.getCardType())
                .paymentUrl(payment.getPaymentUrl())
                .failureReason(payment.getFailureReason())
                .build();
    }

    public Page<Payment> getPaymentsByOrder(String orderId, Pageable pageable) {
        return paymentRepository.findByOrderOrderId(orderId, pageable);
    }

    public Page<Payment> getPaymentsByUser(String userId, Pageable pageable) {
        return paymentRepository.findByOrderUserId(userId, pageable);
    }

    @Transactional
    public void cancelPayment(String paymentId, String reason) {
        Payment payment = paymentRepository.findById(paymentId)
                .orElseThrow(() -> new PaymentNotFoundException("Payment not found: " + paymentId));

        if (payment.getPaymentStatus() != PaymentStatus.PENDING) {
            throw new InvalidPaymentStatusException("Cannot cancel payment with status: " + payment.getPaymentStatus());
        }

        payment.setPaymentStatus(PaymentStatus.CANCELLED);
        payment.setCancelledAt(LocalDateTime.now());
        payment.setFailureReason(reason);
        paymentRepository.save(payment);

        // Update order status if needed
        Order order = payment.getOrder();
        if (order.getStatus() == OrderStatus.AWAITING_PAYMENT) {
            order.setStatus(OrderStatus.PENDING);
            orderRepository.save(order);
        }

        log.info("Payment cancelled: {}, reason: {}", paymentId, reason);
    }

    private void validateOrderForPayment(Order order) {
        // Check if order exists
        if (order == null) {
            throw new OrderNotFoundException("Order not found");
        }

        // Check if order is in valid state for payment
        if (!order.canBePaid()) {
            throw new InvalidOrderStatusException(
                    "Order cannot be paid. Current status: " + order.getStatus());
        }

        // Check if payment is expired
        if (order.isPaymentExpired()) {
            order.setStatus(OrderStatus.EXPIRED);
            order.setExpiredAt(LocalDateTime.now());
            orderRepository.save(order);
            throw new PaymentExpiredException("Payment period has expired");
        }

        // Check order amount
        if (order.getTotalAmount() == null || order.getTotalAmount().compareTo(BigDecimal.ZERO) <= 0) {
            throw new InvalidAmountException("Order amount must be greater than 0");
        }

        // Check if order already has a successful payment
        if (order.isPaid()) {
            throw new OrderAlreadyPaidException("Order already has a completed payment");
        }
    }

    private String getVNPayErrorDescription(String responseCode) {
        switch (responseCode) {
            case "00":
                return "Giao dịch thành công";
            case "07":
                return "Trừ tiền thành công. Giao dịch bị nghi ngờ (liên quan tới lừa đảo, giao dịch bất thường).";
            case "09":
                return "Giao dịch không thành công do: Thẻ/Tài khoản của khách hàng chưa đăng ký dịch vụ InternetBanking tại ngân hàng.";
            case "10":
                return "Giao dịch không thành công do: Khách hàng xác thực thông tin thẻ/tài khoản không đúng quá 3 lần";
            case "11":
                return "Giao dịch không thành công do: Đã hết hạn chờ thanh toán. Xin quý khách vui lòng thực hiện lại giao dịch.";
            case "12":
                return "Giao dịch không thành công do: Thẻ/Tài khoản của khách hàng bị khóa.";
            case "13":
                return "Giao dịch không thành công do Quý khách nhập sai mật khẩu xác thực giao dịch (OTP). Xin quý khách vui lòng thực hiện lại giao dịch.";
            case "24":
                return "Giao dịch không thành công do: Khách hàng hủy giao dịch";
            case "51":
                return "Giao dịch không thành công do: Tài khoản của quý khách không đủ số dư để thực hiện giao dịch.";
            case "65":
                return "Giao dịch không thành công do: Tài khoản của Quý khách đã vượt quá hạn mức giao dịch trong ngày.";
            case "75":
                return "Ngân hàng thanh toán đang bảo trì.";
            case "79":
                return "Giao dịch không thành công do: KH nhập sai mật khẩu thanh toán quá số lần quy định. Xin quý khách vui lòng thực hiện lại giao dịch";
            case "99":
                return "Các lỗi khác (lỗi còn lại, không có trong danh sách mã lỗi đã liệt kê)";
            default:
                return "Lỗi không xác định. Mã lỗi: " + responseCode;
        }
    }
}
