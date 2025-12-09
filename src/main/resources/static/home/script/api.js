// api.js
const API = {
    getCategories: async () => {
        const res = await fetch("/api/category");
        return res.ok ? res.json() : [];
    },

    getNewProducts: async () => {
        const res = await fetch("/api/new-products");
        return res.ok ? res.json() : [];
    }
};

export default API;
