package com.example.online_shoe_store.Controller;

import com.example.online_shoe_store.dto.request.RegisterRequest;
import com.example.online_shoe_store.Service.UserService;
import com.example.online_shoe_store.Service.OtpService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;

@Controller
public class LoginController {

    private final UserService userService;
    private final OtpService otpService;

    public LoginController(UserService userService, OtpService otpService) {
        this.userService = userService;
        this.otpService = otpService;
    }

    //Xu ly OTP
    @PostMapping("/register/send-otp")
    @ResponseBody
    public String sendOtp(@RequestParam("phone") String phone) {
        if (phone == null || phone.isBlank()) {
            return "Vui lòng nhập số điện thoại trước";
        }
        otpService.generateOtp(phone);  // sẽ in OTP ra console
        return "OTP đã được tạo. Kiểm tra console của server.";
    }

    // ======== REGISTER ========
    @GetMapping("/register")
    public String showRegisterForm(Model model) {
        model.addAttribute("registerRequest", new RegisterRequest());
        return "/login/register";      // trỏ tới templates/login/register.html
    }

    @PostMapping("/register")
    public String handleRegister(@ModelAttribute("registerRequest") RegisterRequest request,
                                 Model model) {

        StringBuilder errorMessage = new StringBuilder();
        boolean ok = userService.register(request, errorMessage);

        if (!ok) {
            model.addAttribute("errorMessage", errorMessage.toString());
            return "/login/register";
        }

        // đăng ký ok -> quay về trang login
        return "redirect:/login";
    }

    // ======== LOGIN ========

    @GetMapping("/login")
    public String showLoginForm(Authentication authentication) {
        if (authentication != null
                && authentication.isAuthenticated()
                && !(authentication instanceof AnonymousAuthenticationToken)) {
            return "redirect:/home";
        }

        return "login/login";
    }

    @GetMapping("/forgot-password")
    public String showForgotPasswordForm(Authentication authentication) {
        if (authentication != null
                && authentication.isAuthenticated()
                && !(authentication instanceof AnonymousAuthenticationToken)) {
            return "redirect:/home";
        }
        return "login/forgot-password";
    }

}
