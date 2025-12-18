package com.example.online_shoe_store.Security.oauth2;

import com.example.online_shoe_store.Entity.User;
import com.example.online_shoe_store.Entity.enums.Role;
import com.example.online_shoe_store.Repository.UserRepository;
import com.example.online_shoe_store.Security.jwt.CookieUtil;
import com.example.online_shoe_store.Security.jwt.JwtService;
import com.example.online_shoe_store.Security.jwt.RefreshTokenService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.UUID;

@Component
public class OAuth2LoginSuccessHandler implements AuthenticationSuccessHandler {

    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;
    private final JwtService jwtService;
    private final RefreshTokenService refreshTokenService;

    public OAuth2LoginSuccessHandler(UserRepository userRepository,
                                     PasswordEncoder passwordEncoder,
                                     JwtService jwtService,
                                     RefreshTokenService refreshTokenService)
    {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
        this.jwtService = jwtService;
        this.refreshTokenService = refreshTokenService;
    }

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request,
                                        HttpServletResponse response,
                                        Authentication authentication) throws IOException, ServletException {

        OAuth2User principal = (OAuth2User) authentication.getPrincipal();

        String email = getString(principal, "email");
        Boolean emailVerified = getBoolean(principal, "email_verified");
        String name = firstNonBlank(
                getString(principal, "name"),
                getString(principal, "given_name"),
                getString(principal, "family_name")
        );

        if (email == null || email.isBlank()) {
            response.sendRedirect("/login?oauth2_error=missing_email");
            return;
        }

        // Nếu Google trả email_verified = false thì chặn (an toàn hơn)
        if (emailVerified != null && !emailVerified) {
            response.sendRedirect("/login?oauth2_error=email_not_verified");
            return;
        }

        User user = userRepository.findByEmail(email).orElseGet(() -> createGoogleUser(email, name));

        if (Boolean.FALSE.equals(user.getIsActive())) {
            CookieUtil.clearAuthCookies(response);
            response.sendRedirect("/login?oauth2_error=inactive");
            return;
        }

        // Phát JWT cookies giống cơ chế bạn đang có
        String accessToken = jwtService.createAccessToken(user.getUsername());
        var refresh = refreshTokenService.create(user.getUserId(), false);

        CookieUtil.setAccessCookie(response, accessToken, jwtService.getAccessTtl());
        CookieUtil.setRefreshCookie(response, refresh.raw(), refresh.ttl());

        response.sendRedirect("/home");
    }

    private User createGoogleUser(String email, String name) {
        String username = generateUniqueUsername(email);

        User u = User.builder()
                .username(username)
                // User.password đang NOT NULL + @NotBlank -> phải set password
                .password(passwordEncoder.encode(UUID.randomUUID().toString()))
                .email(email)
                .name((name == null || name.isBlank()) ? username : name)
                .role(Role.USER)
                .isActive(true)
                .build();

        return userRepository.save(u);
    }

    private String generateUniqueUsername(String email) {
        String base = email.split("@")[0].replaceAll("[^a-zA-Z0-9._-]", "");
        if (base.length() < 3) base = "user" + base;

        String candidate = base;
        int i = 0;
        while (userRepository.existsByUsername(candidate)) {
            i++;
            candidate = base + i;
        }
        return candidate;
    }

    private String getString(OAuth2User user, String key) {
        Object v = user.getAttributes().get(key);
        return v == null ? null : String.valueOf(v);
    }

    private Boolean getBoolean(OAuth2User user, String key) {
        Object v = user.getAttributes().get(key);
        if (v instanceof Boolean b) return b;
        if (v instanceof String s) return Boolean.parseBoolean(s);
        return null;
    }

    private String firstNonBlank(String... arr) {
        if (arr == null) return null;
        for (String s : arr) {
            if (s != null && !s.isBlank()) return s;
        }
        return null;
    }
}
