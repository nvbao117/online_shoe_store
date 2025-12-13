import { getCategories } from "/category/script/category-api.js";
    /* ===================== CATEGORY SLIDER ===================== */
let categories = [];
let currentIndex = 0;
const itemsPerPage = 5;

async function loadCategories() {
    categories = await getCategories();
    renderCategories();
}

function renderCategories() {
    const grid = document.getElementById("sportGrid");
    if (!grid || categories.length === 0) return;

    const slice = categories.slice(currentIndex, currentIndex + itemsPerPage);

    grid.classList.add("slide-exit");
    requestAnimationFrame(() => {
        grid.classList.add("slide-exit-active");

        setTimeout(() => {
            grid.innerHTML = "";

            const fragment = document.createDocumentFragment();

            slice.forEach(c => {
                const card = document.createElement("div");
                card.className = "sport-card cursor-pointer group";
                card.innerHTML = `
    <a href="/products?categoryId=${c.categoryId}"
       class="block group category-link"
       data-id="${c.categoryId}">
        <div class="overflow-hidden rounded-xl shadow-md">
            <img src="${c.imageUrl}"
                 class="w-full h-40 md:h-56 object-cover transition-transform duration-300 group-hover:scale-110">
        </div>
        <p class="mt-3 font-semibold text-base md:text-lg text-gray-800 group-hover:text-blue-600">
            ${c.name}
        </p>
    </a>
`;

                fragment.appendChild(card);
            });

            grid.appendChild(fragment);

            grid.classList.remove("slide-exit", "slide-exit-active");
            grid.classList.add("slide-enter");

            requestAnimationFrame(() => {
                grid.classList.add("slide-enter-active");
            });

            setTimeout(() => {
                grid.classList.remove("slide-enter", "slide-enter-active");
            }, 350);

        }, 350);
    });
}

/* Pagination buttons */
document.getElementById("nextBtn").onclick = () => {
    if (currentIndex + itemsPerPage < categories.length) {
        currentIndex += itemsPerPage;
        renderCategories();
    }
};

document.getElementById("prevBtn").onclick = () => {
    if (currentIndex - itemsPerPage >= 0) {
        currentIndex -= itemsPerPage;
        renderCategories();
    }
};


/* ===================== TOP PRODUCTS ===================== */
async function loadTopProducts() {
    const res = await fetch("/api/new-products");
    const products = await res.json();

    const container = document.getElementById("productsContainer");
    if (!container) return;

    const fragment = document.createDocumentFragment();

    products.forEach(p => {
        const item = document.createElement("div");
        item.className = "w-[65%] xs:w-[55%] sm:w-1/5 shrink-0";
        item.innerHTML = `
            <div class="bg-white rounded-lg border border-gray-200 overflow-hidden hover:shadow-lg transition-shadow h-full flex flex-col">
                <div class="relative">
                    <img src="/${p.imageUrl}" class="w-full h-40 sm:h-44 object-cover" />
                    <span class="absolute top-2 left-2 bg-red-500 text-white text-[10px] sm:text-xs px-2 py-1 rounded">
                        Sản phẩm mới
                    </span>
                </div>

                <div class="p-2 sm:p-3 flex flex-col justify-between min-h-[120px]">
                    <h4 class="font-medium text-gray-800 text-sm sm:text-base line-clamp-2 min-h-[40px]">
                        ${p.name}
                    </h4>

                    <div>
                        <span class="text-red-500 font-bold text-sm sm:text-base">
                            ${p.price} đ
                        </span>
                        <div class="flex gap-2 text-xs sm:text-sm">
                            <span class="text-gray-400 line-through">1.500.000 đ</span>
                            <span class="text-red-400">-41%</span>
                        </div>
                    </div>
                </div>
            </div>
        `;
        fragment.appendChild(item);
    });

    container.innerHTML = "";
    container.appendChild(fragment);
}

/* ===================== PRODUCT SCROLL ===================== */
function initProductScroll() {
    const container = document.getElementById("productsContainer");
    const prevBtn = document.getElementById("prevProducts");
    const nextBtn = document.getElementById("nextProducts");

    if (!container || !prevBtn || !nextBtn) return;

    const scrollStep = () => {
        const card = container.querySelector(".shrink-0");
        return card ? card.offsetWidth + 8 : container.clientWidth;
    };

    prevBtn.onclick = () =>
        container.scrollBy({ left: -scrollStep(), behavior: "smooth" });

    nextBtn.onclick = () =>
        container.scrollBy({ left: scrollStep(), behavior: "smooth" });
}

/* ===================== INIT ===================== */
document.addEventListener("DOMContentLoaded", () => {
    loadCategories();
    loadTopProducts();
    initProductScroll();
});



