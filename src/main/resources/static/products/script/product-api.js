import { renderProducts } from "/products/script/product-ui.js";

const filters = {
    prices: [...document.querySelectorAll(".price-filter:checked")].map(x => x.value),
    gender: [...document.querySelectorAll(".gender-filter:checked")].map(x => x.value),
    sizes: [...document.querySelectorAll(".size-filter:checked")].map(x => x.value),
    brands: [...document.querySelectorAll(".brand-filter:checked")].map(x => x.value),
};

const res = await fetch("/api/products/filter", {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(filters)
});

const products = await res.json();
renderProducts(products);


