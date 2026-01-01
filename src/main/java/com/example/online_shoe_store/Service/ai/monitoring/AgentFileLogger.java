package com.example.online_shoe_store.Service.ai.monitoring;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import jakarta.annotation.PostConstruct;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Map;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * Utility để ghi log chi tiết agent ra file TXT
 * Ghi log: agent calls, tool executions, inputs, outputs
 * Format rõ ràng với visual separation cho từng agent
 */
@Component
@Slf4j
public class AgentFileLogger {

    @Value("${agent.logging.directory:logs/agent}")
    private String logDirectory;

    private static final DateTimeFormatter DATE_FORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd");
    private static final DateTimeFormatter TIME_FORMATTER = DateTimeFormatter.ofPattern("HH:mm:ss.SSS");
    private static final ObjectMapper objectMapper = new ObjectMapper()
            .enable(SerializationFeature.INDENT_OUTPUT);

    // Track agent hierarchy depth
    private final AtomicInteger agentDepth = new AtomicInteger(0);
    
    // Track last responding agent for each session
    private final Map<String, String> lastRespondingAgent = new java.util.concurrent.ConcurrentHashMap<>();

    @PostConstruct
    public void init() {
        try {
            Path logPath = Paths.get(logDirectory);
            if (!Files.exists(logPath)) {
                Files.createDirectories(logPath);
                log.info("Created agent log directory: {}", logPath.toAbsolutePath());
            }
        } catch (IOException e) {
            log.error("Failed to create log directory", e);
        }
    }

    private Path getLogFilePath(String sessionId) {
        String date = LocalDateTime.now().format(DATE_FORMATTER);
        String filename = String.format("agent_%s_%s.txt", date, sanitizeFilename(sessionId));
        return Paths.get(logDirectory, filename);
    }

    private String sanitizeFilename(String sessionId) {
        if (sessionId == null) return "unknown";
        return sessionId.replaceAll("[^a-zA-Z0-9_-]", "_").substring(0, Math.min(50, sessionId.length()));
    }

    /**
     * Ghi header cho một session mới
     */
    public void logSessionStart(String sessionId, String userId) {
        agentDepth.set(0);
        StringBuilder sb = new StringBuilder();
        sb.append("\n");
        sb.append("╔══════════════════════════════════════════════════════════════════════════════╗\n");
        sb.append("║                           🚀 NEW CHAT SESSION                                ║\n");
        sb.append("╠══════════════════════════════════════════════════════════════════════════════╣\n");
        sb.append(String.format("║  📋 Session : %-62s ║\n", sessionId));
        sb.append(String.format("║  👤 User    : %-62s ║\n", userId));
        sb.append(String.format("║  🕐 Time    : %-62s ║\n", LocalDateTime.now()));
        sb.append("╚══════════════════════════════════════════════════════════════════════════════╝\n\n");
        appendToFile(sessionId, sb.toString());
    }

    /**
     * Ghi log khi agent bắt đầu xử lý - với icon theo loại agent
     * Hiển thị TOÀN BỘ inputs không truncate
     */
    public void logAgentStart(String sessionId, String agentId, String agentName, Map<String, Object> inputs) {
        int depth = agentDepth.incrementAndGet();
        String indent = getIndent(depth);
        String icon = getAgentIcon(agentName);
        String agentType = getAgentType(agentName);
        String timestamp = LocalDateTime.now().format(TIME_FORMATTER);
        
        StringBuilder sb = new StringBuilder();
        sb.append("\n");
        sb.append(indent).append("┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓\n");
        sb.append(indent).append(String.format("┃ %s [%s] %-57s ┃\n", icon, agentType, agentName));
        sb.append(indent).append(String.format("┃   ID: %-68s ┃\n", agentId));
        sb.append(indent).append(String.format("┃   ⏰ Started: %-59s ┃\n", timestamp));
        sb.append(indent).append("┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫\n");
        sb.append(indent).append("┃ 📥 INPUTS (Full Context Window):                                            ┃\n");
        sb.append(indent).append("┃──────────────────────────────────────────────────────────────────────────────┃\n");
        
        if (inputs != null && !inputs.isEmpty()) {
            for (Map.Entry<String, Object> entry : inputs.entrySet()) {
                String key = entry.getKey();
                Object value = entry.getValue();
                
                // Header for each input
                sb.append(indent).append(String.format("┃ 📌 %s:\n", key));
                
                // Format full value with line wrapping
                String fullValue = formatFullValue(value);
                String[] lines = fullValue.split("\n");
                for (String line : lines) {
                    // Wrap lines that are too long
                    if (line.length() > 72) {
                        for (int i = 0; i < line.length(); i += 72) {
                            sb.append(indent).append("┃     ").append(line.substring(i, Math.min(i + 72, line.length()))).append("\n");
                        }
                    } else {
                        sb.append(indent).append("┃     ").append(line).append("\n");
                    }
                }
                sb.append(indent).append("┃\n");
            }
        } else {
            sb.append(indent).append("┃   (No inputs)\n");
        }
        
        sb.append(indent).append("┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫\n");
        sb.append(indent).append("┃ ⏳ Processing...                                                             ┃\n");
        
        appendToFile(sessionId, sb.toString());
    }

    /**
     * Ghi log khi agent hoàn thành với output rõ ràng
     */
    public void logAgentComplete(String sessionId, String agentId, String agentName, 
                                  Object output, long durationMs) {
        int depth = agentDepth.getAndDecrement();
        String indent = getIndent(depth);
        String icon = getAgentIcon(agentName);
        String status = durationMs > 5000 ? "⚠️ SLOW" : "✅ OK";
        
        // Track the last agent that produced output (for final response attribution)
        if (output != null && sessionId != null) {
            String outputStr = String.valueOf(output);
            if (!outputStr.isBlank() && !outputStr.equals("(null)")) {
                lastRespondingAgent.put(sessionId, agentName + " (" + agentId + ")");
            }
        }
        
        StringBuilder sb = new StringBuilder();
        sb.append(indent).append("┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫\n");
        sb.append(indent).append(String.format("┃ 📤 OUTPUT: [%s] Duration: %-45s ┃\n", status, durationMs + "ms"));
        sb.append(indent).append("┃──────────────────────────────────────────────────────────────────────────────┃\n");
        
        // Format output với proper indentation
        String outputStrFormatted = formatOutputForBox(output, indent);
        sb.append(outputStrFormatted);
        
        sb.append(indent).append("┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛\n");
        
        appendToFile(sessionId, sb.toString());
    }

    /**
     * Ghi log khi agent gặp lỗi
     */
    public void logAgentError(String sessionId, String agentId, String agentName, 
                               Throwable error, Map<String, Object> inputs) {
        int depth = Math.max(1, agentDepth.getAndDecrement());
        String indent = getIndent(depth);
        
        StringBuilder sb = new StringBuilder();
        sb.append("\n");
        sb.append(indent).append("╔══════════════════════════════════════════════════════════════════════════════╗\n");
        sb.append(indent).append("║ ❌ AGENT ERROR                                                               ║\n");
        sb.append(indent).append("╠══════════════════════════════════════════════════════════════════════════════╣\n");
        sb.append(indent).append(String.format("║  Agent : %-66s ║\n", agentName));
        sb.append(indent).append(String.format("║  ID    : %-66s ║\n", agentId));
        sb.append(indent).append(String.format("║  Error : %-66s ║\n", error.getClass().getSimpleName()));
        sb.append(indent).append("╠══════════════════════════════════════════════════════════════════════════════╣\n");
        sb.append(indent).append("║  Message:                                                                    ║\n");
        sb.append(indent).append(String.format("║    %s\n", truncate(error.getMessage(), 70)));
        sb.append(indent).append("║  Stack Trace:                                                                ║\n");
        
        StackTraceElement[] stack = error.getStackTrace();
        for (int i = 0; i < Math.min(3, stack.length); i++) {
            sb.append(indent).append(String.format("║    at %s\n", truncate(stack[i].toString(), 68)));
        }
        
        sb.append(indent).append("╚══════════════════════════════════════════════════════════════════════════════╝\n\n");
        appendToFile(sessionId, sb.toString());
    }

    /**
     * Ghi log khi tool được gọi - với separator rõ ràng
     */
    public void logToolExecution(String sessionId, String agentName, String toolName, 
                                  Object toolInput, Object toolOutput, long durationMs) {
        int depth = agentDepth.get();
        String indent = getIndent(depth + 1);
        String timestamp = LocalDateTime.now().format(TIME_FORMATTER);
        
        StringBuilder sb = new StringBuilder();
        sb.append("\n");
        sb.append(indent).append("╭┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄╮\n");
        sb.append(indent).append(String.format("┊ 🔧 TOOL: %-64s ┊\n", toolName));
        sb.append(indent).append(String.format("┊    Called by: %-59s ┊\n", agentName));
        sb.append(indent).append(String.format("┊    Time: %s | Duration: %-37s ┊\n", timestamp, durationMs + "ms"));
        sb.append(indent).append("├┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┤\n");
        sb.append(indent).append("┊ 📥 Input:                                                                   ┊\n");
        sb.append(formatToolValue(toolInput, indent + "┊   "));
        sb.append(indent).append("├┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┤\n");
        sb.append(indent).append("┊ 📤 Output:                                                                  ┊\n");
        sb.append(formatToolValue(toolOutput, indent + "┊   "));
        sb.append(indent).append("╰┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄╯\n");
        
        appendToFile(sessionId, sb.toString());
    }

    /**
     * Ghi log user message - clearly separated
     */
    public void logUserMessage(String sessionId, String message) {
        String timestamp = LocalDateTime.now().format(TIME_FORMATTER);
        StringBuilder sb = new StringBuilder();
        sb.append("\n");
        sb.append("╔══════════════════════════════════════════════════════════════════════════════╗\n");
        sb.append(String.format("║ 👤 USER MESSAGE [%s]                                         ║\n", timestamp));
        sb.append("╠══════════════════════════════════════════════════════════════════════════════╣\n");
        sb.append("║  ").append(truncate(message, 73)).append("\n");
        sb.append("╚══════════════════════════════════════════════════════════════════════════════╝\n\n");
        appendToFile(sessionId, sb.toString());
    }

    /**
     * Ghi log assistant response - final output
     */
    public void logAssistantResponse(String sessionId, String response, long totalDurationMs) {
        String timestamp = LocalDateTime.now().format(TIME_FORMATTER);
        String respondingAgent = lastRespondingAgent.getOrDefault(sessionId, "Unknown");
        String agentIcon = getAgentIcon(respondingAgent);
        
        StringBuilder sb = new StringBuilder();
        sb.append("\n");
        sb.append("╔══════════════════════════════════════════════════════════════════════════════╗\n");
        sb.append(String.format("║ 🤖 ASSISTANT RESPONSE [%s]                                    ║\n", timestamp));
        sb.append("╠══════════════════════════════════════════════════════════════════════════════╣\n");
        sb.append(String.format("║ %s Answered by: %-60s ║\n", agentIcon, truncate(respondingAgent, 55)));
        sb.append("╠══════════════════════════════════════════════════════════════════════════════╣\n");
        
        // Format response with line wrapping
        String[] lines = response.split("\n");
        for (String line : lines) {
            if (line.length() > 74) {
                for (int i = 0; i < line.length(); i += 74) {
                    sb.append("║  ").append(line.substring(i, Math.min(i + 74, line.length()))).append("\n");
                }
            } else {
                sb.append("║  ").append(line).append("\n");
            }
        }
        
        sb.append("╠══════════════════════════════════════════════════════════════════════════════╣\n");
        sb.append(String.format("║  ⏱️ Total Processing Time: %-48s ║\n", totalDurationMs + "ms"));
        sb.append("╚══════════════════════════════════════════════════════════════════════════════╝\n");
        sb.append("\n════════════════════════════════════════════════════════════════════════════════\n\n");
        appendToFile(sessionId, sb.toString());
    }

    /**
     * Ghi log Full LLM Call - Context Window đầy đủ
     * Bao gồm: System Message, User Messages, Assistant Messages, Tool Results
     */
    public void logLLMCall(String sessionId, String modelName, java.util.List<String> formattedMessages, long durationMs) {
        int depth = agentDepth.get();
        String indent = getIndent(depth + 1);
        String timestamp = LocalDateTime.now().format(TIME_FORMATTER);
        
        StringBuilder sb = new StringBuilder();
        sb.append("\n");
        sb.append(indent).append("╭────────────────────────────────────────────────────────────────────────────╮\n");
        sb.append(indent).append(String.format("│ 🧠 LLM CALL [%s]                                               │\n", timestamp));
        sb.append(indent).append(String.format("│    Model: %-63s │\n", modelName != null ? modelName : "default"));
        sb.append(indent).append(String.format("│    Duration: %-60s │\n", durationMs + "ms"));
        sb.append(indent).append("├────────────────────────────────────────────────────────────────────────────┤\n");
        sb.append(indent).append("│ 📜 CONTEXT WINDOW (Full Chat History):                                    │\n");
        sb.append(indent).append("├────────────────────────────────────────────────────────────────────────────┤\n");
        
        if (formattedMessages != null && !formattedMessages.isEmpty()) {
            for (String msg : formattedMessages) {
                String[] lines = msg.split("\n");
                for (String line : lines) {
                    if (line.length() > 72) {
                        for (int i = 0; i < line.length(); i += 72) {
                            sb.append(indent).append("│ ").append(line.substring(i, Math.min(i + 72, line.length()))).append("\n");
                        }
                    } else {
                        sb.append(indent).append("│ ").append(line).append("\n");
                    }
                }
            }
        } else {
            sb.append(indent).append("│ (No messages)\n");
        }
        
        sb.append(indent).append("╰────────────────────────────────────────────────────────────────────────────╯\n");
        
        appendToFile(sessionId, sb.toString());
    }

    /**
     * Ghi log Token Usage
     */
    public void logTokenUsage(String sessionId, String modelName, int inputTokens, int outputTokens, int totalTokens, long durationMs) {
        int depth = agentDepth.get();
        String indent = getIndent(depth + 1);
        String timestamp = LocalDateTime.now().format(TIME_FORMATTER);
        
        StringBuilder sb = new StringBuilder();
        sb.append(indent).append("╭─────────────────────────────────────────────────────────────────────────────╮\n");
        sb.append(indent).append(String.format("│ 📊 TOKEN USAGE [%s]                                             │\n", timestamp));
        sb.append(indent).append("├─────────────────────────────────────────────────────────────────────────────┤\n");
        sb.append(indent).append(String.format("│  Model     : %-62s │\n", modelName != null ? modelName : "default"));
        sb.append(indent).append(String.format("│  Input     : %-10d tokens                                        │\n", inputTokens));
        sb.append(indent).append(String.format("│  Output    : %-10d tokens                                        │\n", outputTokens));
        sb.append(indent).append(String.format("│  Total     : %-10d tokens                                        │\n", totalTokens));
        sb.append(indent).append(String.format("│  Duration  : %-10d ms                                            │\n", durationMs));
        sb.append(indent).append("╰─────────────────────────────────────────────────────────────────────────────╯\n");
        
        appendToFile(sessionId, sb.toString());
    }

    /**
     * Ghi log session end
     */
    public void logSessionEnd(String sessionId) {
        agentDepth.set(0);
        lastRespondingAgent.remove(sessionId); // Cleanup
        StringBuilder sb = new StringBuilder();
        sb.append("\n");
        sb.append("╔══════════════════════════════════════════════════════════════════════════════╗\n");
        sb.append("║                           🏁 SESSION ENDED                                   ║\n");
        sb.append(String.format("║  Time: %-69s ║\n", LocalDateTime.now()));
        sb.append("╚══════════════════════════════════════════════════════════════════════════════╝\n\n\n");
        appendToFile(sessionId, sb.toString());
    }

    // ═══════════════════════════════════════════
    // PRIVATE HELPERS
    // ═══════════════════════════════════════════

    private String getIndent(int depth) {
        return "  ".repeat(Math.max(0, depth - 1));
    }

    private String getAgentIcon(String agentName) {
        if (agentName == null) return "🤖";
        String lower = agentName.toLowerCase();
        if (lower.contains("context") || lower.contains("prepare")) return "📋";
        if (lower.contains("intent") || lower.contains("classify") || lower.contains("router")) return "🎯";
        if (lower.contains("product") || lower.contains("advise")) return "👟";
        if (lower.contains("order")) return "📦";
        if (lower.contains("policy")) return "📜";
        if (lower.contains("small") || lower.contains("respond")) return "💬";
        if (lower.contains("conditional")) return "🔀";
        if (lower.contains("chat")) return "🤖";
        return "⚙️";
    }

    private String getAgentType(String agentName) {
        if (agentName == null) return "AGENT";
        String lower = agentName.toLowerCase();
        if (lower.contains("context") || lower.contains("prepare")) return "CONTEXT";
        if (lower.contains("intent") || lower.contains("classify") || lower.contains("router")) return "ROUTER";
        if (lower.contains("product") || lower.contains("advise")) return "PRODUCT";
        if (lower.contains("order")) return "ORDER";
        if (lower.contains("policy")) return "POLICY";
        if (lower.contains("small") || lower.contains("respond")) return "TALK";
        if (lower.contains("conditional")) return "SWITCH";
        if (lower.contains("chat")) return "MAIN";
        return "AGENT";
    }

    /**
     * Format full value without truncation - for complete context window logging
     */
    private String formatFullValue(Object value) {
        if (value == null) return "(null)";
        
        try {
            // Try to format as pretty JSON if it's Map or List
            if (value instanceof Map || value instanceof java.util.List) {
                return objectMapper.writeValueAsString(value);
            }
        } catch (Exception ignored) {}
        
        return String.valueOf(value);
    }

    private String formatValue(Object value, int maxLen) {
        if (value == null) return "(null)";
        String str = String.valueOf(value).replace("\n", " ");
        if (str.length() > maxLen) {
            return str.substring(0, maxLen) + "...";
        }
        return str;
    }

    private String truncate(String str, int maxLen) {
        if (str == null) return "(null)";
        if (str.length() <= maxLen) return str;
        return str.substring(0, maxLen) + "...";
    }

    private String formatOutputForBox(Object output, String indent) {
        if (output == null) return indent + "┃  (null)\n";
        String str = String.valueOf(output);
        String[] lines = str.split("\n");
        StringBuilder sb = new StringBuilder();
        for (String line : lines) {
            if (line.length() > 72) {
                for (int i = 0; i < line.length(); i += 72) {
                    sb.append(indent).append("┃  ").append(line.substring(i, Math.min(i + 72, line.length()))).append("\n");
                }
            } else {
                sb.append(indent).append("┃  ").append(line).append("\n");
            }
        }
        return sb.toString();
    }

    private String formatToolValue(Object value, String prefix) {
        if (value == null) return prefix + "(null)\n";
        
        try {
            if (value instanceof Map || value instanceof java.util.List) {
                String json = objectMapper.writeValueAsString(value);
                String[] lines = json.split("\n");
                StringBuilder sb = new StringBuilder();
                for (String line : lines) {
                    sb.append(prefix).append(line).append("\n");
                }
                return sb.toString();
            }
        } catch (Exception ignored) {}
        
        String str = String.valueOf(value);
        String[] lines = str.split("\n");
        StringBuilder sb = new StringBuilder();
        for (String line : lines) {
            if (line.length() > 70) {
                sb.append(prefix).append(line.substring(0, 70)).append("...\n");
            } else {
                sb.append(prefix).append(line).append("\n");
            }
        }
        return sb.toString();
    }

    private synchronized void appendToFile(String sessionId, String content) {
        Path filePath = getLogFilePath(sessionId);
        try (FileWriter fw = new FileWriter(filePath.toFile(), true);
             PrintWriter pw = new PrintWriter(fw)) {
            pw.print(content);
            pw.flush();
        } catch (IOException e) {
            log.error("Failed to write to agent log file: {}", filePath, e);
        }
    }
}

