package com.example.online_shoe_store.Controller.api;

import com.example.online_shoe_store.dto.request.ChatRequest;
import com.example.online_shoe_store.dto.response.ChatResponse;
import com.example.online_shoe_store.Service.ChatBotService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

@Slf4j
@RestController
@RequestMapping("/api/chat")
@RequiredArgsConstructor
public class ChatBotAPIController {

    private final ChatBotService chatBotService;

    @PostMapping("/send")
    public ResponseEntity<ChatResponse> sendMessage(@RequestBody ChatRequest request) {
        log.info("Received chat request: message='{}', sessionId='{}'", 
                 request.getMessage(), request.getSessionId());
        ChatResponse response = chatBotService.processMessage(request);
        return ResponseEntity.ok(response);
    }

    @PostMapping("/send-image")
    public ResponseEntity<ChatResponse> sendImage(
            @RequestParam("image") MultipartFile image,
            @RequestParam(value = "message", required = false) String message,
            @RequestParam(value = "sessionId", required = false) String sessionId
    ) {
        log.info("Received image chat request: filename='{}', size={}, message='{}', sessionId='{}'",
                image.getOriginalFilename(), image.getSize(), message, sessionId);
        
        ChatResponse response = chatBotService.processImageMessage(image, message, sessionId);
        return ResponseEntity.ok(response);
    }
}
