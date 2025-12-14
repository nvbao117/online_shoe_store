import { createProductCard } from "./product-card.ui.js";

export function renderProductGrid(container, products) {
    container.innerHTML = "";

    products.forEach(p => {
        container.insertAdjacentHTML(
            "beforeend",
            createProductCard(p)
        );
    });
}
