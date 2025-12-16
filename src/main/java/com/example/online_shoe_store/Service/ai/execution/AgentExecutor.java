package com.example.online_shoe_store.Service.ai.execution;

import com.example.online_shoe_store.Service.ai.agent.OrchestratorAgent;
import com.example.online_shoe_store.Service.ai.agent.SearchAgent;
import com.example.online_shoe_store.Service.ai.agent.SupportAgent;
import com.example.online_shoe_store.Service.ai.agent.sales.SalesAgent;
import com.example.online_shoe_store.Service.ai.agent.operations.LogisticsAgent;
import com.example.online_shoe_store.Service.ai.agent.marketing.MarketingAgent;
import com.example.online_shoe_store.Service.ai.memory.HybridMemoryService;
import com.example.online_shoe_store.dto.orchestrator.RoutingDecision;
import com.example.online_shoe_store.dto.orchestrator.SupervisorResponse;
import com.example.online_shoe_store.Entity.enums.AgentType;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.ArrayList;

@Service
@Slf4j
@RequiredArgsConstructor
public class AgentExecutor {

        private static final Set<String> ALLOWED_AGENTS = Set.of(
            "SEARCH", "SALES", "SUPPORT",
            "LOGISTICS", "MARKETING", "INVENTORY", "RECOMMEND", "CART"
        );

        private static final Map<String, String> AGENT_SYNONYMS = Map.of(
            "FAQ", "SUPPORT",
            "RETURN", "SUPPORT",
            "RETURNS", "SUPPORT",
            "COMPLAINT", "SUPPORT",
            "COMPLAINTS", "SUPPORT",
            "TRACKING", "LOGISTICS",
            "STOCK", "INVENTORY",
            "ANALYTICS", "MARKETING",
            "RECOMMENDATION", "RECOMMEND"
        );

    // ═══════════════════════════════════════════
    // ORCHESTRATION LAYER
    // ═══════════════════════════════════════════
    private final OrchestratorAgent orchestratorAgent;

    // ═══════════════════════════════════════════
    // SALES DOMAIN
    // ═══════════════════════════════════════════
    private final SearchAgent searchAgent;
    private final SalesAgent salesAgent;

    // ═══════════════════════════════════════════
    // SUPPORT DOMAIN
    // ═══════════════════════════════════════════
    private final SupportAgent supportAgent;

    // ═══════════════════════════════════════════
    // OPERATIONS DOMAIN
    // ═══════════════════════════════════════════
    private final LogisticsAgent logisticsAgent;

    // ═══════════════════════════════════════════
    // MARKETING DOMAIN
    // ═══════════════════════════════════════════
    private final MarketingAgent marketingAgent;

    // ═══════════════════════════════════════════
    // MEMORY
    // ═══════════════════════════════════════════
    private final HybridMemoryService hybridMemoryService;

    public SupervisorResponse process(String sessionId, String userMessage) {
        long startTime = System.currentTimeMillis();

        // BƯỚC 1: ORCHESTRATOR PHÂN TÍCH
        log.info("Orchestrator analyzing intent...");
        RoutingDecision decision = orchestratorAgent.decide(userMessage, sessionId);

        String rawTargetAgent = decision.getTargetAgent();
        String resolvedPrimary = decision.getPrimaryAgent() != null ? decision.getPrimaryAgent().name() : null;
        String targetAgentForRouting = rawTargetAgent != null && !rawTargetAgent.isBlank()
            ? rawTargetAgent
            : resolvedPrimary;
        
        log.info("Decision: targetAgent={} | routingTarget={} | primaryAgent={} | risk={}",
            rawTargetAgent,
            targetAgentForRouting,
            decision.getPrimaryAgent(), 
            decision.getRiskLevel());

        String finalResponse;
        boolean onlyDirectResponse = (rawTargetAgent == null && decision.getPrimaryAgent() == null)
            && decision.getDirectResponse() != null && !decision.getDirectResponse().isBlank();

        // BƯỚC 2: XỬ LÝ
        if (Boolean.TRUE.equals(decision.getRequiresEscalation())) {
            log.info("Escalation requested: {}", decision.getEscalationReason());
            finalResponse = decision.getDirectResponse() != null && !decision.getDirectResponse().isBlank()
                    ? decision.getDirectResponse()
                    : "Yêu cầu của bạn cần nhân viên hỗ trợ trực tiếp. Chúng tôi sẽ liên hệ sớm nhất.";
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
            finalResponse = executeWithSecondary(decision, sessionId, enriched, agentToRoute);
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
            .agentsUsed(!onlyDirectResponse && targetAgentForRouting != null
                ? List.of(mapToAgentType(targetAgentForRouting))
                : List.of())
                .processingTimeMs(processingTime)
                .escalationTriggered(Boolean.TRUE.equals(decision.getRequiresEscalation()))
                .escalationReason(decision.getEscalationReason())
                .build();
    }

    private String routeToAgent(String agentName, String sessionId, String userMessage) {
        String normalized = normalizeAgent(agentName);

        log.info("[ROUTING] agent={} | sessionId={}", normalized, sessionId);
        long agentStartTime = System.currentTimeMillis();
        try {
            String response = switch (normalized) {
                // SALES DOMAIN
                case "SEARCH" -> searchAgent.search(sessionId, userMessage);
                case "SALES" -> salesAgent.consult(sessionId, userMessage);
                case "RECOMMEND" -> salesAgent.consult(sessionId, userMessage);
                case "CART" -> salesAgent.consult(sessionId, userMessage);
                
                // SUPPORT DOMAIN
                case "SUPPORT" -> supportAgent.answer(sessionId, userMessage);
                case "RETURNS" -> supportAgent.answer(sessionId, userMessage);
                case "COMPLAINT" -> supportAgent.answer(sessionId, userMessage);
                
                // OPERATIONS DOMAIN
                case "LOGISTICS" -> logisticsAgent.track(sessionId, userMessage);
                case "INVENTORY" -> salesAgent.consult(sessionId, userMessage);
                
                // MARKETING DOMAIN
                case "MARKETING" -> marketingAgent.analyze(sessionId, userMessage);
                
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

    /**
     * Execute primary agent, optionally running secondary agents first and injecting their results as context.
     */
    private String executeWithSecondary(RoutingDecision decision, String sessionId, String userMessage, String targetAgent) {
        List<String> secondaryResults = new ArrayList<>();

        if (decision.hasSecondaryAgents() && !Boolean.TRUE.equals(decision.getParallel())) {
            log.info("[SECONDARY AGENTS] count={} | agents={}", 
                decision.getSecondaryAgents().size(), decision.getSecondaryAgents());
            for (var secondary : decision.getSecondaryAgents()) {
                try {
                    String result = routeToAgent(secondary.name(), sessionId, userMessage);
                    secondaryResults.add("[" + secondary.name() + "] " + result);
                    log.info("[SECONDARY RESULT] agent={} | resultLength={}", 
                        secondary.name(), result.length());
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
            case "SALES", "RECOMMEND", "CART" -> AgentType.SALES;
            case "RETURNS" -> AgentType.RETURNS;
            case "COMPLAINT", "COMPLAINTS" -> AgentType.COMPLAINTS;
            case "INVENTORY" -> AgentType.INVENTORY;
            case "LOGISTICS" -> AgentType.LOGISTICS;
            case "MARKETING" -> AgentType.MARKETING;
            default -> AgentType.SUPPORT;
        };
    }

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
