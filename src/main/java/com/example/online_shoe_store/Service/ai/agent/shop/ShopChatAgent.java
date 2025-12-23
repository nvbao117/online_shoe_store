package com.example.online_shoe_store.Service.ai.agent.shop;

import dev.langchain4j.agentic.Agent;
import dev.langchain4j.service.MemoryId;
import dev.langchain4j.service.UserMessage;
import dev.langchain4j.service.V;

public interface ShopChatAgent {
    @Agent
    String chat(@MemoryId String memoryId, @UserMessage @V("request") String request);
}
