package com.example.online_shoe_store.Entity.auth;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.Instant;

@Entity
@Table(name = "refresh_tokens",
        indexes = {
                @Index(name = "idx_refresh_token_hash", columnList = "token_hash")
        }
)
@Getter
@Setter
public class RefreshTokenEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name="user_id", length = 36, nullable = false)
    private String userId;

    @Column(name="token_hash", length = 64, nullable = false, unique = true)
    private String tokenHash;

    @Column(name="expires_at", nullable = false)
    private Instant expiresAt;

    @Column(name="revoked", nullable = false)
    private boolean revoked = false;
}
