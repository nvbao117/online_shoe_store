// Call Python service semantic search (POST /api/search/text)
const PY_SERVICE_BASE = "http://localhost:8001"; // TODO: change to your Python service host/port
const PY_SERVICE_API_KEY = null; // e.g. "your-service-key"; set header when needed

export async function fetchProductsBySemantic(query, limit = 10) {
    const headers = { "Content-Type": "application/json" };
    if (PY_SERVICE_API_KEY) {
        headers["X-API-Key"] = PY_SERVICE_API_KEY;
    }

    const res = await fetch(`${PY_SERVICE_BASE}/api/search/text`, {
        method: "POST",
        headers,
        credentials: "include", // remove if cross-origin without cookies
        body: JSON.stringify({ query, topK: limit })
    });

    if (!res.ok) return [];

    const data = await res.json();
    if (data.results && Array.isArray(data.results)) {
        const mapped = data.results.map((item) => ({
            productId: item.productId || item.id || item.product_id,
            name: item.productName || item.name || item.title,
            price: coercePrice(item),
            imageUrl: coerceImage(item),
            brandName: item.brandName || item.brand,
            categoryName: item.categoryName || item.category,
            similarity: item.similarity || item.score,
        }));
        return await enrichProducts(mapped);
    }
    return [];
}

async function enrichProducts(items) {
    // Only fetch details for items missing key fields
    const needsDetail = items.filter((p) =>
        p.productId && (!p.name || p.name === "Sản phẩm" || !p.price)
    );
    if (needsDetail.length === 0) return items;

    const uniqueIds = [...new Set(needsDetail.map((p) => p.productId).filter(Boolean))];
    const detailMap = new Map();

    await Promise.all(
        uniqueIds.map(async (id) => {
            try {
                const detail = await fetchProductDetail(id);
                if (detail) detailMap.set(id, detail);
            } catch (e) {
                console.warn("semantic detail fetch failed", id, e);
            }
        })
    );

    return items.map((p) => {
        const detail = detailMap.get(p.productId);
        if (!detail) {
            return {
                ...p,
                name: p.name || "Sản phẩm",
                price: p.price || 0,
                imageUrl: p.imageUrl || coerceImage(detail),
            };
        }
        return {
            ...p,
            name: p.name || detail.productName || detail.name || detail.title || "Sản phẩm",
            price: p.price || coercePrice(detail),
            imageUrl: p.imageUrl || coerceImage(detail),
            brandName: p.brandName || detail.brandName || detail.brand,
            categoryName: p.categoryName || detail.categoryName || detail.category,
        };
    });
}

async function fetchProductDetail(productId) {
    const res = await fetch(`/api/products/${productId}`, {
        credentials: "include"
    });
    if (!res.ok) return null;
    return res.json();
}

function coercePrice(item) {
    const candidates = [item.price, item.priceMin, item.price_min, item.priceMax, item.price_max];
    for (const c of candidates) {
        if (c === null || c === undefined) continue;
        const n = Number(c);
        if (!Number.isNaN(n)) return n;
    }
    return 0;
}

function coerceImage(item) {
    if (!item) return null;
    return item.imageUrl || item.image || item.thumbnail || item.thumbUrl || item.image_url || item.thumbnail_url;
}
