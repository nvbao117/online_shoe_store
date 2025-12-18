package com.example.online_shoe_store.dto.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ChatResponse {
    private String response;
    private String type;
    private String sessionId;
    
    // Supervisor Agent fields
    private String intent;
    private String subIntent;
    private Double confidence;
    private String urgency;
    private List<String> suggestedActions;
    private Boolean escalationTriggered;
    private Long processingTimeMs;
}

