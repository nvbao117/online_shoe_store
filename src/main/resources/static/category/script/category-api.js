export async function changeCategory(categoryId) {
    const res = await fetch(`/api/products?categoryId=${categoryId}`);
    return await res.json();
}


export async function getCategories() {
    const res = await fetch("/api/category");
    return res.json();
}

