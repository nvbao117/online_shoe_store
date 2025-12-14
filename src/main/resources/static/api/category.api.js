// /api/category.api.js

/**
 * Lấy danh sách category
 * @returns {Promise<Array<{ categoryId: string, name: string, imageUrl?: string }>>}
 */
export async function getCategories() {
    const res = await fetch("/api/category");

    if (!res.ok) {
        throw new Error("Failed to fetch categories");
    }

    return res.json();
}
