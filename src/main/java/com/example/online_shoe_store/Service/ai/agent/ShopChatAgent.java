package com.example.online_shoe_store.Service.ai.agent;

import dev.langchain4j.agentic.Agent;
import dev.langchain4j.service.MemoryId;
import dev.langchain4j.service.UserMessage;
import dev.langchain4j.service.V;

public interface ShopChatAgent {
    @Agent
    String chat(@MemoryId @V("sessionId") String sessionId, 
                @V("userId") String userId, 
                @UserMessage @V("request") String request,
                @V("context") String context);
}

