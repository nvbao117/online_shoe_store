import { fetchFilteredProducts, fetchProductsByCategory, fetchProductsByIds } from "../api/product.api.js";
import { fetchProductsByKeyword } from "../api/search-product.api.js";
import { fetchProductsBySemantic } from "../api/search-semantic.api.js";
import { initCategoryTabs } from "../ui/category-tabs.ui.js";
import { renderProductGrid } from "../ui/product-list.ui.js";
import { getCategories } from "../api/category.api.js";
import { renderBrandCheckboxes, renderSizeCheckboxes } from "../ui/product-filter.ui.js";
import { getBrands } from "../api/brand.api.js";
import { initSortPriceDropdown } from "../ui/product-sort.ui.js";

async function initProductsPage() {
    const params = new URLSearchParams(window.location.search);
    const categoryId = params.get("categoryId") || "21112005";
    const keyword = params.get("keyword");

    const categories = [
        { categoryId: "21112005", name: "Tất cả" },
        ...(await getCategories())
    ];

    const tabContainer = document.getElementById("category-tabs");
    const productContainer = document.getElementById("product-container");

    initCategoryTabs(
        tabContainer,
        categories,
        async (selectedCategoryId) => {
            const products = await fetchProductsByCategory(selectedCategoryId);
            renderProductGrid(productContainer, products);
            const brands = await getBrands(selectedCategoryId);
            renderBrandCheckboxes(brands);
        },
        categoryId
    );

    // ===================== KEYWORD SEARCH =====================
    if (keyword && keyword.trim().length >= 2) {
        const kw = keyword.trim();
        let products = [];
        try {
            products = await fetchProductsByKeyword(kw);
        } catch (_) {
            products = [];
        }
        if (!products || products.length === 0) {
            products = await fetchProductsBySemantic(kw, 20, 0.4);
        }
        renderProductGrid(productContainer, products || []);
    } else {
        const products = await fetchProductsByCategory(categoryId);
        renderProductGrid(productContainer, products);
    }

    renderSizeCheckboxes();
    const brands = await getBrands(categoryId);
    renderBrandCheckboxes(brands);
}

initProductsPage();
// nghe sự kiện click trên các checkbox lọc
document.addEventListener("change", function (e) {
    if (e.target.matches(".price-filter, .brand-filter, .size-filter, .gender-filter")) {
        console.log("Filter changed");
        fetchFilteredProducts();
    }
});

initSortPriceDropdown()
// nghe sự kiện click trên các nút sắp xếp
let currentSort = null;
document.querySelectorAll("[data-sort]").forEach(btn => {
    btn.addEventListener("click", () => {
        console.log("sort changed");
        currentSort = btn.dataset.sort;
        fetchFilteredProducts({ sortBy: currentSort });
    });
});

