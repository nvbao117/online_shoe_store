// /**
//  * @param {HTMLElement} container
//  * @param {Array} categories [{ categoryId, name }]
//  * @param {Function} onSelect (categoryId) => Promise<void>
//  */
// export function initCategoryTabs(container, categories, onSelect) {
//     if (!container) return;
//
//     container.innerHTML = "";
//
//     categories.forEach((c, index) => {
//         const btn = document.createElement("button");
//
//         btn.className =
//             "tab-btn px-4 sm:px-6 py-2 rounded-full font-medium text-sm sm:text-base transition";
//
//         if (index === 0) {
//             btn.classList.add("bg-blue-500", "text-white");
//         } else {
//             btn.classList.add(
//                 "border",
//                 "border-blue-500",
//                 "text-blue-600",
//                 "bg-white",
//                 "hover:bg-blue-50"
//             );
//         }
//
//         btn.dataset.categoryId = c.categoryId;
//         btn.textContent = c.name;
//
//         btn.onclick = async () => {
//             setActiveTab(container, btn);
//             await onSelect(c.categoryId);
//         };
//
//         container.appendChild(btn);
//     });
// }
//
// function setActiveTab(container, activeBtn) {
//     container.querySelectorAll(".tab-btn").forEach(btn => {
//         btn.classList.remove("bg-blue-500", "text-white");
//         btn.classList.add(
//             "border",
//             "border-blue-500",
//             "text-blue-600",
//             "bg-white",
//             "hover:bg-blue-50"
//         );
//     });
//
//     activeBtn.classList.add("bg-blue-500", "text-white");
//     activeBtn.classList.remove(
//         "border",
//         "border-blue-500",
//         "text-blue-600",
//         "bg-white",
//         "hover:bg-blue-50"
//     );
// }

export function initCategoryTabs(container, categories, onSelect, activeCategoryId = "`21112005") {
    if (!container) return;

    container.innerHTML = "";

    categories.forEach(c => {
        const btn = document.createElement("button");
        btn.className = "tab-btn px-4 sm:px-6 py-2 rounded-full font-medium text-sm sm:text-base";

        btn.dataset.categoryId = c.categoryId;
        btn.textContent = c.name;

        if (c.categoryId === activeCategoryId) {
            setActive(btn);
        } else {
            setInactive(btn);
        }

        btn.addEventListener("click", () => {
            setActiveTab(container, btn);
            onSelect(c.categoryId);
        });

        container.appendChild(btn);
    });
}

/* ========== PRIVATE HELPERS ========== */
function setActive(btn) {
    btn.classList.add("bg-blue-500", "text-white");
    btn.classList.remove("border", "border-blue-500", "text-blue-600");
}

function setInactive(btn) {
    btn.classList.add("border", "border-blue-500", "text-blue-600");
    btn.classList.remove("bg-blue-500", "text-white");
}

function setActiveTab(container, activeBtn) {
    container.querySelectorAll(".tab-btn").forEach(btn => {
        btn === activeBtn ? setActive(btn) : setInactive(btn);
    });
}
