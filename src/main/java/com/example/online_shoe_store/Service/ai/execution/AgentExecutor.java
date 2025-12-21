package com.example.online_shoe_store.Service.ai.execution;

import com.example.online_shoe_store.Service.ai.agent.*;
import com.example.online_shoe_store.Service.ai.tool.SupportTools;
import com.example.online_shoe_store.Service.ai.memory.HybridMemoryService;
import com.example.online_shoe_store.dto.orchestrator.RoutingDecision;
import com.example.online_shoe_store.dto.orchestrator.SupervisorResponse;
import com.example.online_shoe_store.Entity.enums.AgentType;
import com.example.online_shoe_store.Entity.enums.RiskLevel;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.Executor;
import java.util.stream.Collectors;

@Service
@Slf4j
@RequiredArgsConstructor
public class AgentExecutor {

    private static final Set<String> ALLOWED_AGENTS = Set.of("PRODUCT", "SUPPORT");

    private static final Map<String, String> AGENT_SYNONYMS = Map.of(
        "SEARCH", "PRODUCT",
        "SALES", "PRODUCT",
        "INVENTORY", "PRODUCT",
        "FAQ", "SUPPORT",
        "RETURN", "SUPPORT",
        "RETURNS", "SUPPORT",
        "COMPLAINT", "SUPPORT",
        "COMPLAINTS", "SUPPORT",
        "LOGISTICS", "SUPPORT",
        "MARKETING", "SUPPORT"
    );

    private final OrchestratorAgent orchestratorAgent;
    private final ProductAgent productAgent;
    private final SupportAgent supportAgent;
    private final SummarizerAgent summarizerAgent;
    private final SupportTools supportTools;
    private final HybridMemoryService hybridMemoryService;
    private final Executor agentTaskExecutor;

    private final Map<String, EscalationContext> pendingEscalations = new ConcurrentHashMap<>();

    private record ExecutionOutcome(String response, List<String> agentsUsed) {}

    public SupervisorResponse process(String sessionId, String userMessage) {
        long startTime = System.currentTimeMillis();

        EscalationContext pending = sessionId != null ? pendingEscalations.get(sessionId) : null;
        if (pending != null) {
            if (isAffirmative(userMessage)) {
                String ticket = supportTools.escalateToHuman(
                    pending.reason(),
                    pending.priority(),
                    sessionId,
                    pending.lastMessage()
                );
                pendingEscalations.remove(sessionId);
                long processingTime = System.currentTimeMillis() - startTime;
                return SupervisorResponse.builder()
                        .response(ticket + "\n\nĐã chuyển cho nhân viên. Bạn cần hỗ trợ gì thêm không?")
                        .sessionId(sessionId)
                        .agentsUsed(List.of(AgentType.SUPPORT_SERVICES))
                        .processingTimeMs(processingTime)
                        .escalationTriggered(true)
                        .escalationReason(pending.reason())
                        .build();
            }
            if (isNegative(userMessage)) {
                pendingEscalations.remove(sessionId);
                long processingTime = System.currentTimeMillis() - startTime;
                return SupervisorResponse.builder()
                        .response("Đã tạm hoãn kết nối với nhân viên. Mình vẫn có thể hỗ trợ thêm qua chatbot!")
                        .sessionId(sessionId)
                        .agentsUsed(List.of(AgentType.SUPPORT_SERVICES))
                        .processingTimeMs(processingTime)
                        .escalationTriggered(false)
                        .escalationReason(pending.reason())
                        .build();
            }
        }

        // BƯỚC 0: ENRICH MESSAGE VỚI CONVERSATION CONTEXT
        String enrichedForOrchestrator = hybridMemoryService.enrichWithContext(sessionId, userMessage);
        log.info("Enriched message for orchestrator: {}", 
            enrichedForOrchestrator.length() > 200 
                ? enrichedForOrchestrator.substring(0, 200) + "..." 
                : enrichedForOrchestrator);

        // BƯỚC 1: ORCHESTRATOR PHÂN TÍCH (với context)
        log.info("Orchestrator analyzing intent...");
        RoutingDecision decision = orchestratorAgent.decide(enrichedForOrchestrator, sessionId);

        System.out.println("Orchestrator analyzing intent: " + decision);

        String rawTargetAgent = decision.getTargetAgent();
        String resolvedPrimary = decision.getPrimaryAgent();
        String targetAgentForRouting = rawTargetAgent != null && !rawTargetAgent.isBlank()
            ? rawTargetAgent
            : resolvedPrimary;
        
        log.info("Decision: targetAgent={} | routingTarget={} | primaryAgent={} | risk={}",
            rawTargetAgent,
            targetAgentForRouting,
            decision.getPrimaryAgent(), 
            decision.getRiskLevel());

        String finalResponse;
        List<String> agentsUsedNames = List.of();
        boolean onlyDirectResponse = (rawTargetAgent == null || rawTargetAgent.isBlank()) 
            && (resolvedPrimary == null || resolvedPrimary.isBlank())
            && decision.getDirectResponse() != null && !decision.getDirectResponse().isBlank();

        boolean forceSupportInsteadOfDirect = onlyDirectResponse
            && shouldRouteToSupportInsteadOfDirect(userMessage, decision.getDirectResponse());

        // BƯỚC 2: XỬ LÝ
        if (forceSupportInsteadOfDirect) {
            log.warn("Overriding orchestrator directResponse -> SUPPORT (RAG) for message: {}",
                userMessage != null && userMessage.length() > 120 ? userMessage.substring(0, 120) + "..." : userMessage);
            String enriched = hybridMemoryService.enrichWithContext(sessionId, userMessage);
            finalResponse = routeToAgent("SUPPORT", sessionId, enriched);
            agentsUsedNames = List.of("SUPPORT");
            log.info("[AGENT RESPONSE] agent=SUPPORT | length={} | preview: {}",
                finalResponse.length(),
                finalResponse.substring(0, Math.min(100, finalResponse.length())));
        } else if (Boolean.TRUE.equals(decision.getRequiresEscalation())) {
            log.info("Escalation requested: {}", decision.getEscalationReason());
            String priority = mapPriority(decision);
            pendingEscalations.put(sessionId, new EscalationContext(
                decision.getEscalationReason() != null ? decision.getEscalationReason() : userMessage,
                priority,
                userMessage
            ));

            String base = decision.getDirectResponse() != null && !decision.getDirectResponse().isBlank()
                ? decision.getDirectResponse()
                : "Yêu cầu của bạn cần nhân viên hỗ trợ trực tiếp.";

            finalResponse = base + "\n\n" +
                "Bạn có muốn kết nối với nhân viên không?" + "\n" +
                "- Trả lời 'Có' để mình tạo ticket và chuyển ngay." + "\n" +
                "- Trả lời 'Không' nếu muốn tiếp tục trao đổi với chatbot.";
            log.info("[ESCALATION RESPONSE] length={} | preview: {}", 
                finalResponse.length(), 
                finalResponse.substring(0, Math.min(100, finalResponse.length())));
        } else if (onlyDirectResponse) {
            log.info("Direct response from Orchestrator (no routing)");
            finalResponse = decision.getDirectResponse();
            log.info("[DIRECT RESPONSE] length={} | preview: {}", 
                finalResponse.length(), 
                finalResponse.substring(0, Math.min(100, finalResponse.length())));
        } else {
            String enriched = hybridMemoryService.enrichWithContext(sessionId, userMessage);
            String agentToRoute = targetAgentForRouting != null ? targetAgentForRouting : "SUPPORT";
            ExecutionOutcome outcome = executeAccordingToDecision(decision, sessionId, enriched, agentToRoute);
            finalResponse = outcome.response();
            agentsUsedNames = outcome.agentsUsed();
            log.info("[AGENT RESPONSE] agent={} | length={} | preview: {}", 
                agentToRoute, 
                finalResponse.length(), 
                finalResponse.substring(0, Math.min(100, finalResponse.length())));
        }

        long processingTime = System.currentTimeMillis() - startTime;
        
        log.info("[FINAL RESPONSE] sessionId={} | length={} | time={}ms", 
            sessionId, finalResponse.length(), processingTime);

        // BƯỚC 3: TRẢ KẾT QUẢ
        return SupervisorResponse.builder()
                .response(finalResponse)
                .sessionId(sessionId)
            .agentsUsed(!onlyDirectResponse
                ? agentsUsedNames.stream().map(this::mapToAgentType).collect(Collectors.toList())
                : List.of())
                .processingTimeMs(processingTime)
                .escalationTriggered(Boolean.TRUE.equals(decision.getRequiresEscalation()))
                .escalationReason(decision.getEscalationReason())
                .build();
    }

    private boolean shouldRouteToSupportInsteadOfDirect(String userMessage, String directResponse) {
        if (userMessage == null) return false;
        String q = userMessage.toLowerCase();

        // Any contact/info/policy question must go through SUPPORT agent with FAQ RAG.
        boolean isContactQuestion = q.contains("email")
                || q.contains("e-mail")
                || q.contains("mail")
                || q.contains("số điện thoại")
                || q.contains("so dien thoai")
                || q.contains("hotline")
                || q.contains("liên hệ")
                || q.contains("lien he")
                || q.contains("địa chỉ")
                || q.contains("dia chi")
                || q.contains("support")
                || q.contains("csbh")
                || q.contains("chăm sóc")
                || q.contains("cham soc");

        if (!isContactQuestion) return false;

        // If orchestrator tried to answer with a direct response, treat as unsafe.
        return directResponse != null && !directResponse.isBlank();
    }

    private ExecutionOutcome executeAccordingToDecision(
            RoutingDecision decision,
            String sessionId,
            String userMessage,
            String fallbackTargetAgent
    ) {
        boolean parallelRequested = Boolean.TRUE.equals(decision.getParallel());
        boolean requiresA2A = Boolean.TRUE.equals(decision.getRequiresA2A());

        if (parallelRequested && decision.hasSecondaryAgents() && !requiresA2A) {
            return executeParallelFanOut(decision, sessionId, userMessage);
        }

        String targetAgent = (fallbackTargetAgent != null && !fallbackTargetAgent.isBlank())
                ? fallbackTargetAgent
                : (decision.getTargetAgent() != null ? decision.getTargetAgent() : "SUPPORT");

        String response = executeWithSecondary(decision, sessionId, userMessage, targetAgent);

        List<String> used = new ArrayList<>();
        used.add(targetAgent);
        if (decision.hasSecondaryAgents() && !parallelRequested) {
            used.addAll(decision.getSecondaryAgents());
        }

        return new ExecutionOutcome(response, normalizeAgentsList(used));
    }

    private ExecutionOutcome executeParallelFanOut(RoutingDecision decision, String sessionId, String userMessage) {
        List<String> agentsToRun = normalizeAgentsList(new ArrayList<>(new LinkedHashSet<>(decision.getAllAgents())));

        if (agentsToRun.size() <= 1) {
            String agent = agentsToRun.isEmpty()
                    ? (decision.getTargetAgent() != null ? decision.getTargetAgent() : "SUPPORT")
                    : agentsToRun.get(0);
            String response = routeToAgent(agent, sessionId, userMessage);
            return new ExecutionOutcome(response, List.of(normalizeAgent(agent)));
        }

        List<CompletableFuture<String>> futures = new ArrayList<>();
        for (String agent : agentsToRun) {
            String isolatedMemoryId = sessionId + "::" + agent;
            futures.add(CompletableFuture.supplyAsync(
                    () -> routeToAgent(agent, isolatedMemoryId, userMessage),
                    agentTaskExecutor
            ).exceptionally(ex -> {
                log.warn("[PARALLEL AGENT ERROR] agent={} | error={}", agent, ex.getMessage());
                return "Không thể lấy kết quả do lỗi hệ thống.";
            }));
        }

        CompletableFuture.allOf(futures.toArray(CompletableFuture[]::new)).join();

        List<String> blocks = new ArrayList<>();
        for (int i = 0; i < agentsToRun.size(); i++) {
            String agent = agentsToRun.get(i);
            String result = futures.get(i).join();
            blocks.add("[" + agent + "] " + (result == null ? "" : result));
        }

        String synthesisInput = "YÊU CẦU KHÁCH:\n" + userMessage
                + "\n\nKẾT QUẢ TỪ CÁC AGENT:\n"
                + String.join("\n\n", blocks)
                + "\n\nHãy tổng hợp thành câu trả lời cuối cùng.";

        String finalResponse = summarizerAgent.aggregate(synthesisInput);
        return new ExecutionOutcome(finalResponse, agentsToRun);
    }

    private List<String> normalizeAgentsList(List<String> agentNames) {
        if (agentNames == null || agentNames.isEmpty()) {
            return List.of();
        }
        return agentNames.stream()
                .filter(a -> a != null && !a.isBlank())
                .map(this::normalizeAgent)
                .distinct()
                .collect(Collectors.toList());
    }

    private String routeToAgent(String agentName, String sessionId, String userMessage) {
        String normalized = normalizeAgent(agentName);

        log.info("[ROUTING] agent={} | sessionId={}", normalized, sessionId);
        long agentStartTime = System.currentTimeMillis();
        try {
            String response = switch (normalized) {
                case "PRODUCT" -> productAgent.handle(sessionId, userMessage);
                case "SUPPORT" -> supportAgent.answer(sessionId, userMessage);
                default -> supportAgent.answer(sessionId, userMessage);
            };
            
            long agentTime = System.currentTimeMillis() - agentStartTime;
            log.info("[AGENT COMPLETED] agent={} | time={}ms | responseLength={}", 
                normalized, agentTime, response != null ? response.length() : 0);
            log.debug("[AGENT RESPONSE PREVIEW] agent={} | preview: {}", 
                normalized, response != null ? response.substring(0, Math.min(150, response.length())) : "null");
            
            return response;
        } catch (Exception e) {
            log.error("[AGENT ERROR] agent={} | error: {}", agentName, e.getMessage(), e);
            return "Đã có lỗi xảy ra khi xử lý yêu cầu. Vui lòng thử lại.";
        }
    }

    private String executeWithSecondary(RoutingDecision decision, String sessionId, String userMessage, String targetAgent) {
        List<String> secondaryResults = new ArrayList<>();

        boolean shouldRunSecondaryFirst = decision.hasSecondaryAgents()
                && (!Boolean.TRUE.equals(decision.getParallel()) || Boolean.TRUE.equals(decision.getRequiresA2A()));

        if (shouldRunSecondaryFirst) {
            log.info("[SECONDARY AGENTS] count={} | agents={}", 
                decision.getSecondaryAgents().size(), decision.getSecondaryAgents());
            for (String secondary : decision.getSecondaryAgents()) {
                try {
                    String result = routeToAgent(secondary, sessionId, userMessage);
                    secondaryResults.add("[" + secondary + "] " + result);
                    log.info("[SECONDARY RESULT] agent={} | resultLength={}", 
                        secondary, result.length());
                } catch (Exception e) {
                    log.warn("[SECONDARY ERROR] agent={} | error: {}", secondary, e.getMessage());
                }
            }
        }

        StringBuilder enriched = new StringBuilder();
        if (!secondaryResults.isEmpty()) {
            enriched.append("Context from secondary agents:\n")
                    .append(String.join("\n", secondaryResults))
                    .append("\n---\n");
        }
        enriched.append(userMessage);
        
        log.info("[PRIMARY ROUTING] targetAgent={} | hasSecondaryContext={}", 
            targetAgent, !secondaryResults.isEmpty());

        return routeToAgent(targetAgent, sessionId, enriched.toString());
    }

    private AgentType mapToAgentType(String agentName) {
        if (agentName == null) {
            return AgentType.SUPPORT;
        }
        String normalized = normalizeAgent(agentName);
        return switch (normalized) {
            case "SEARCH" -> AgentType.SEARCH;
            case "SALES" -> AgentType.SALES;
            case "RETURNS" -> AgentType.RETURNS;
            case "COMPLAINT", "COMPLAINTS" -> AgentType.COMPLAINTS;
            case "INVENTORY" -> AgentType.INVENTORY;
            case "LOGISTICS" -> AgentType.LOGISTICS;
            default -> AgentType.SUPPORT;
        };
    }

    private boolean isAffirmative(String message) {
        if (message == null) {
            return false;
        }
        String normalized = message.trim().toLowerCase();
        return normalized.equals("có")
                || normalized.equals("co")
                || normalized.equals("yes")
                || normalized.equals("y")
                || normalized.contains("đồng ý")
                || normalized.contains("ket noi nhan vien")
                || normalized.contains("kết nối nhân viên");
    }

    private boolean isNegative(String message) {
        if (message == null) {
            return false;
        }
        String normalized = message.trim().toLowerCase();
        return normalized.equals("không")
                || normalized.equals("khong")
                || normalized.equals("ko")
                || normalized.equals("no")
                || normalized.contains("không cần")
                || normalized.contains("khong can");
    }

    private String mapPriority(RoutingDecision decision) {
        if (decision == null) {
            return "NORMAL";
        }
        if (decision.getRiskLevel() != null && decision.getRiskLevel() == RiskLevel.HIGH) {
            return "HIGH";
        }
        Integer p = decision.getPriority();
        if (p != null) {
            if (p >= 8) return "HIGH";
            if (p >= 6) return "NORMAL";
        }
        return "LOW";
    }

    private record EscalationContext(String reason, String priority, String lastMessage) {}

    private String normalizeAgent(String agentName) {
        if (agentName == null || agentName.isBlank()) {
            log.warn("No agent specified, defaulting to SUPPORT");
            return "SUPPORT";
        }

        String upper = agentName.trim().toUpperCase();
        if (AGENT_SYNONYMS.containsKey(upper)) {
            upper = AGENT_SYNONYMS.get(upper);
        }

        if (!ALLOWED_AGENTS.contains(upper)) {
            log.warn("Invalid agent '{}', defaulting to SUPPORT", agentName);
            return "SUPPORT";
        }

        return upper;
    }
}
