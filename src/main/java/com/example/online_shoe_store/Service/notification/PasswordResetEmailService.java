package com.example.online_shoe_store.Service.notification;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
@Slf4j
@RequiredArgsConstructor
public class PasswordResetEmailService {
    private final JavaMailSender mailSender;

    @Value("${spring.mail.username:no-reply@5astore.vn}")
    private String fromEmail;

    public boolean sendOtpEmail(String email, String otp) {
        if (email == null || email.isBlank()) {
            log.warn("Cannot send OTP email: email is empty");
            return false;
        }

        try {
            MimeMessage mimeMessage = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");

            helper.setFrom(fromEmail);
            helper.setTo(email);
            helper.setSubject("🔐 Mã OTP đổi mật khẩu - 5A STORE");

            String htmlContent = buildHtmlContent(otp);
            helper.setText(htmlContent, true);

            mailSender.send(mimeMessage);
            log.info("✅ OTP email sent successfully to {}", email);
            return true;
        } catch (MessagingException e) {
            log.error("❌ Failed to send OTP email to {}: {}", email, e.getMessage(), e);
            return false;
        } catch (Exception ex) {
            log.error("❌ Unexpected error sending OTP email to {}: {}", email, ex.getMessage(), ex);
            return false;
        }
    }

    private String buildHtmlContent(String otp) {
        String template = """
            <!DOCTYPE html>
            <html lang="vi">
            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Mã OTP đổi mật khẩu</title>
            </head>
            <body style="margin: 0; padding: 0; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background-color: #f4f6f9;">
                <table role="presentation" cellpadding="0" cellspacing="0" width="100%" style="max-width: 600px; margin: 40px auto; background-color: #ffffff; border-radius: 12px; overflow: hidden; box-shadow: 0 4px 20px rgba(0,0,0,0.1);">
                    <!-- Header -->
                    <tr>
                        <td style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); padding: 40px 30px; text-align: center;">
                            <h1 style="margin: 0; color: #ffffff; font-size: 28px; font-weight: 600; letter-spacing: 1px;">
                                🔐 5A STORE
                            </h1>
                            <p style="margin: 10px 0 0 0; color: rgba(255,255,255,0.9); font-size: 14px;">
                                Mã OTP đổi mật khẩu
                            </p>
                        </td>
                    </tr>
                    
                    <!-- Content -->
                    <tr>
                        <td style="padding: 40px 30px;">
                            <h2 style="margin: 0 0 20px 0; color: #333333; font-size: 24px; font-weight: 600;">
                                Xin chào,
                            </h2>
                            <p style="margin: 0 0 20px 0; color: #666666; font-size: 16px; line-height: 1.6;">
                                Bạn vừa yêu cầu lấy lại mật khẩu tại <strong>5A STORE</strong>.
                            </p>
                            
                            <!-- OTP Box -->
                            <div style="background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%); border-radius: 8px; padding: 30px; text-align: center; margin: 30px 0;">
                                <p style="margin: 0 0 15px 0; color: #333333; font-size: 14px; font-weight: 500;">
                                    Mã OTP của bạn:
                                </p>
                                <div style="background: #ffffff; border-radius: 8px; padding: 20px; display: inline-block; box-shadow: 0 2px 10px rgba(0,0,0,0.1);">
                                    <span style="font-size: 36px; font-weight: 700; color: #667eea; letter-spacing: 8px; font-family: 'Courier New', monospace;">
                                        {OTP_CODE}
                                    </span>
                                </div>
                            </div>
                            
                            <!-- Warning -->
                            <div style="background-color: #fff3cd; border-left: 4px solid #ffc107; padding: 15px; margin: 20px 0; border-radius: 4px;">
                                <p style="margin: 0; color: #856404; font-size: 14px; line-height: 1.6;">
                                    <strong>⚠️ Lưu ý:</strong> Mã OTP có hiệu lực trong <strong>5 phút</strong>. 
                                    Không chia sẻ mã này với bất kỳ ai. Nếu bạn không yêu cầu đổi mật khẩu, vui lòng bỏ qua email này.
                                </p>
                            </div>
                            
                            <p style="margin: 30px 0 0 0; color: #666666; font-size: 14px; line-height: 1.6;">
                                Trân trọng,<br>
                                <strong style="color: #333333;">Đội ngũ 5A STORE</strong>
                            </p>
                        </td>
                    </tr>
                    
                    <!-- Footer -->
                    <tr>
                        <td style="background-color: #f8f9fa; padding: 20px 30px; text-align: center; border-top: 1px solid #e9ecef;">
                            <p style="margin: 0; color: #6c757d; font-size: 12px;">
                                © 2024 5A STORE. Tất cả quyền được bảo lưu.
                            </p>
                        </td>
                    </tr>
                </table>
            </body>
            </html>
            """;
        
        // Thay thế placeholder bằng OTP thực tế
        return template.replace("{OTP_CODE}", otp);
    }
}