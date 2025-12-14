// ui.js

function toImgUrl(u) {
    if (!u) return "";
    u = u.replaceAll("\\", "/").trim();

    // Nếu backend trả "/images/..." thì giữ nguyên
    if (u.startsWith("/")) return u;

    // Nếu backend trả "images/..." thì thêm "/"
    if (u.startsWith("images/")) return "/" + u;

    // Nếu backend lỡ trả "src/data/images/products/..." thì đổi sang "/images/products/..."
    u = u.replace("src/data/images/products/", "images/products/");
    if (u.startsWith("images/")) return "/" + u;

    // Nếu chỉ là "main_xxx.jpg"
    return "/images/products/" + u;
}

export function renderCategories(list) {
    const grid = document.getElementById("sportGrid");
    if (!grid) return;

    grid.innerHTML = list.map(c => `
    <div class="sport-card cursor-pointer group">
      <div class="overflow-hidden rounded-xl shadow-md">
        <img src="${toImgUrl(c.imageUrl)}"
             class="w-full h-40 md:h-56 object-cover"
             alt="${c.name}">
      </div>
      <p class="mt-3 font-semibold text-base md:text-lg text-gray-800 group-hover:text-blue-600">
        ${c.name}
      </p>
    </div>
  `).join("");
}

export function renderProducts(list) {
    const container = document.getElementById("productsContainer");
    if (!container) return;

    container.innerHTML = list.map(p => `
    <div class="w-[65%] xs:w-[55%] sm:w-1/5 shrink-0">
      <div class="bg-white rounded-lg border border-gray-200 overflow-hidden hover:shadow-lg transition-shadow h-full flex flex-col">

        <div class="relative">
          <!-- ✅ sửa src: KHÔNG thêm "/" nữa -->
          <img src="${toImgUrl(p.imageUrl)}"
               alt="${p.name}"
               class="w-full h-40 sm:h-44 object-cover" />
          <span class="absolute top-2 left-2 bg-red-500 text-white text-[10px] sm:text-xs px-2 py-1 rounded">
            Sản phẩm mới
          </span>
        </div>

        <div class="p-2 sm:p-3 flex flex-col justify-between min-h-[120px]">
          <h4 class="font-medium text-gray-800 text-sm sm:text-base line-clamp-2 min-h-[40px]">
            ${p.name}
          </h4>

          <div>
            <div class="flex items-center gap-2 mt-1">
              <span class="text-red-500 font-bold text-sm sm:text-base">
                ${p.price} đ
              </span>
            </div>
            <div class="flex items-center gap-2 text-xs sm:text-sm">
              <span class="text-gray-400 line-through">1.500.000 đ</span>
              <span class="text-red-400">-41%</span>
            </div>
          </div>
        </div>

      </div>
    </div>
  `).join("");
}
