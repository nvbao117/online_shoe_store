export function initSortPriceDropdown() {
    // Hàm khởi tạo dropdown sắp xếp theo giá

    const sortPriceBtn = document.getElementById("sortPriceBtn");
    const priceDropdown = document.getElementById("priceDropdown");

// Hiện dropdown khi hover vào nút Giá
    sortPriceBtn.addEventListener("mouseenter", () => {
        priceDropdown.classList.remove("hidden");
    });

// Ẩn dropdown khi rời khỏi cả nút và dropdown
    const hideDropdown = () => {
        priceDropdown.classList.add("hidden");
    };

    sortPriceBtn.addEventListener("mouseleave", () => {
        setTimeout(() => {
            if (!priceDropdown.matches(":hover")) hideDropdown();
        }, 100);
    });

    priceDropdown.addEventListener("mouseleave", hideDropdown);
    priceDropdown.addEventListener("mouseenter", () => {
        priceDropdown.classList.remove("hidden");
    });
}