// products.js

export function initProductScroll() {
    const container = document.getElementById("productsContainer");
    const prevBtn = document.getElementById("prevProducts");
    const nextBtn = document.getElementById("nextProducts");

    if (!container || !prevBtn || !nextBtn) {
        console.warn("Product scroll elements not found");
        return;
    }

    const scrollStep = () => {
        const firstCard = container.querySelector("div.shrink-0");
        return firstCard
            ? firstCard.getBoundingClientRect().width + 8
            : container.clientWidth;
    };

    prevBtn.addEventListener("click", () =>
        container.scrollBy({ left: -scrollStep(), behavior: "smooth" })
    );

    nextBtn.addEventListener("click", () =>
        container.scrollBy({ left: scrollStep(), behavior: "smooth" })
    );
}
