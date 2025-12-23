package com.example.online_shoe_store.Repository;

import com.example.online_shoe_store.Entity.Voucher;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Repository
public interface VoucherRepository extends JpaRepository<Voucher, String> {
    boolean existsByCodeIgnoreCase(String code);

    Optional<Voucher> findByCodeIgnoreCase(String code);

    List<Voucher> findByStatusIgnoreCaseAndStartDateLessThanEqualAndEndDateGreaterThanEqual(
            String status,
            LocalDateTime startDate,
            LocalDateTime endDate
    );
}