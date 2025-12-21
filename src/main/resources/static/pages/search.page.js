// Search Products
import { renderSuggest } from "../ui/search-product.ui.js";
import { fetchProductsByKeyword } from "../api/search-product.api.js";
import { fetchProductsBySemantic } from "../api/search-semantic.api.js";
import { hideSuggest } from "../ui/search-product.ui.js";

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

    debounceTimer = setTimeout(async () => {
        try {
            const keywordResults = await fetchProductsByKeyword(keyword);
            if (Array.isArray(keywordResults) && keywordResults.length > 0) {
                renderSuggest(keywordResults, keyword);
                return;
            }
        } catch (e) {
            // ignore and fallback to semantic
        }

        try {
            const semanticResults = await fetchProductsBySemantic(keyword, 5);
            renderSuggest(semanticResults, keyword);
        } catch (e) {
            // on error keep suggest hidden
        }
    }, 300);
});

document.addEventListener("click", (e) => {
    if (!searchWrapper.contains(e.target)) {
        hideSuggest();
    }
});