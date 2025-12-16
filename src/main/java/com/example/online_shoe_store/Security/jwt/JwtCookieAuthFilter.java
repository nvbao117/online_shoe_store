package com.example.online_shoe_store.Security.jwt;

import com.example.online_shoe_store.Repository.UserRepository;
import com.example.online_shoe_store.Security.CustomUserDetailsService;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;
import java.time.Duration;

public class JwtCookieAuthFilter extends OncePerRequestFilter {

    private final JwtService jwtService;
    private final RefreshTokenService refreshTokenService;
    private final CustomUserDetailsService userDetailsService;
    private final UserRepository userRepository;

    private final Duration accessTtl = Duration.ofMinutes(15);

    public JwtCookieAuthFilter(JwtService jwtService,
                               RefreshTokenService refreshTokenService,
                               CustomUserDetailsService userDetailsService,
                               UserRepository userRepository) {
        this.jwtService = jwtService;
        this.refreshTokenService = refreshTokenService;
        this.userDetailsService = userDetailsService;
        this.userRepository = userRepository;
    }

    @Override
    protected void doFilterInternal(HttpServletRequest req, HttpServletResponse res, FilterChain chain)
            throws ServletException, IOException {

        String uri = req.getRequestURI();

        boolean isStatic = uri.startsWith("/css") || uri.startsWith("/js")
                || uri.startsWith("/images") || uri.startsWith("/videos");

        boolean isRegister = uri.startsWith("/register");
        boolean isLogin = uri.equals("/login");    // ✅ bỏ qua cả GET và POST
        boolean isError = uri.equals("/error");
        boolean isOauth2 = uri.startsWith("/oauth2") || uri.startsWith("/login/oauth2");

        if (isStatic || isRegister || isLogin || isError || isOauth2) {
            chain.doFilter(req, res);
            return;
        }

        // 1) Nếu có access_token và hợp lệ -> set auth
        String access = readCookie(req, "access_token");
        if (access != null && jwtService.isValid(access)) {
            setAuth(jwtService.getUsername(access));
            chain.doFilter(req, res);
            return;
        }

        // 2) access thiếu/hết hạn -> thử refresh_token
        String refresh = readCookie(req, "refresh_token");
        if (refresh != null) {
            try {
                var rotated = refreshTokenService.verifyAndRotate(refresh);

                String username = userRepository.findById(rotated.userId())
                        .orElseThrow()
                        .getUsername();

                String newAccess = jwtService.createAccessToken(username);

                CookieUtil.setAccessCookie(res, newAccess, accessTtl);
                CookieUtil.setRefreshCookie(res, rotated.raw(), rotated.ttl());

                setAuth(username);
            } catch (Exception ignored) {
                // refresh invalid/expired -> không set auth
                // => Security sẽ xử lý (entrypoint trả 401)
            }
        }

        chain.doFilter(req, res);
    }

    private void setAuth(String username) {
        UserDetails ud = userDetailsService.loadUserByUsername(username);
        UsernamePasswordAuthenticationToken auth =
                new UsernamePasswordAuthenticationToken(ud, null, ud.getAuthorities());
        SecurityContextHolder.getContext().setAuthentication(auth);
    }

    private String readCookie(HttpServletRequest req, String name) {
        Cookie[] cookies = req.getCookies();
        if (cookies == null) return null;
        for (Cookie c : cookies) {
            if (name.equals(c.getName())) return c.getValue();
        }
        return null;
    }
}
