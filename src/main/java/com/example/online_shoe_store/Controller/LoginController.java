package com.example.online_shoe_store.Controller;

import com.example.online_shoe_store.Repository.UserRepository;
import com.example.online_shoe_store.Service.UserService;
import com.example.online_shoe_store.Service.OtpService;
import com.example.online_shoe_store.Service.notification.PasswordResetEmailService;
import com.example.online_shoe_store.dto.request.ForgotPasswordRequest;
import com.example.online_shoe_store.dto.request.RegisterRequest;
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
    private final PasswordResetEmailService passwordResetEmailService;
    private final UserRepository userRepository;

    public LoginController(UserService userService,
                           OtpService otpService,
                           PasswordResetEmailService passwordResetEmailService,
                           UserRepository userRepository){
        this.userService = userService;
        this.otpService = otpService;
        this.passwordResetEmailService = passwordResetEmailService;
        this.userRepository = userRepository;
    }

    //Xu ly OTP
    @PostMapping("/register/send-otp")
    @ResponseBody
    public String sendOtp(@RequestParam("phone") String phone) {
        if (phone == null || phone.isBlank()) {
            return "Vui lòng nhập số điện thoại trước";
        }
        otpService.generateOtp(phone, "REGISTER");  // sẽ in OTP ra console
        return "OTP đã được tạo. Kiểm tra console của server.";
    }

    // ======== REGISTER ========
    @GetMapping("/register")
    public String showRegisterForm(Model model) {
        model.addAttribute("registerRequest", new RegisterRequest());
        return "login/register";      // trỏ tới templates/login/register.html
    }

    @PostMapping("/register")
    public String handleRegister(@ModelAttribute("registerRequest") RegisterRequest request,
                                 Model model) {

        StringBuilder errorMessage = new StringBuilder();
        boolean ok = userService.register(request, errorMessage);

        if (!ok) {
            model.addAttribute("errorMessage", errorMessage.toString());
            return "login/register";
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
    public String showForgotPasswordForm(Authentication authentication, Model model) {
        if (authentication != null
                && authentication.isAuthenticated()
                && !(authentication instanceof AnonymousAuthenticationToken)) {
            return "redirect:/home";
        }
        model.addAttribute("forgotPasswordRequest", new ForgotPasswordRequest());
        return "login/forgot-password";
    }

    @PostMapping("/forgot-password/send-otp")
    @ResponseBody
    public String sendForgotPasswordOtp(@RequestParam("email") String email) {
        if (email == null || email.isBlank()) {
            return "Vui lòng nhập email trước";
        }

        // Kiểm tra email có tồn tại trong DB không
        if (userRepository.findByEmail(email).isEmpty()) {
            return "Email không tồn tại trong hệ thống";
        }

        try {
            // Tạo OTP (có rate limiting tự động)
            String otp = otpService.generateOtp(email, "RESET_PASSWORD");
            
            // Gửi email OTP
            boolean sent = passwordResetEmailService.sendOtpEmail(email, otp);
            if (!sent) {
                return "Không thể gửi OTP. Vui lòng kiểm tra cấu hình SMTP hoặc thử lại sau.";
            }

            return "OTP đã được gửi về email. Vui lòng kiểm tra hộp thư.";
        } catch (RuntimeException e) {
            // Xử lý rate limiting exception
            return e.getMessage();
        } catch (Exception e) {
            return "Có lỗi xảy ra. Vui lòng thử lại sau.";
        }
    }

    @PostMapping("/forgot-password")
    public String handleForgotPassword(@ModelAttribute("forgotPasswordRequest") ForgotPasswordRequest request,
                                       Model model) {
        StringBuilder errorMessage = new StringBuilder();
        boolean ok = userService.resetPassword(request, errorMessage);

        if (!ok) {
            model.addAttribute("errorMessage", errorMessage.toString());
            return "login/forgot-password";
        }

        return "redirect:/login?reset=success";
    }
}
