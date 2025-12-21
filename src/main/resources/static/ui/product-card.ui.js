export function createProductCard(p) {
    const priceValue = (p && typeof p.price === "number") ? p.price : Number(p?.price || 0);
    const displayPrice = isNaN(priceValue) ? "0" : priceValue.toLocaleString("vi-VN");
    const imageSrc = p?.imageUrl ? (p.imageUrl.startsWith("http") ? p.imageUrl : `/${p.imageUrl.replace(/^\//, "")}`) : "/images/logo-shop/logo-sneaker.png";
    const name = p?.name || "Sản phẩm";
    return `
    <a href="/product-detail/${p.productId}"
        <div class="bg-white rounded-lg border border-gray-200 overflow-hidden hover:shadow-lg transition-shadow h-full flex flex-col product-card" data-product-id="${p.productId || ''}">
            <div class="relative">
                <img src="${imageSrc}" class="w-full h-40 sm:h-44 object-cover product-card-img" data-product-id="${p.productId || ''}" />
                <span class="absolute top-2 left-2 bg-red-500 text-white text-[10px] sm:text-xs px-2 py-1 rounded">
                    Sản phẩm mới
                </span>
            </div>

            <div class="p-2 sm:p-3 flex flex-col justify-between min-h-[120px]">
                <h4 class="font-medium text-gray-800 text-sm sm:text-base line-clamp-2 min-h-[40px]">
                    ${name}
                </h4>

                <div>
                    <span class="text-red-500 font-bold text-sm sm:text-base">
                        ${displayPrice} đ
                    </span>

                    <div class="flex gap-2 text-xs sm:text-sm">
                        <span class="text-gray-400 line-through">1.500.000 đ</span>
                        <span class="text-red-400">-41%</span>
                    </div>
                </div>
            </div>
        </div>
    </a>
    `;
}
