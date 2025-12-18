package com.example.online_shoe_store.Config;

import com.example.online_shoe_store.Security.CustomUserDetailsService;
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
import com.example.online_shoe_store.Repository.UserRepository;
import com.example.online_shoe_store.Security.jwt.AppLogoutSuccessHandler;
import com.example.online_shoe_store.Security.jwt.JwtCookieAuthFilter;
import com.example.online_shoe_store.Security.jwt.JwtService;
import com.example.online_shoe_store.Security.jwt.RefreshTokenService;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

@Configuration
public class SecurityConfig {

    private final CustomUserDetailsService customUserDetailsService;

    public SecurityConfig(CustomUserDetailsService customUserDetailsService) {
        this.customUserDetailsService = customUserDetailsService;
    }


    @Bean
    public JwtCookieAuthFilter jwtCookieAuthFilter(JwtService jwtService,
                                                   RefreshTokenService refreshTokenService,
                                                   UserRepository userRepository) {
        return new JwtCookieAuthFilter(jwtService, refreshTokenService, customUserDetailsService, userRepository);
    }

    @Bean
    public SecurityFilterChain filterChain(
            HttpSecurity http,
            JwtCookieAuthFilter jwtCookieAuthFilter,
            AppLogoutSuccessHandler appLogoutSuccessHandler
    ) throws Exception {

        http
                .csrf(csrf -> csrf.disable())

                // 🔥 TẮT HOÀN TOÀN SESSION
                .sessionManagement(session ->
                        session.sessionCreationPolicy(SessionCreationPolicy.STATELESS)
                )

                // ❌ KHÔNG formLogin
                .formLogin(form -> form.disable())

                // ❌ KHÔNG httpBasic
                .httpBasic(basic -> basic.disable())

                .authorizeHttpRequests(auth -> auth
                        .requestMatchers(
                                "/login",
                                "/register",
                                "/forgot-password",
                                "/register/send-otp",
                                "/oauth2/**",
                                "/login/oauth2/**",
                                "/",
                                "/home",
                                "/products",
                                "/product-detail/**",
                                "/css/**",
                                "/js/**",
                                "/images/**",
                                "/videos/**",
                                "/api/chat/**",
                                "/favicon.ico",
                                "/images/**",
                                "/favicon.ico"
                        ).permitAll()
                        .anyRequest().authenticated()
                )

                .logout(logout -> logout
                        .logoutUrl("/logout")
                        .logoutSuccessHandler(appLogoutSuccessHandler)
                );

        // ✅ JWT FILTER LÀ NGUỒN AUTH DUY NHẤT
        http.addFilterBefore(
                jwtCookieAuthFilter,
                UsernamePasswordAuthenticationFilter.class
        );

        return http.build();
    }



    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public AuthenticationProvider authenticationProvider() {
        DaoAuthenticationProvider provider = new DaoAuthenticationProvider();
        provider.setUserDetailsService(customUserDetailsService);
        provider.setPasswordEncoder(passwordEncoder());
        return provider;
    }

    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration config) throws Exception {
        return config.getAuthenticationManager();
    }
}
