export async function fetchProductsByKeyword(keyword) {
    const  res = await fetch(`/api/products/search?keyword=${encodeURIComponent(keyword)}`, {
        method: "GET",
        headers: { "Content-Type": "application/json" }
    });
    return res.json();
}