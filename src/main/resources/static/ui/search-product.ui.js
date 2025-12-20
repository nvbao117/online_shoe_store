function getSuggestBox() {
    return document.getElementById("search-suggest") || document.getElementById("clip-results-content");
}

function getClipDropdown() {
    return document.getElementById("clip-search-results");
}

export function renderSuggest(items, keyword) {
    const suggestBox = getSuggestBox();
    const clipDropdown = getClipDropdown();

    if (!suggestBox) {
        console.error("suggestBox not found");
        return;
    }

    // Chưa nhập gì → ẩn gợi ý
    if (!keyword || keyword.trim().length === 0) {
        hideSuggest();
        return;
    }

    // Đã nhập nhưng không có kết quả
    if (!items || items.length === 0) {
        suggestBox.innerHTML = `
            <div class="p-4 text-center text-slate-500 text-base">
                ❌ Không tìm thấy kết quả
            </div>
        `;
        suggestBox.classList.remove("d-none");
        if (clipDropdown) clipDropdown.classList.remove("d-none");
        return;
    }

    // Có kết quả
    suggestBox.innerHTML = `
        <div class="max-h-96 overflow-y-auto p-2">
            ${items.map(item => `
                <a href="/product-detail/${item.productId}"
                   class="flex items-start gap-3 p-3 rounded-lg hover:bg-red-50 transition duration-150 ease-in-out">

                    <img src="${item.imageUrl}"
                         alt="${item.name}"
                         class="w-16 h-16 object-cover rounded-lg border border-slate-200 flex-shrink-0">

                    <div class="flex flex-col flex-grow min-w-0">
                        <span class="text-base font-semibold text-slate-800 line-clamp-2 leading-snug">
                            ${item.name}
                        </span>
                        <span class="text-lg text-red-600 font-bold mt-1">
                            ${formatPrice(item.price)}
                        </span>
                    </div>
                </a>
            `).join("")}
        </div>

        <a href="/products?keyword=${encodeURIComponent(keyword)}"
           class="block text-center text-base font-semibold text-blue-600 py-3 bg-slate-50 border-t border-slate-200 hover:bg-blue-100 transition duration-150 ease-in-out">
            🔎 Xem tất cả kết quả
        </a>
    `;

    suggestBox.classList.remove("d-none");
    if (clipDropdown) clipDropdown.classList.remove("d-none");
}

function formatPrice(price) {
    if (!price) return "0 ₫";
    return price.toLocaleString("vi-VN") + " ₫";
}

export function hideSuggest() {
    const suggestBox = getSuggestBox();
    const clipDropdown = getClipDropdown();

    if (suggestBox) {
        suggestBox.classList.add("d-none");
        suggestBox.innerHTML = "";
    }
    if (clipDropdown) {
        clipDropdown.classList.add("d-none");
    }
}
