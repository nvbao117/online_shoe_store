// /api/product.api.js


import {renderProductGrid} from "../ui/product-list.ui.js"
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
// Hàm để load các bộ lọc đã chọn từ giao diện
function loadFilters() {
    return {
        prices: [...document.querySelectorAll(".price-filter:checked")].map(x => x.value),
        brands: [...document.querySelectorAll(".brand-filter:checked")].map(x => x.value),
        sizes: [...document.querySelectorAll(".size-filter:checked")].map(x => x.value),
        genders: [...document.querySelectorAll(".gender-filter:checked")].map(x => x.value)
    };
}
export async function fetchFilteredProducts(options = {}) {
    const filters = loadFilters();

    // GẮN SORT
    if (options.sortBy) {
        filters.sortBy = options.sortBy;
    }

    const res = await fetch("/api/products/filter", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(filters)
    });

    if (!res.ok) throw new Error("Filter failed");

    const products = await res.json();
    const productContainer = document.getElementById("product-container");
    renderProductGrid(productContainer, products);
}


// // sort products
// export async function fetchSortedProducts(sortBy) {
//     const res = await fetch(`/api/products/sort?sortBy=${sortBy}`);
//     const products = await res.json();
//     const productContainer = document.getElementById("product-container");
//     renderProductGrid(productContainer,products);
// }