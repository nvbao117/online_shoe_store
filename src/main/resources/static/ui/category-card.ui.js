export function renderCategoryCards(container, categories) {
    if (!container) return;

    container.innerHTML = "";
    const fragment = document.createDocumentFragment();

    categories.forEach(c => {
        const card = document.createElement("div");
        card.className = "sport-card cursor-pointer group";

        card.innerHTML = `
            <a href="/products?categoryId=${c.categoryId}"
               class="block group">
                <div class="overflow-hidden rounded-xl shadow-md">
                    <img src="${c.imageUrl}"
                         class="w-full h-40 md:h-56 object-cover transition-transform duration-300 group-hover:scale-110">
                </div>
                <p class="mt-3 font-semibold text-base md:text-lg text-gray-800 group-hover:text-blue-600">
                    ${c.name}
                </p>
            </a>
        `;

        fragment.appendChild(card);
    });

    container.appendChild(fragment);
}
