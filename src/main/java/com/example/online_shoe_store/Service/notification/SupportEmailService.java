package com.example.online_shoe_store.Service.notification;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;

@Slf4j
@Service
@RequiredArgsConstructor
public class SupportEmailService {

    private final JavaMailSender mailSender;

    @Value("${support.email.from:no-reply@localhost}")
    private String from;

    @Value("${support.email.to:}")
    private String to;

    public boolean sendEscalationEmail(String sessionId, String issue, String priority, String contact, String transcript) {
        if (to == null || to.isBlank()) {
            log.warn("support.email.to not configured; skipping email send");
            return false;
        }
        try {
            SimpleMailMessage message = new SimpleMailMessage();
            message.setFrom(from);
            message.setTo(to.split(","));
            message.setSubject("[Chatbot] Escalation " + priority + " - Session " + sessionId);

            StringBuilder body = new StringBuilder();
            body.append("Time: ")
                .append(ZonedDateTime.now().format(DateTimeFormatter.ISO_OFFSET_DATE_TIME))
                .append("\n")
                .append("Session: ").append(sessionId).append("\n")
                .append("Priority: ").append(priority).append("\n")
                .append("Issue: ").append(issue).append("\n");
            if (contact != null && !contact.isBlank()) {
                body.append("Contact: ").append(contact).append("\n");
            }
            body.append("Transcript: \n").append(transcript == null ? "(empty)" : transcript).append("\n");

            message.setText(body.toString());
            mailSender.send(message);
            log.info("Support escalation email sent to {}", to);
            return true;
        } catch (Exception ex) {
            log.error("Failed to send escalation email: {}", ex.getMessage(), ex);
            return false;
        }
    }
}
