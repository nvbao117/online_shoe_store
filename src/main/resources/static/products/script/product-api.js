import { renderProducts } from "/products/script/product-ui.js";

function loadFilters() {
    return {
        prices: [...document.querySelectorAll(".price-filter:checked")].map(x => x.value),
        brands: [...document.querySelectorAll(".brand-filter:checked")].map(x => x.value),
        sizes: [...document.querySelectorAll(".size-filter:checked")].map(x => x.value),
        genders: [...document.querySelectorAll(".gender-filter:checked")].map(x => x.value)
    };
}

export async function fetchFilteredProducts() {
    const filters = loadFilters();

    const res = await fetch("/api/products/filter", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(filters)
    });

    const products = await res.json();
    renderProducts(products);
}



