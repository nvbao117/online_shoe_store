// sports.js
import { getCategories } from "./callAPI.js";

let sports = [];
let currentIndex = 0;
const itemsPerPage = 5;

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
