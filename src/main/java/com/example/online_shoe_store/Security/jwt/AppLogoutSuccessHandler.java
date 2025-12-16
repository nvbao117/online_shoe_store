package com.example.online_shoe_store.Security.jwt;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;
import org.springframework.stereotype.Component;

import java.io.IOException;

@Component
public class AppLogoutSuccessHandler implements LogoutSuccessHandler {

    private final RefreshTokenService refreshTokenService;

    public AppLogoutSuccessHandler(RefreshTokenService refreshTokenService) {
        this.refreshTokenService = refreshTokenService;
    }

    @Override
    public void onLogoutSuccess(HttpServletRequest request,
                                HttpServletResponse response,
                                Authentication authentication) throws IOException {

        String refresh = readCookie(request, "refresh_token");
        if (refresh != null) {
            try { refreshTokenService.revoke(refresh); } catch (Exception ignored) {}
        }

        CookieUtil.clearAuthCookies(response);
        response.sendRedirect("/login?logout=true");
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
