const suggestBox = document.getElementById("search-suggest");
export function renderSuggest(items) {
    if (!items.length) {
        suggestBox.classList.add("d-none");
        return;
    }

    suggestBox.innerHTML = `
        <div class="max-h-96 overflow-y-auto p-2"> ${items.map(item => `
        <a href="/product/${item.slug}"
           class="flex items-start gap-3 p-3 rounded-lg hover:bg-red-50 transition duration-150 ease-in-out">

            <img src="${item.imageUrl}"
                 alt="${item.name}"
                 class="w-16 h-16 object-cover rounded-lg border border-slate-200 flex-shrink-0">

            <div class="flex flex-col flex-grow min-w-0">
                <span class="text-base font-semibold text-slate-800 line-clamp-2 leading-snug">
                    ${item.name}
                </span>
                <span class="text-lg text-red-600 font-bold mt-1"> ${formatPrice(item.price)}
                </span>
            </div>
        </a>
    `).join("")}
</div>

<a href="/search?keyword="
   class="block text-center text-base font-semibold text-blue-600 py-3 bg-slate-50 border-t border-slate-200 hover:bg-blue-100 transition duration-150 ease-in-out">
    🔎 Xem tất cả kết quả
</a>
    `;

    suggestBox.classList.remove("d-none");
}
function formatPrice(price) {
    return price.toLocaleString("vi-VN") + " ₫";
}

export function hideSuggest() {
    suggestBox.classList.add("d-none");
    suggestBox.innerHTML = "";
}