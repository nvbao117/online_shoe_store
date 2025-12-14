export async function getBrands(categoryId) {
    const res = await fetch(`/api/brands?categoryId=${categoryId}`);
    return res.json();
}