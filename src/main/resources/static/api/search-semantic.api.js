// Call Spring Boot semantic search (GET /api/search/semantic)
// This is backed by the Java RAG/vector store (no Python service).

export async function fetchProductsBySemantic(query, limit = 10, minScore = null) {
    if (!query || query.trim().length === 0) return [];

    const params = new URLSearchParams();
    params.set("query", query);
    params.set("limit", String(limit ?? 10));
    if (minScore !== null && minScore !== undefined) {
        params.set("minScore", String(minScore));
    }

    const res = await fetch(`/api/search/semantic?${params.toString()}`, {
        credentials: "include"
    });

    if (!res.ok) return [];

    const data = await res.json();
    if (!Array.isArray(data)) return [];

    return data.map((item) => ({
        productId: item.productId,
        name: item.name,
        price: item.price ?? 0,
        imageUrl: item.imageUrl,
        similarity: item.score,
    }));
}
