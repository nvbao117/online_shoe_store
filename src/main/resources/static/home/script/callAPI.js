console.log("callAPI.js loaded");

let sports = [];
let currentIndex = 0;
const itemsPerPage = 5;
console.log("sr.js loaded");

async function loadCategories() {
  sports = await getCategories();
  renderSports();
}

function renderSports(direction = "next") {
  const grid = document.getElementById("sportGrid");
  if (!grid || sports.length === 0) return;

  const exitClass = "slide-exit-active";
  const enterClass = "slide-enter-active";

  grid.classList.add("slide-exit");
  requestAnimationFrame(() => {
    grid.classList.add(exitClass);

    setTimeout(() => {
      grid.classList.remove("slide-exit", exitClass);

      grid.innerHTML = "";
      const slice = sports.slice(currentIndex, currentIndex + itemsPerPage);

      slice.forEach((sport) => {
        grid.innerHTML += `
          <div class="sport-card cursor-pointer group">
            <div class="overflow-hidden rounded-xl shadow-md">
              <img src="${sport.img}" class="w-full h-40 md:h-56 object-cover transition-transform duration-300 group-hover:scale-110">
            </div>
            <p class="mt-3 font-semibold text-base md:text-lg text-gray-800 tracking-wide group-hover:text-blue-600 transition">
              ${sport.name}
            </p>
          </div>
        `;
      });

      grid.classList.add("slide-enter");
      requestAnimationFrame(() => grid.classList.add(enterClass));

      setTimeout(() => grid.classList.remove("slide-enter", enterClass), 350);

    }, 350);
  });
}

document.getElementById("nextBtn").onclick = () => {
  if (currentIndex + itemsPerPage < sports.length) {
    currentIndex += itemsPerPage;
    renderSports("next");
  }
};

document.getElementById("prevBtn").onclick = () => {
  if (currentIndex - itemsPerPage >= 0) {
    currentIndex -= itemsPerPage;
    renderSports("prev");
  }
};

document.addEventListener("DOMContentLoaded", () => {
  loadCategories();
  getTop20Product();

  const container = document.getElementById("productsContainer");
  const prevBtn = document.getElementById("prevProducts");
  const nextBtn = document.getElementById("nextProducts");

  if (!container || !prevBtn || !nextBtn) return;

  const scrollStep = () => {
    const firstCard = container.querySelector("div.shrink-0");
    if (!firstCard) return container.clientWidth;
    return firstCard.getBoundingClientRect().width + 8;
  };

  prevBtn.addEventListener("click", () => {
    container.scrollBy({ left: -scrollStep(), behavior: "smooth" });
  });

  nextBtn.addEventListener("click", () => {
    container.scrollBy({ left: scrollStep(), behavior: "smooth" });
  });
});



async function getTop20Product() {
  const res = await fetch("/api/new-products");
  const products = await res.json();console.log("callAPI.js loaded");

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
                    src="/${p.imageUrl}"
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
async function getCategories() {
  try {
    const res = await fetch("/api/category");
    if (!res.ok) throw new Error("API error");
    return await res.json();
  } catch (err) {
    console.error("Fetch /api/category failed:", err);
    return [];
  }
}
