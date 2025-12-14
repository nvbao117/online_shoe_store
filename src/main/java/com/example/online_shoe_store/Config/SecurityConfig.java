package com.example.online_shoe_store.Config;

import com.example.online_shoe_store.Security.CustomUserDetailsService;
import com.example.online_shoe_store.Security.jwt.JwtCookieAuthFilter;
import com.example.online_shoe_store.Security.jwt.JwtService;
import com.example.online_shoe_store.Security.jwt.RefreshTokenService;
import com.example.online_shoe_store.Repository.RefreshTokenRepository;
import com.example.online_shoe_store.Repository.UserRepository;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import jakarta.servlet.http.HttpServletResponse;

@Configuration
public class SecurityConfig {

    private final CustomUserDetailsService customUserDetailsService;

    public SecurityConfig(CustomUserDetailsService customUserDetailsService) {
        this.customUserDetailsService = customUserDetailsService;
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http, JwtCookieAuthFilter jwtFilter) throws Exception {
        http
                .csrf(csrf -> csrf.disable())
                .sessionManagement(sm -> sm.sessionCreationPolicy(SessionCreationPolicy.STATELESS))
                .authorizeHttpRequests(auth -> auth
                        .requestMatchers(
                                "/register",
                                "/register/send-otp",
                                "/login",
                                "/logout",
                                "/error",
                                "/css/**",
                                "/js/**",
                                "/images/**",
                                "/videos/**"
                        ).permitAll()
                        .anyRequest().authenticated()
                )
                // ✅ Postman/API: trả 401 thay vì redirect /login => không bị redirect loop
                .exceptionHandling(ex -> ex
                        .authenticationEntryPoint((req, res, e) ->
                                res.sendError(HttpServletResponse.SC_UNAUTHORIZED)
                        )
                )
                // ✅ Gắn filter bean do Spring quản lý (không new thủ công, không truyền null)
                .addFilterBefore(jwtFilter, UsernamePasswordAuthenticationFilter.class);

        return http.build();
    }

    // dùng BCrypt giống lúc đăng ký
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    // kết nối UserDetailsService + PasswordEncoder
    @Bean
    public AuthenticationProvider authenticationProvider() {
        DaoAuthenticationProvider provider = new DaoAuthenticationProvider();
        provider.setUserDetailsService(customUserDetailsService);
        provider.setPasswordEncoder(passwordEncoder());
        return provider;
    }

    // cần cho một số phiên bản Spring Security
    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration config) throws Exception {
        return config.getAuthenticationManager();
    }

    // ================= JWT =================
    @Value("${app.jwt.secret}")
    private String jwtSecret;

    @Value("${app.jwt.accessMinutes}")
    private long accessMinutes;

    @Value("${app.jwt.refreshDaysRemember}")
    private long refreshDaysRemember;

    @Value("${app.jwt.refreshDaysNormal}")
    private long refreshDaysNormal;

    @Bean
    public JwtService jwtService() {
        return new JwtService(jwtSecret, accessMinutes);
    }

    @Bean
    public RefreshTokenService refreshTokenService(RefreshTokenRepository repo) {
        return new RefreshTokenService(repo, refreshDaysRemember, refreshDaysNormal);
    }

    @Bean
    public JwtCookieAuthFilter jwtCookieAuthFilter(
            JwtService jwtService,
            RefreshTokenService refreshTokenService,
            UserRepository userRepository
    ) {
        return new JwtCookieAuthFilter(jwtService, refreshTokenService, customUserDetailsService, userRepository);
    }
}
