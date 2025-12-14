import { fetchProductsByCategory } from "../api/product.api.js";
import { initCategoryTabs } from "../ui/category-tabs.ui.js";
import { renderProductGrid } from "../ui/product-list.ui.js";
import { getCategories } from "../api/category.api.js";

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
        },
        categoryId // 🔥 CHỈ THÊM DÒNG NÀY
    );

    // load sản phẩm ban đầu
    const products = await fetchProductsByCategory(categoryId);
    renderProductGrid(productContainer, products);
}

initProductsPage();
