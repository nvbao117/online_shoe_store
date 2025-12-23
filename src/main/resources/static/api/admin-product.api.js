// /api/admin-product.api.js
// API module cho quản lý sản phẩm admin

const BASE_URL = '/api/admin/products';

/**
 * Lấy danh sách sản phẩm với filter/search/sort
 */
export async function fetchProducts(params = {}) {
    const query = new URLSearchParams();
    if (params.search) query.append('search', params.search);
    if (params.categoryId) query.append('categoryId', params.categoryId);
    if (params.brandId) query.append('brandId', params.brandId);
    if (params.status) query.append('status', params.status);
    if (params.sort) query.append('sort', params.sort);
    if (params.dir) query.append('dir', params.dir);

    const res = await fetch(`${BASE_URL}?${query.toString()}`);
    if (!res.ok) throw new Error('Failed to fetch products');
    return res.json();
}

/**
 * Lấy chi tiết sản phẩm theo ID
 */
export async function fetchProductById(productId) {
    const res = await fetch(`${BASE_URL}/${productId}`);
    if (!res.ok) throw new Error('Failed to fetch product');
    return res.json();
}

/**
 * Tạo sản phẩm mới
 */
export async function createProduct(data) {
    const res = await fetch(BASE_URL, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(data)
    });
    if (!res.ok) throw new Error('Failed to create product');
    return res.json();
}

/**
 * Cập nhật sản phẩm
 */
export async function updateProduct(productId, data) {
    const res = await fetch(`${BASE_URL}/${productId}`, {
        method: 'PUT',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(data)
    });
    if (!res.ok) throw new Error('Failed to update product');
    return res.json();
}

/**
 * Xóa sản phẩm
 */
export async function deleteProduct(productId) {
    const res = await fetch(`${BASE_URL}/${productId}`, { method: 'DELETE' });
    if (!res.ok) throw new Error('Failed to delete product');
    return res.json();
}

/**
 * Lấy danh sách variants của sản phẩm
 */
export async function fetchVariants(productId) {
    const res = await fetch(`${BASE_URL}/${productId}/variants`);
    if (!res.ok) throw new Error('Failed to fetch variants');
    return res.json();
}

/**
 * Tạo variant mới
 */
export async function createVariant(productId, data) {
    const res = await fetch(`${BASE_URL}/${productId}/variants`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(data)
    });
    if (!res.ok) throw new Error('Failed to create variant');
    return res.json();
}

/**
 * Cập nhật variant
 */
export async function updateVariant(variantId, data) {
    const res = await fetch(`${BASE_URL}/variants/${variantId}`, {
        method: 'PUT',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(data)
    });
    if (!res.ok) throw new Error('Failed to update variant');
    return res.json();
}

/**
 * Xóa variant
 */
export async function deleteVariant(variantId) {
    const res = await fetch(`${BASE_URL}/variants/${variantId}`, { method: 'DELETE' });
    if (!res.ok) throw new Error('Failed to delete variant');
    return res.json();
}

/**
 * Lấy danh sách categories
 */
export async function fetchCategories() {
    const res = await fetch(`${BASE_URL}/options/categories`);
    if (!res.ok) throw new Error('Failed to fetch categories');
    return res.json();
}

/**
 * Lấy danh sách brands
 */
export async function fetchBrands() {
    const res = await fetch(`${BASE_URL}/options/brands`);
    if (!res.ok) throw new Error('Failed to fetch brands');
    return res.json();
}
