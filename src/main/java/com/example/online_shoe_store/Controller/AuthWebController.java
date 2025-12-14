package com.example.online_shoe_store.Controller;

import com.example.online_shoe_store.Repository.UserRepository;
import com.example.online_shoe_store.Security.jwt.CookieUtil;
import com.example.online_shoe_store.Security.jwt.JwtService;
import com.example.online_shoe_store.Security.jwt.RefreshTokenService;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.IOException;
import java.time.Duration;

@Controller
public class AuthWebController {

    private final AuthenticationManager authenticationManager;
    private final JwtService jwtService;
    private final RefreshTokenService refreshTokenService;
    private final UserRepository userRepository;

    private final Duration accessTtl = Duration.ofMinutes(15);

    public AuthWebController(AuthenticationManager authenticationManager,
                             JwtService jwtService,
                             RefreshTokenService refreshTokenService,
                             UserRepository userRepository) {
        this.authenticationManager = authenticationManager;
        this.jwtService = jwtService;
        this.refreshTokenService = refreshTokenService;
        this.userRepository = userRepository;
    }

    @PostMapping("/login")
    public void doLogin(@RequestParam String username,
                        @RequestParam String password,
                        @RequestParam(name="remember-me", required=false) String remember,
                        HttpServletResponse res) throws IOException {
        try {
            authenticationManager.authenticate(
                    new UsernamePasswordAuthenticationToken(username, password)
            );

            String access = jwtService.createAccessToken(username);
            boolean rememberMe = (remember != null);

            String userId = userRepository.findByUsername(username).orElseThrow().getUserId();
            var refresh = refreshTokenService.create(userId, rememberMe);

            CookieUtil.setAccessCookie(res, access, accessTtl);
            CookieUtil.setRefreshCookie(res, refresh.raw(), refresh.ttl());

            res.sendRedirect("/home");
        } catch (Exception e) {
            res.sendRedirect("/login?error=true");
        }
    }

    @PostMapping("/logout")
    public void logout(@RequestParam(required=false) String any,
                       jakarta.servlet.http.HttpServletRequest req,
                       HttpServletResponse res) throws IOException {

        String refresh = null;
        if (req.getCookies() != null) {
            for (var c : req.getCookies()) {
                if ("refresh_token".equals(c.getName())) refresh = c.getValue();
            }
        }
        if (refresh != null) refreshTokenService.revoke(refresh);

        CookieUtil.clearAuthCookies(res);
        res.sendRedirect("/login?logout=true");
    }
}
