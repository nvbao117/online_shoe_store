import { createProductCard } from "./product-card.ui.js";

export function renderProductSlider(container, products) {
    container.innerHTML = "";

    const fragment = document.createDocumentFragment();

    products.forEach(p => {
        const wrapper = document.createElement("div");
        wrapper.className = "w-[65%] xs:w-[55%] sm:w-1/5 shrink-0";
        wrapper.innerHTML = createProductCard(p);

        fragment.appendChild(wrapper);
    });

    container.appendChild(fragment);
}
