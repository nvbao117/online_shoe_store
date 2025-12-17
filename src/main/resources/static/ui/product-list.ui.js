import { createProductCard } from "./product-card.ui.js";

export function renderProductGrid(container, products) {
    container.innerHTML = "";

    products.forEach(p => {
        container.insertAdjacentHTML(
            "beforeend",
            createProductCard(p)
        );
    });

    // // Điều hướng sang trang chi tiết khi click card hoặc ảnh
    // container.onclick = (e) => {
    //     const card = e.target.closest("[data-product-id]");
    //     if (!card) return;
    //     const id = card.dataset.productId;
    //     if (!id) return;
    //     window.location.href = `/product-detail/${id}`;
    // };
}
