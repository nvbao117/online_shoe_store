package com.example.online_shoe_store.Service.ai.monitoring;

import dev.langchain4j.data.message.*;
import dev.langchain4j.model.chat.listener.ChatModelErrorContext;
import dev.langchain4j.model.chat.listener.ChatModelListener;
import dev.langchain4j.model.chat.listener.ChatModelRequestContext;
import dev.langchain4j.model.chat.listener.ChatModelResponseContext;
import dev.langchain4j.model.chat.request.ChatRequest;
import dev.langchain4j.model.chat.response.ChatResponse;
import dev.langchain4j.model.output.TokenUsage;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * ChatModelListener để ghi log chi tiết:
 * - Full Context Window (tất cả messages)
 * - Token Usage (input/output tokens)
 * - Tool Executions
 */
@Component
@Slf4j
@RequiredArgsConstructor
public class ToolLoggingChatModelListener implements ChatModelListener {

    private final AgentFileLogger fileLogger;
    private final com.example.online_shoe_store.Service.ai.context.ProductJsonHolder productJsonHolder;
    
    private static final String START_TIME_KEY = "request_start_time";
    private static final String SESSION_ID_KEY = "session_id";
    private static final String MESSAGES_KEY = "request_messages";
    private static final String MODEL_NAME_KEY = "model_name";
    
    private static final ThreadLocal<String> currentSessionId = new ThreadLocal<>();
    private final Map<String, ToolCallInfo> pendingToolCalls = new ConcurrentHashMap<>();
    
    public static void setCurrentSession(String sessionId) {
        currentSessionId.set(sessionId);
    }
    
    public static void clearCurrentSession() {
        currentSessionId.remove();
    }
    
    public static String getCurrentSession() {
        return currentSessionId.get();
    }

    @Override
    public void onRequest(ChatModelRequestContext ctx) {
        long startTime = System.currentTimeMillis();
        ctx.attributes().put(START_TIME_KEY, startTime);
        
        String sessionId = currentSessionId.get();
        if (sessionId != null) {
            ctx.attributes().put(SESSION_ID_KEY, sessionId);
        }
        
        ChatRequest request = ctx.chatRequest();
        List<ChatMessage> messages = request.messages();
        
        // Store messages for later logging with response
        List<String> formattedMessages = formatMessagesForLog(messages);
        ctx.attributes().put(MESSAGES_KEY, formattedMessages);
        
        // Store model name
        String modelName = request.parameters() != null ? request.parameters().modelName() : null;
        ctx.attributes().put(MODEL_NAME_KEY, modelName != null ? modelName : ctx.modelProvider().toString());
        
        // Process tool execution results
        for (ChatMessage msg : messages) {
            if (msg instanceof ToolExecutionResultMessage toolResult) {
                String toolId = toolResult.id();
                String toolName = toolResult.toolName();
                String toolOutput = toolResult.text();
                
                ToolCallInfo callInfo = pendingToolCalls.remove(toolId);
                long toolDuration = callInfo != null ? System.currentTimeMillis() - callInfo.startTime : 0;
                String toolInput = callInfo != null ? callInfo.arguments : "(unknown)";
                String agentName = callInfo != null ? callInfo.agentName : "Unknown";
                
                String logSessionId = sessionId != null ? sessionId : "unknown";
                
                fileLogger.logToolExecution(logSessionId, agentName, toolName, toolInput, toolOutput, toolDuration);
                log.info("[Tool] {} executed in {}ms", toolName, toolDuration);
                
                // Capture JSON block for later injection if LLM ignores it
                if (productJsonHolder != null && toolOutput != null) {
                    productJsonHolder.captureFromToolResult(logSessionId, toolOutput);
                }
            }
        }
    }

    @Override
    public void onResponse(ChatModelResponseContext ctx) {
        Long startTime = (Long) ctx.attributes().get(START_TIME_KEY);
        long duration = startTime != null ? System.currentTimeMillis() - startTime : 0;
        
        String sessionId = (String) ctx.attributes().get(SESSION_ID_KEY);
        if (sessionId == null) {
            sessionId = currentSessionId.get();
        }
        String logSessionId = sessionId != null ? sessionId : "unknown";
        
        @SuppressWarnings("unchecked")
        List<String> formattedMessages = (List<String>) ctx.attributes().get(MESSAGES_KEY);
        String modelName = (String) ctx.attributes().get(MODEL_NAME_KEY);
        
        ChatResponse response = ctx.chatResponse();
        AiMessage aiMessage = response.aiMessage();
        
        // Log Full Context Window
        if (formattedMessages != null && !formattedMessages.isEmpty()) {
            // Add AI response to the context
            List<String> fullContext = new ArrayList<>(formattedMessages);
            fullContext.add(formatAiMessage(aiMessage));
            
            fileLogger.logLLMCall(logSessionId, modelName, fullContext, duration);
        }
        
        // Log Token Usage
        TokenUsage tokenUsage = response.metadata().tokenUsage();
        if (tokenUsage != null) {
            fileLogger.logTokenUsage(
                    logSessionId,
                    modelName,
                    tokenUsage.inputTokenCount() != null ? tokenUsage.inputTokenCount() : 0,
                    tokenUsage.outputTokenCount() != null ? tokenUsage.outputTokenCount() : 0,
                    tokenUsage.totalTokenCount() != null ? tokenUsage.totalTokenCount() : 0,
                    duration
            );
            
            log.info("[LLM] {} | Tokens: in={}, out={}, total={} | Duration: {}ms",
                    modelName,
                    tokenUsage.inputTokenCount(),
                    tokenUsage.outputTokenCount(),
                    tokenUsage.totalTokenCount(),
                    duration);
        }
        
        // Track pending tool calls
        if (aiMessage.hasToolExecutionRequests()) {
            for (var toolRequest : aiMessage.toolExecutionRequests()) {
                pendingToolCalls.put(toolRequest.id(), new ToolCallInfo(
                        toolRequest.name(),
                        toolRequest.arguments(),
                        System.currentTimeMillis(),
                        "Agent"
                ));
            }
        }
    }

    @Override
    public void onError(ChatModelErrorContext ctx) {
        String sessionId = (String) ctx.attributes().get(SESSION_ID_KEY);
        if (sessionId == null) {
            sessionId = currentSessionId.get();
        }
        String logSessionId = sessionId != null ? sessionId : "unknown";
        
        log.error("[LLM Error] Session: {}, Error: {}", logSessionId, ctx.error().getMessage());
        
        if (!logSessionId.equals("unknown")) {
            fileLogger.logAgentError(logSessionId, "LLM", "ChatModel", 
                    ctx.error(), Map.of("model", ctx.modelProvider().toString()));
        }
    }

    // ═══════════════════════════════════════════
    // FORMAT HELPERS
    // ═══════════════════════════════════════════
    
    private List<String> formatMessagesForLog(List<ChatMessage> messages) {
        List<String> formatted = new ArrayList<>();
        for (ChatMessage msg : messages) {
            formatted.add(formatMessage(msg));
        }
        return formatted;
    }
    
    private String formatMessage(ChatMessage msg) {
        if (msg instanceof SystemMessage sys) {
            return "📋 [SYSTEM MESSAGE]\n" + sys.text();
        } else if (msg instanceof UserMessage user) {
            return "👤 [USER MESSAGE]\n" + user.singleText();
        } else if (msg instanceof AiMessage ai) {
            return formatAiMessage(ai);
        } else if (msg instanceof ToolExecutionResultMessage tool) {
            return "🔧 [TOOL RESULT: " + tool.toolName() + "]\n" + truncate(tool.text(), 500);
        } else {
            return "📝 [" + msg.type() + "]\n" + msg.toString();
        }
    }
    
    private String formatAiMessage(AiMessage ai) {
        StringBuilder sb = new StringBuilder();
        sb.append("🤖 [AI MESSAGE]\n");
        
        if (ai.text() != null && !ai.text().isBlank()) {
            sb.append(ai.text());
        }
        
        if (ai.hasToolExecutionRequests()) {
            sb.append("\n📞 Tool Calls:");
            for (var tool : ai.toolExecutionRequests()) {
                sb.append("\n  → ").append(tool.name()).append("(").append(truncate(tool.arguments(), 100)).append(")");
            }
        }
        
        return sb.toString();
    }
    
    private String truncate(String str, int maxLen) {
        if (str == null) return "(null)";
        if (str.length() <= maxLen) return str;
        return str.substring(0, maxLen) + "...[truncated]";
    }
    
    private static class ToolCallInfo {
        final String name;
        final String arguments;
        final long startTime;
        final String agentName;
        
        ToolCallInfo(String name, String arguments, long startTime, String agentName) {
            this.name = name;
            this.arguments = arguments;
            this.startTime = startTime;
            this.agentName = agentName;
        }
    }
}

