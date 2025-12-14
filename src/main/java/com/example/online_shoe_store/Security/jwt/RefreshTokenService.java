package com.example.online_shoe_store.Security.jwt;

import com.example.online_shoe_store.Entity.auth.RefreshTokenEntity;
import com.example.online_shoe_store.Repository.RefreshTokenRepository;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Value;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.time.Duration;
import java.time.Instant;
import java.util.UUID;

@Service
public class RefreshTokenService {

    private final RefreshTokenRepository repo;
    private final long refreshDaysRemember;
    private final long refreshDaysNormal;

    public RefreshTokenService(RefreshTokenRepository repo,
                               @Value("${jwt.refresh-days-remember:7}") long refreshDaysRemember,
                               @Value("${jwt.refresh-days-normal:1}") long refreshDaysNormal) {
        this.repo = repo;
        this.refreshDaysRemember = refreshDaysRemember;
        this.refreshDaysNormal = refreshDaysNormal;
    }

    public CreatedRefresh create(String userId, boolean rememberMe) {
        Duration ttl = Duration.ofDays(rememberMe ? refreshDaysRemember : refreshDaysNormal);

        String raw = UUID.randomUUID() + "." + UUID.randomUUID();
        RefreshTokenEntity e = new RefreshTokenEntity();
        e.setUserId(userId);
        e.setTokenHash(sha256(raw));
        e.setExpiresAt(Instant.now().plus(ttl));
        e.setRevoked(false);
        repo.save(e);

        return new CreatedRefresh(raw, ttl);
    }

    // ✅ verify + rotate + sliding expiration 7 ngày
    public RotatedRefresh verifyAndRotate(String rawToken) {
        RefreshTokenEntity e = repo.findByTokenHashAndRevokedFalse(sha256(rawToken))
                .orElseThrow(() -> new RuntimeException("Refresh invalid"));

        if (e.getExpiresAt().isBefore(Instant.now())) {
            throw new RuntimeException("Refresh expired");
        }

        // rotate token + sliding expiration
        String newRaw = UUID.randomUUID() + "." + UUID.randomUUID();
        e.setTokenHash(sha256(newRaw));
        e.setExpiresAt(Instant.now().plus(Duration.ofDays(refreshDaysRemember))); // sliding 7 ngày
        repo.save(e);

        return new RotatedRefresh(e.getUserId(), newRaw, Duration.ofDays(refreshDaysRemember));
    }

    public void revoke(String rawToken) {
        repo.findByTokenHashAndRevokedFalse(sha256(rawToken))
                .ifPresent(e -> {
                    e.setRevoked(true);
                    repo.save(e);
                });
    }

    private String sha256(String raw) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] digest = md.digest(raw.getBytes(StandardCharsets.UTF_8));
            StringBuilder sb = new StringBuilder();
            for (byte b : digest) sb.append(String.format("%02x", b));
            return sb.toString();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public record CreatedRefresh(String raw, Duration ttl) {}
    public record RotatedRefresh(String userId, String raw, Duration ttl) {}
}
