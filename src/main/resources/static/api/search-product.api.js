export async function fetchProductsByKeyword(keyword) {
    const  res = await fetch(`/api/products/search?keyword=${encodeURIComponent(keyword)}`, {
        method: "GET",
        headers: { "Content-Type": "application/json" },
        credentials: "include"
    });
    if (!res.ok) throw new Error("Failed to search products");
    return res.json();
}