package com.example.online_shoe_store.Security.jwt;

import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseCookie;

import jakarta.servlet.http.HttpServletResponse;
import java.time.Duration;

public class CookieUtil {

    public static void setAccessCookie(HttpServletResponse res, String token, Duration ttl) {
        ResponseCookie c = ResponseCookie.from("access_token", token)
                .httpOnly(true)
                .secure(true)
                .sameSite("Lax")
                .path("/")
                .maxAge(ttl)
                .build();
        res.addHeader(HttpHeaders.SET_COOKIE, c.toString());
    }

    public static void setRefreshCookie(HttpServletResponse res, String token, Duration ttl) {
        ResponseCookie c = ResponseCookie.from("refresh_token", token)
                .httpOnly(true)
                .secure(true)
                .sameSite("Lax")
                .path("/")
                .maxAge(ttl)
                .build();
        res.addHeader(HttpHeaders.SET_COOKIE, c.toString());
    }

    public static void clearAuthCookies(HttpServletResponse res) {
        ResponseCookie a = ResponseCookie.from("access_token", "")
                .httpOnly(true).secure(true).sameSite("Lax")
                .path("/").maxAge(0).build();

        ResponseCookie r = ResponseCookie.from("refresh_token", "")
                .httpOnly(true).secure(true).sameSite("Lax")
                .path("/").maxAge(0).build();

        res.addHeader(HttpHeaders.SET_COOKIE, a.toString());
        res.addHeader(HttpHeaders.SET_COOKIE, r.toString());
    }
}
