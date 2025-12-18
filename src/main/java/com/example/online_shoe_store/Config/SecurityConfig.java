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
import com.example.online_shoe_store.Security.oauth2.OAuth2LoginFailureHandler;
import com.example.online_shoe_store.Security.oauth2.OAuth2LoginSuccessHandler;
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
    public SecurityFilterChain filterChain(HttpSecurity http,
                                           JwtCookieAuthFilter jwtCookieAuthFilter,
                                           OAuth2LoginSuccessHandler oauth2SuccessHandler,
                                           OAuth2LoginFailureHandler oauth2FailureHandler,
                                           AppLogoutSuccessHandler appLogoutSuccessHandler) throws Exception {

        http
                .csrf(csrf -> csrf.disable())

                .sessionManagement(session ->
                        session.sessionCreationPolicy(SessionCreationPolicy.STATELESS)
                )

                .authorizeHttpRequests(auth -> auth
                        .requestMatchers("/login", "/register", "/forgot-password").permitAll()
                        .requestMatchers("/register/send-otp").permitAll()
                        .requestMatchers("/oauth2/**", "/login/oauth2/**").permitAll()
                        .requestMatchers("/", "/home", "/products", "/sale-off", "/product-detail/**", "/admin/**", "/test").permitAll()
                        .requestMatchers("/api/**").permitAll()
                        .requestMatchers(
                                "/images/**",
                                "/src/data/images/**",
                                "/css/**",
                                "/js/**",
                                "/pages/**",
                                "/home/**",
                                "/ui/**",
                                "/favicon.ico",
                                "/webjars/**",
                                "/static/**",
                                "/videos/**",
                                "/assets/**",
                                "/error"
                        ).permitAll()
                        .anyRequest().authenticated()
                )
                .formLogin(login -> login
                        .loginPage("/login")
                        .loginProcessingUrl("/login")
                        .defaultSuccessUrl("/home", true)
                        .failureUrl("/login?error=true")
                        .permitAll()
                )
                .oauth2Login(oauth2 -> oauth2
                        .loginPage("/login")
                        .successHandler(oauth2SuccessHandler)
                        .failureHandler(oauth2FailureHandler)
                )
                .logout(logout -> logout
                        .logoutUrl("/logout")
                        .logoutSuccessHandler(appLogoutSuccessHandler)
                        .permitAll()
                );

        http.addFilterBefore(jwtCookieAuthFilter, UsernamePasswordAuthenticationFilter.class);

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
