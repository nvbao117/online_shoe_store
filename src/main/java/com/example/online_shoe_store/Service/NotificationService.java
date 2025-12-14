package com.example.online_shoe_store.Service;

import com.example.online_shoe_store.Entity.Order;
import com.example.online_shoe_store.Entity.Payment;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@Slf4j
public class NotificationService {

    public void sendPaymentSuccessNotification(Order order, Payment payment) {
        // TODO: Implement actual notification (email, SMS, push notification, etc.)
        log.info("✅ Payment successful notification sent for order: {}", order.getOrderId());
        log.info("💰 Amount: {}, Transaction: {}", payment.getAmount(), payment.getTransactionId());
    }

    public void sendPaymentFailureNotification(Order order, Payment payment) {
        // TODO: Implement actual notification
        log.warn("❌ Payment failed notification sent for order: {}", order.getOrderId());
        log.warn("Failure reason: {}", payment.getFailureReason());
    }

    public void sendRefundNotification(Order order, Payment refundPayment) {
        // TODO: Implement actual notification
        log.info("🔄 Refund notification sent for order: {}", order.getOrderId());
        log.info("Refund amount: {}", refundPayment.getAmount());
    }

    public void sendOrderConfirmationNotification(Order order) {
        // TODO: Implement actual notification
        log.info("📦 Order confirmed notification sent for order: {}", order.getOrderId());
    }
}