// Search Products
import { renderSuggest } from "../ui/search-product.ui.js";
import {fetchProductsByKeyword} from "../api/search-product.api.js";
import {hideSuggest} from "../ui/search-product.ui.js";
const input = document.querySelector(".search-input");
const suggestBox = document.getElementById("search-suggest");
const searchWrapper = document.querySelector(".header-search");

let debounceTimer;

input.addEventListener("input", () => {
    const keyword = input.value.trim();

    clearTimeout(debounceTimer);

    if (keyword.length < 2) {
        suggestBox.classList.add("d-none");
        suggestBox.innerHTML = "";
        return;
    }

    debounceTimer = setTimeout(() => {
        fetchProductsByKeyword(keyword).then(products => {
            renderSuggest(products, keyword);
        })
    }, 300); // debounce 300ms
});

document.addEventListener("click", (e) => {
    if (!searchWrapper.contains(e.target)) {
        hideSuggest();
    }
});