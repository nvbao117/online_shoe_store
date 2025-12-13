import { getCategories } from "/category/script/category-api.js";
import { changeCategory } from "/category/script/category-api.js";
import { renderProducts } from "/products/script/product-ui.js";
import { loadBrands } from "/brand/script/brand-ui.js";
async function loadCategories() {
    const categories = await getCategories();
    const container = document.getElementById("category-tabs");

    // Tạo nút “Tất cả”
    container.innerHTML = `
        <button 
            class="tab-btn tab-active px-6 py-3 font-medium border-2 border-cyan-400 rounded-lg whitespace-nowrap hover:bg-cyan-50"
            data-category-id="0"
        >Tất cả</button>
    `;

    // Sinh nút từ API
    categories.forEach(c => {
        const btn = document.createElement("button");
        btn.className = "tab-btn px-6 py-3 font-medium border-2 border-cyan-400 rounded-lg  whitespace-nowrap hover:bg-cyan-50";
        btn.dataset.categoryId = c.categoryId;
        btn.textContent = c.name;

        container.appendChild(btn);
    });

    attachClickEvents();
}



function attachClickEvents() {
    document.querySelectorAll(".tab-btn").forEach(btn => {
        btn.addEventListener("click", async function () {

            document.querySelectorAll(".tab-btn")
                .forEach(b => {
                    b.classList.remove("tab-active");
                    b.classList.add("hover:bg-cyan-50");
                });
            this.classList.add("tab-active");
            this.classList.remove("hover:bg-cyan-50", "bg-white");

            const id = this.dataset.categoryId;
            // Gọi API
            const products = await changeCategory(id);

            // Render lại UI
            renderProducts(products);
            loadBrands(id);
        });
    });
}


loadCategories();
