// main.js
import API from "./api.js";
import { renderCategories, renderProducts } from "./ui.js";
import { initProductScroll } from "./products.js";

document.addEventListener("DOMContentLoaded", async () => {
    const categories = await API.getCategories();
    renderCategories(categories);

    const products = await API.getNewProducts();
    renderProducts(products);

    // Phải gọi sau khi render xong
    initProductScroll();
});
