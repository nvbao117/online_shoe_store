// /api/product.api.js

export async function fetchProducts() {
    const res = await fetch("/api/products");
    if (!res.ok) throw new Error("Failed to fetch products");
    return res.json();
}

export async function fetchProductsByCategory(categoryId) {
    const url =
        categoryId && categoryId !== "0"
            ? `/api/products?categoryId=${categoryId}`
            : "/api/products";

    const res = await fetch(url);
    if (!res.ok) throw new Error("Failed to fetch products by category");
    return res.json();
}
