package com.example.online_shoe_store.Repository;

import com.example.online_shoe_store.Entity.Payment;
import com.example.online_shoe_store.Entity.enums.PaymentStatus;
import jakarta.persistence.LockModeType;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Lock;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Repository
public interface PaymentRepository extends JpaRepository<Payment, String> {

    List<Payment> findByOrderOrderId(String orderId);

    // Trả về page payments của một order
    Page<Payment> findByOrderOrderId(String orderId, Pageable pageable);


    // Trả về page payments của một user
    Page<Payment> findByOrderUserUserId(String userId, Pageable pageable);

    @Query("SELECT p FROM Payment p WHERE p.order.user.userId = :userId")
    Page<Payment> findByOrderUserId(@Param("userId") String userId, Pageable pageable);

    // Tìm payment bằng transactionId
    Optional<Payment> findByTransactionId(String transactionId);

    @Query("SELECT p FROM Payment p WHERE p.order.orderId = :orderId AND p.paymentStatus = 'COMPLETED'")
    Optional<Payment> findSuccessfulPaymentByOrderId(@Param("orderId") String orderId);

    // Tìm payments theo status
    List<Payment> findByPaymentStatus(PaymentStatus status);

    @Query("SELECT p FROM Payment p WHERE p.createdAt BETWEEN :startDate AND :endDate")
    List<Payment> findPaymentsByDateRange(@Param("startDate") LocalDateTime startDate,
                                          @Param("endDate") LocalDateTime endDate);
}
