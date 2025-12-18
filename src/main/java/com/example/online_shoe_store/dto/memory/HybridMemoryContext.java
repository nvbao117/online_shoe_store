package com.example.online_shoe_store.dto.memory;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class HybridMemoryContext {
    private String summary;
    private List<String> recentMessages;
    private int messageCount;
}
