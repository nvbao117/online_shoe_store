import { getBrands } from "/brand/script/brand-api.js";
export async function loadBrands(categoryId) {
    const  brands = await getBrands(categoryId);
    const container = document.getElementById("bands-container");

    // Xóa hết checkbox cũ
    container.innerHTML = "";
    // sinh checkbox Brand từ API
    brands.forEach(brand => {
        const label = document.createElement("label");
        label.className = "flex items-center gap-2 cursor-pointer";

        const input = document.createElement("input");
        input.type = "checkbox";
        input.className = "brand-filter w-4 h-4";
        input.value = brand.brandId; // gán value để backend nhận

        const span = document.createElement("span");
        span.textContent = brand.name;

        label.appendChild(input);
        label.appendChild(span);
        container.appendChild(label);
    });
}