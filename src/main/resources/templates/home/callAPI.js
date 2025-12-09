async function getTop20Product() {
  const res = await fetch("/api/new-products");
  const products = await res.json();

  document.getElementById("productsContainer").innerHTML = products
    .map(
      (p) => `
                <!-- Start product -->
            <div class="w-[65%] xs:w-[55%] sm:w-1/5 shrink-0">
              <div
                class="bg-white rounded-lg border border-gray-200 overflow-hidden hover:shadow-lg transition-shadow"
              >
                <div class="relative">
                  <img
                    src="/${p.image_url}"
                    alt="Giày Victor"
                    class="w-full h-40 sm:h-44 object-cover"
                  />
                  <span
                    class="absolute top-2 left-2 bg-red-500 text-white text-[10px] sm:text-xs px-2 py-1 rounded"
                    >Sản phẩm mới</span
                  >
                </div>
                <div class="p-2 sm:p-3">
                  <h4 class="font-medium text-gray-800 text-sm sm:text-base">
                    ${p.name}r
                  </h4>
                  <div class="flex items-center gap-2 mt-1">
                    <span class="text-red-500 font-bold text-sm sm:text-base"
                      >${p.price} đ</span
                    >
                  </div>
                  <div class="flex items-center gap-2 text-xs sm:text-sm">
                    <span class="text-gray-400 line-through">Defaut 1.500.000 đ</span>
                    <span class="text-red-400">Defaut-41%</span>
                  </div>
                </div>
              </div>
            </div>
            <!-- End product -->
            `
    )
    .join("");
}

export async function getCategories() {
  try {
    const res = await fetch("/api/category");
    if (!res.ok) throw new Error("API error");
    return await res.json();
  } catch (err) {
    console.error("Fetch /api/category failed:", err);
    return [];
  }
}
