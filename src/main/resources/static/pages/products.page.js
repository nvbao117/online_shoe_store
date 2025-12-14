import {fetchFilteredProducts, fetchProductsByCategory} from "../api/product.api.js";
import { initCategoryTabs } from "../ui/category-tabs.ui.js";
import { renderProductGrid } from "../ui/product-list.ui.js";
import { getCategories } from "../api/category.api.js";
import {renderBrandCheckboxes, renderSizeCheckboxes} from "../ui/product-filter.ui.js";
import {getBrands} from "../api/brand.api.js";
import {initSortPriceDropdown} from "../ui/product-sort.ui.js";

async function initProductsPage() {
    // ✅ LẤY categoryId TỪ URL
    const params = new URLSearchParams(window.location.search);
    const categoryId = params.get("categoryId") || "21112005";

    const categories = [
        { categoryId: "21112005", name: "Tất cả" },
        ...(await getCategories())
    ];

    const tabContainer = document.getElementById("category-tabs");
    const productContainer = document.getElementById("product-container");

    // ✅ TRUYỀN categoryId VÀO initCategoryTabs
    initCategoryTabs(
        tabContainer,
        categories,
        async (selectedCategoryId) => {
            const products = await fetchProductsByCategory(selectedCategoryId);
            renderProductGrid(productContainer, products);
            const brands = await getBrands(selectedCategoryId);
            renderBrandCheckboxes(brands);
        },
        categoryId // 🔥 CHỈ THÊM DÒNG NÀY
    );

    // load sản phẩm ban đầu
    const products = await fetchProductsByCategory(categoryId);
    renderProductGrid(productContainer, products);
    // render checkbox size
    renderSizeCheckboxes();
    // render brand checkbox
    const brands = await getBrands(categoryId);
    renderBrandCheckboxes(brands);
}

initProductsPage();
// nghe sự kiện click trên các checkbox lọc
document.addEventListener("change", function(e) {
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

