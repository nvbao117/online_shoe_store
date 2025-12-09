package com.example.online_shoe_store.Service;

import com.example.online_shoe_store.dto.ChatRequest;
import com.example.online_shoe_store.dto.ChatResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;




@Service
@RequiredArgsConstructor
public class ChatBotService {

    private final ShoeAssistant shoeAssistant;

    public ChatResponse processMessage(ChatRequest request){
        String aiResponse = shoeAssistant.chat(request.getMessage());

        return ChatResponse.builder()
                .response(aiResponse)
                .type("bot")
                .build();
    }
}
