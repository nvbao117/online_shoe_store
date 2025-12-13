import { fetchFilteredProducts } from "/products/script/product-api.js";
import { loadAllProducts, loadProductsByCategory } from "/products/script/product-api.js";
import { handleCategorySelect } from "/category/script/category-ui.js";
import { loadBrands } from "/brand/script/brand-ui.js";
export function renderProducts(products) {
    const container = document.getElementById("product-container");
    container.innerHTML = "";

    products.forEach(p => {
        const item = `
            <div
                    class="bg-white rounded-lg border border-gray-200 overflow-hidden hover:shadow-lg transition-shadow"
            >
              <div class="relative">
                <img
                        src="/${p.imageUrl}?height=180&width=200"
                        alt="Giày Victor"
                        class="w-full h-44 object-cover"
                />
                <span
                        class="absolute top-2 left-2 bg-red-500 text-white text-xs px-2 py-1 rounded"
                >Sale Sập sàn 50%</span
                >
              </div>
              <div class="p-3">
                <h4 class="font-medium text-gray-800">${p.name}</h4>
                <div class="flex items-center gap-2 mt-1">
                  <span class="text-red-500 font-bold">${p.price} đ</span>
                </div>
                <div class="flex items-center gap-2">
                  <span class="text-gray-400 line-through text-sm"
                  >1.500.000 đ</span
                  >
                  <span class="text-red-400 text-sm">-41%</span>
                </div>
              </div>
            </div>
        `;
        container.insertAdjacentHTML("beforeend", item);
    });
}


const numbers = [30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48];
const checkboxesPerRow = 3; // Số checkbox tối đa trên mỗi row
const container = document.getElementById("checkbox-container");
for (let i = 0; i < numbers.length; i += checkboxesPerRow) {
    const row = document.createElement("div");
    row.className = "flex gap-4";

    numbers.slice(i, i + checkboxesPerRow).forEach(num => {
        const label = document.createElement("label");
        label.className = "flex items-center gap-2 cursor-pointer";

        const input = document.createElement("input");
        input.type = "checkbox";
        input.className = "size-filter w-4 h-4";
        input.value = num;

        const span = document.createElement("span");
        span.textContent = num;

        label.appendChild(input);
        label.appendChild(span);
        row.appendChild(label);
    });

    container.appendChild(row);
}


document.addEventListener("change", function(e) {
    if (e.target.matches(".price-filter, .brand-filter, .size-filter, .gender-filter")) {
        console.log("Filter changed");
        fetchFilteredProducts();
    }
});

document.addEventListener("DOMContentLoaded", () => {
    const params = new URLSearchParams(window.location.search);
    const categoryIdFromHome = params.get("categoryId");

    if (!categoryIdFromHome) return;

    if (categoryIdFromHome) {
        loadProductsByCategory(categoryIdFromHome);
        loadBrands(categoryIdFromHome);
    } else {
        loadAllProducts();
    }
    const btn = document.querySelector(
        `.tab-btn[data-category-id="${categoryIdFromHome}"]`
    );

    if (btn) {
        handleCategorySelect(btn); // gọi logic chung
    }
});



