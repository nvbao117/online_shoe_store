package com.example.online_shoe_store.Config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class SecutiryConfig {
    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
                // Tắt CSRF cho dễ dev (nếu sau này có form POST thì hẵng bật lại)
                .csrf(csrf -> csrf.disable())
                // Cho phép tất cả request, không cần login
                .authorizeHttpRequests(auth -> auth
                        .anyRequest().permitAll()
                )
                // Tắt form login mặc định
                .formLogin(form -> form.disable())
                // Tắt luôn httpBasic
                .httpBasic(basic -> basic.disable());

        return http.build();
    }
}
