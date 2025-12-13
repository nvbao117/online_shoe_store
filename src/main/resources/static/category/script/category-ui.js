import { getCategories, changeCategory } from "/category/script/category-api.js";
import { renderProducts } from "/products/script/product-ui.js";
import { loadBrands } from "/brand/script/brand-ui.js";

/* ================= LOAD & RENDER TABS ================= */
async function loadCategories() {
    const categories = await getCategories();
    const container = document.getElementById("category-tabs");
    if (!container) return;

    container.innerHTML = "";

    // Nút "Tất cả"
    container.appendChild(createTabButton({
        categoryId: "0",
        name: "Tất cả",
        active: true
    }));

    // Tabs từ API
    categories.forEach(c => {
        container.appendChild(createTabButton(c));
    });

    attachClickEvents();
    autoSelectCategoryFromHome(); // ← QUAN TRỌNG
}

/* ================= CREATE TAB ================= */
function createTabButton({ categoryId, name, active = false }) {
    const btn = document.createElement("button");

    // base style (giống UI mẫu)
    btn.className =
        "tab-btn px-4 sm:px-6 py-2 rounded-full font-medium text-sm sm:text-base transition";

    if (active) {
        // tab active
        btn.classList.add(
            "tab-active",
            "bg-blue-500",
            "text-white"
        );
    } else {
        // tab thường
        btn.classList.add(
            "border",
            "border-blue-500",
            "text-blue-600",
            "bg-white",
            "hover:bg-blue-50"
        );
    }

    btn.dataset.categoryId = categoryId;
    btn.textContent = name;

    return btn;
}


/* ================= CLICK EVENTS ================= */
function attachClickEvents() {
    document.querySelectorAll(".tab-btn").forEach(btn => {
        btn.addEventListener("click", () => handleCategorySelect(btn));
    });
}

/* ================= HANDLE SELECT ================= */
export async function handleCategorySelect(
    btn,
    options = {}
) {
    if (!btn) return;

    const {
        render = renderProducts,   // mặc định cho trang products
        loadBrand = loadBrands     // mặc định cho trang products
    } = options;

    // reset tab UI
    document.querySelectorAll(".tab-btn").forEach(b => {
        b.classList.remove("tab-active", "bg-blue-500", "text-white");
        b.classList.add(
            "border",
            "border-blue-500",
            "text-blue-600",
            "bg-white",
            "hover:bg-blue-50"
        );
    });

    btn.classList.add("tab-active", "bg-blue-500", "text-white");
    btn.classList.remove(
        "border",
        "border-blue-500",
        "text-blue-600",
        "bg-white",
        "hover:bg-blue-50"
    );

    const id = btn.dataset.categoryId;

    const products = await changeCategory(id);

    // 🔥 render theo trang đang dùng
    render(products);

    // chỉ load brand nếu cần
    if (loadBrand) {
        loadBrand(id);
    }
}


/* ================= AUTO SELECT FROM HOME ================= */
function autoSelectCategoryFromHome() {
    const params = new URLSearchParams(window.location.search);
    const categoryId = params.get("categoryId");

    if (!categoryId) return;

    const btn = document.querySelector(
        `.tab-btn[data-category-id="${categoryId}"]`
    );

    if (btn) {
        handleCategorySelect(btn);
    }
}

/* ================= INIT ================= */
loadCategories();
