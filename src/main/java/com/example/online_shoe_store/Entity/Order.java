package com.example.online_shoe_store.Entity;

import com.example.online_shoe_store.Entity.enums.OrderStatus;
import com.example.online_shoe_store.Entity.enums.PaymentStatus;
import jakarta.persistence.*;
import jakarta.validation.constraints.DecimalMin;
import lombok.*;
import org.hibernate.annotations.ColumnDefault;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.UUID;

@Entity
@Table(name = "orders", indexes = {
        @Index(name = "idx_order_user", columnList = "user_id"),
        @Index(name = "idx_order_status", columnList = "status"),
        @Index(name = "idx_order_date", columnList = "order_date")
})
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString(exclude = {"orderItems", "user", "vouchers", "payment", "shipDetail"})
@EqualsAndHashCode(of = "orderId")
public class Order {

    @Id
    @Column(name = "order_id", length = 36)
    @Builder.Default
    private String orderId = UUID.randomUUID().toString();

    @DecimalMin(value = "0.0", message = "Tổng tiền không được âm")
    @Column(name = "total_amount", nullable = false, precision = 10, scale = 2)
    private BigDecimal totalAmount;

    @Enumerated(EnumType.STRING)
    @Column(name = "status", nullable = false, length = 20)
    @Builder.Default
    private OrderStatus status = OrderStatus.PENDING;

    @Column(name = "order_date", nullable = false, updatable = false)
    @Builder.Default
    private LocalDateTime orderDate = LocalDateTime.now();

    @DecimalMin(value = "0.0", message = "Phí vận chuyển không được âm")
    @Column(name = "shipping_fee", precision = 10, scale = 2)
    @Builder.Default
    private BigDecimal shippingFee = BigDecimal.ZERO;


    @DecimalMin(value = "0.0", message = "Tổng giảm giá không được âm")
    @Column(name = "discount_amount", precision = 10, scale = 2)
    @Builder.Default
    private BigDecimal discountAmount = BigDecimal.ZERO;


    // Thông tin vận chuyển
    @Column(name = "tracking_number", length = 100)
    private String trackingNumber;

    @Column(name = "shipping_carrier", length = 50)
    private String shippingCarrier;

    // Timestamps cho các trạng thái
    @Column(name = "confirmed_at")
    private LocalDateTime confirmedAt;

    @Column(name = "paid_at")
    private LocalDateTime paidAt;

    @Column(name = "shipped_at")
    private LocalDateTime shippedAt;

    @Column(name = "delivered_at")
    private LocalDateTime deliveredAt;

    @Column(name = "cancelled_at")
    private LocalDateTime cancelledAt;

    @Column(name = "expired_at")
    private LocalDateTime expiredAt;

    @Column(name = "estimated_delivery")
    private LocalDateTime estimatedDelivery;

    // Thời hạn thanh toán (tự động tính toán)
    @Column(name = "payment_expiry_at")
    private LocalDateTime paymentExpiryAt;


    // Thông tin audit
    @Column(name = "created_at", nullable = false, updatable = false)
    @Builder.Default
    private LocalDateTime createdAt = LocalDateTime.now();

    @Column(name = "updated_at", nullable = false)
    @Builder.Default
    private LocalDateTime updatedAt = LocalDateTime.now();

    @Column(name = "cancellation_reason", length = 500)
    private String cancellationReason;

    @Column(name = "customer_note", length = 1000)
    private String customerNote;

    @Column(name = "internal_note", length = 1000)
    private String internalNote;

    @PrePersist
    protected void onCreate() {
        if (orderId == null) {
            orderId = UUID.randomUUID().toString();
        }
        if (orderDate == null) {
            orderDate = LocalDateTime.now();
        }
        if (status == null) {
            status = OrderStatus.PENDING;
        }
        if (shippingFee == null) {
            shippingFee = BigDecimal.ZERO;
        }
        if (discountAmount == null) {
            discountAmount = BigDecimal.ZERO;
        }
        if (createdAt == null) {
            createdAt = LocalDateTime.now();
        }
        if (updatedAt == null) {
            updatedAt = LocalDateTime.now();
        }

        // Tính toán final amount
        calculateFinalAmount();

        // Tính thời hạn thanh toán (24 giờ)
        if (paymentExpiryAt == null) {
            paymentExpiryAt = createdAt.plusHours(24);
        }
    }

    @PreUpdate
    protected void onUpdate() {
        this.updatedAt = LocalDateTime.now();

        // Cập nhật final amount khi có thay đổi
        calculateFinalAmount();
    }
    private void calculateFinalAmount() {
        if (totalAmount != null) {
            BigDecimal subtotal = totalAmount
                    .subtract(discountAmount != null ? discountAmount : BigDecimal.ZERO)
                    .add(shippingFee != null ? shippingFee : BigDecimal.ZERO);
            this.finalAmount = subtotal.max(BigDecimal.ZERO);
        }
    }

    public boolean canBePaid() {
        return status == OrderStatus.PENDING ||
                status == OrderStatus.PAYMENT_FAILED ||
                status == OrderStatus.AWAITING_PAYMENT;
    }

    public boolean isPaymentExpired() {
        return paymentExpiryAt != null &&
                paymentExpiryAt.isBefore(LocalDateTime.now());
    }

    public void updateStatus(OrderStatus newStatus, String note, String changedBy) {
        OrderStatus oldStatus = this.status;

        // Validate state transition
        if (!isValidTransition(oldStatus, newStatus)) {
            throw new IllegalStateException(
                    String.format("Cannot transition from %s to %s", oldStatus, newStatus));
        }

        this.status = newStatus;
        this.updatedAt = LocalDateTime.now();

        // Update specific timestamps
        switch (newStatus) {
            case CONFIRMED -> {
                this.confirmedAt = LocalDateTime.now();
                this.paidAt = LocalDateTime.now(); // Có thể set paidAt khi confirmed
            }
            case SHIPPED -> this.shippedAt = LocalDateTime.now();
            case DELIVERED -> this.deliveredAt = LocalDateTime.now();
            case CANCELLED -> this.cancelledAt = LocalDateTime.now();
            case EXPIRED -> this.expiredAt = LocalDateTime.now();
        }

        // Log status change
        addStatusHistory(oldStatus, newStatus, note, changedBy);
    }

    private boolean isValidTransition(OrderStatus from, OrderStatus to) {
        // State machine logic
        switch (from) {
            case PENDING:
                return List.of(OrderStatus.CONFIRMED, OrderStatus.CANCELLED,
                        OrderStatus.AWAITING_PAYMENT, OrderStatus.EXPIRED).contains(to);
            case AWAITING_PAYMENT:
                return List.of(OrderStatus.CONFIRMED, OrderStatus.PAYMENT_FAILED,
                        OrderStatus.CANCELLED, OrderStatus.EXPIRED).contains(to);
            case PAYMENT_FAILED:
                return List.of(OrderStatus.AWAITING_PAYMENT, OrderStatus.CANCELLED).contains(to);
            case CONFIRMED:
                return List.of(OrderStatus.PROCESSING, OrderStatus.CANCELLED,
                        OrderStatus.REFUNDED).contains(to);
            case PROCESSING:
                return List.of(OrderStatus.READY_FOR_SHIPMENT, OrderStatus.CANCELLED).contains(to);
            case SHIPPED:
                return List.of(OrderStatus.IN_TRANSIT, OrderStatus.DELIVERED,
                        OrderStatus.RETURN_REQUESTED).contains(to);
            case DELIVERED:
                return List.of(OrderStatus.COMPLETED, OrderStatus.RETURN_REQUESTED).contains(to);
            default:
                return false;
        }
    }

    @OneToMany(mappedBy = "order", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @Builder.Default
    private List<OrderStatusHistory> statusHistory = new ArrayList<>();

    // Helper method to add status history
    private void addStatusHistory(OrderStatus oldStatus, OrderStatus newStatus,
                                  String note, String changedBy) {
        OrderStatusHistory history = OrderStatusHistory.builder()
                .order(this)
                .oldStatus(oldStatus)
                .newStatus(newStatus)
                .note(note)
                .changedBy(changedBy)
                .changedAt(LocalDateTime.now())
                .build();
        statusHistory.add(history);
    }

    @OneToMany(mappedBy = "order", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @Builder.Default
    private List<OrderItem> orderItems = new ArrayList<>();

    @Column(name = "final_amount", precision = 10, scale = 2)
    private BigDecimal finalAmount;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id", foreignKey = @ForeignKey(name = "FK_Order_User"))
    private User user;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ship_detail_id", foreignKey = @ForeignKey(name = "FK_Order_ShipDetail"))
    private ShipDetail shipDetail;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "Order_Voucher",
            joinColumns = {@JoinColumn(name = "order_id")},
            inverseJoinColumns = {@JoinColumn(name = "voucher_id")})
    @Builder.Default
    private List<Voucher> vouchers = new ArrayList<>();

    @OneToMany(mappedBy = "order", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @Builder.Default
    private List<Payment> payments = new ArrayList<>();


    @Transient
    public Payment getActivePayment() {
        return payments.stream()
                .filter(p -> p.getPaymentStatus() == PaymentStatus.PENDING ||
                        p.getPaymentStatus() == PaymentStatus.PROCESSING)
                .findFirst()
                .orElseGet(() -> payments.stream()
                        .filter(p -> p.getPaymentStatus() == PaymentStatus.COMPLETED)
                        .max(Comparator.comparing(Payment::getCreatedAt))
                        .orElse(null));
    }

    public boolean isPaid() {
        return payments.stream()
                .anyMatch(p -> p.getPaymentStatus() == PaymentStatus.COMPLETED);
    }
    public Payment getSuccessfulPayment() {
        return payments.stream()
                .filter(p -> p.getPaymentStatus() == PaymentStatus.COMPLETED)
                .max(Comparator.comparing(Payment::getPaymentDate))
                .orElse(null);
    }

    public static Order createOrder(User user, ShipDetail shipDetail, List<OrderItem> items) {
        Order order = Order.builder()
                .user(user)
                .shipDetail(shipDetail)
                .orderItems(items)
                .status(OrderStatus.PENDING)
                .orderDate(LocalDateTime.now())
                .createdAt(LocalDateTime.now())
                .updatedAt(LocalDateTime.now())
                .build();

        // Calculate total amount from items
        BigDecimal totalAmount = items.stream()
                .map(item -> item.getPrice().multiply(BigDecimal.valueOf(item.getQuantity())))
                .reduce(BigDecimal.ZERO, BigDecimal::add);

        order.setTotalAmount(totalAmount);
        order.calculateFinalAmount();

        return order;
    }
}
