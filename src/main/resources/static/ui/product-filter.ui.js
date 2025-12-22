const numbers = [30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48];
const checkboxesPerRow = 3; // Số checkbox tối đa trên mỗi row
const container = document.getElementById("checkbox-container");
export function renderSizeCheckboxes() {
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
}


export function renderBrandCheckboxes(brands) {
    // const  brands = await getBrands(categoryId);
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


