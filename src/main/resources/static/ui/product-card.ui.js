export function createProductCard(p) {
    return `
        <div class="bg-white rounded-lg border border-gray-200 overflow-hidden hover:shadow-lg transition-shadow h-full flex flex-col">
            <div class="relative">
                <img src="/${p.imageUrl}" class="w-full h-40 sm:h-44 object-cover" />
                <span class="absolute top-2 left-2 bg-red-500 text-white text-[10px] sm:text-xs px-2 py-1 rounded">
                    Sản phẩm mới
                </span>
            </div>

            <div class="p-2 sm:p-3 flex flex-col justify-between min-h-[120px]">
                <h4 class="font-medium text-gray-800 text-sm sm:text-base line-clamp-2 min-h-[40px]">
                    ${p.name}
                </h4>

                <div>
                    <span class="text-red-500 font-bold text-sm sm:text-base">
                        ${p.price.toLocaleString("vi-VN")} đ
                    </span>

                    <div class="flex gap-2 text-xs sm:text-sm">
                        <span class="text-gray-400 line-through">1.500.000 đ</span>
                        <span class="text-red-400">-41%</span>
                    </div>
                </div>
            </div>
        </div>
    `;
}
