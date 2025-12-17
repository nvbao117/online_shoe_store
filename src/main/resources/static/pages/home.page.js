import { getCategories } from "../api/category.api.js";
import { fetchProductsByCategory } from "../api/product.api.js";
import { initCategoryTabs } from "../ui/category-tabs.ui.js";
import { renderProductSlider } from "../ui/product-slider.ui.js";
import { renderCategoryCards } from "../ui/category-card.ui.js";
const tabContainer = document.getElementById("categorytab-container");
const productContainer = document.getElementById("productsContainer");
const categoryGrid = document.getElementById("sportGrid");
async function initHome() {

    // category mặc định
    const DEFAULT_CATEGORY_ID = "21112005";

    const categories = [
        { categoryId: DEFAULT_CATEGORY_ID, name: "Tất cả" },
        ...(await getCategories())
    ];
    // 1️⃣ Render CATEGORY CARD
    const categorieCard = await getCategories();
    renderCategoryCards(categoryGrid, categorieCard);


    // ✅ categoryId chỉ xuất hiện ở đây
    initCategoryTabs(tabContainer, categories, async (categoryId) => {
        const products = await fetchProductsByCategory(categoryId);
        renderProductSlider(productContainer, products.slice(0, 10));
    },
        DEFAULT_CATEGORY_ID  // 👉 tab mặc định khi vừa vào trang
    );

    // 👉 load mặc định khi vừa vào trang
    const defaultProducts = await fetchProductsByCategory(DEFAULT_CATEGORY_ID);
    renderProductSlider(productContainer, defaultProducts.slice(0, 10));
}

initHome();



const container = document.getElementById("productsContainer");
const btnPrev = document.getElementById("prevProducts");
const btnNext = document.getElementById("nextProducts");

if (container && btnPrev && btnNext) {
    const SCROLL_AMOUNT = 300;

    btnNext.addEventListener("click", () => {
        container.scrollBy({
            left: SCROLL_AMOUNT,
            behavior: "smooth"
        });
    });

    btnPrev.addEventListener("click", () => {
        container.scrollBy({
            left: -SCROLL_AMOUNT,
            behavior: "smooth"
        });
    });
}






