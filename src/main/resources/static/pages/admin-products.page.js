// /pages/admin-products.page.js
// Page module cho trang quản lý sản phẩm admin

import * as api from '../api/admin-product.api.js';
import * as ui from '../ui/admin-product.ui.js';

// State
let products = [];
let categories = [];
let brands = [];
let expandedProductIds = new Set();
let currentDeleteTarget = null; // { type: 'product' | 'variant', id: string, name: string }

// DOM references
const productTableBody = document.getElementById('product-rows');
const searchInput = document.getElementById('product-search');
const categoryFilter = document.getElementById('filter-category');
const brandFilter = document.getElementById('filter-brand');
const statusFilter = document.getElementById('filter-status');
const sortFilter = document.getElementById('filter-sort');
const productCountEl = document.getElementById('product-count');
const addProductBtn = document.getElementById('add-product-btn');
const modalContainer = document.getElementById('modal-container');

/**
 * Khởi tạo trang
 */
async function init() {
    try {
        // Load options cho filters
        [categories, brands] = await Promise.all([
            api.fetchCategories(),
            api.fetchBrands()
        ]);

        // Populate filter dropdowns
        if (categoryFilter) {
            categoryFilter.innerHTML = '<option value="">Tất cả danh mục</option>' + ui.renderSelectOptions(categories);
        }
        if (brandFilter) {
            brandFilter.innerHTML = '<option value="">Tất cả thương hiệu</option>' + ui.renderSelectOptions(brands);
        }

        // Setup event listeners
        setupEventListeners();

        // Load products
        await loadProducts();
    } catch (error) {
        console.error('Error initializing page:', error);
        showToast('Lỗi tải trang', 'error');
    }
}

/**
 * Load danh sách sản phẩm
 */
async function loadProducts() {
    if (!productTableBody) return;

    productTableBody.innerHTML = ui.renderLoading();

    try {
        const params = {
            search: searchInput?.value || '',
            categoryId: categoryFilter?.value || '',
            brandId: brandFilter?.value || '',
            status: statusFilter?.value || '',
            sort: 'createdAt',
            dir: 'desc'
        };

        // Parse sort value
        if (sortFilter?.value) {
            const [sort, dir] = sortFilter.value.split(':');
            params.sort = sort;
            params.dir = dir;
        }

        products = await api.fetchProducts(params);
        renderProducts();

        if (productCountEl) {
            productCountEl.textContent = `${products.length} sản phẩm`;
        }
    } catch (error) {
        console.error('Error loading products:', error);
        productTableBody.innerHTML = `<tr><td colspan="10" class="px-4 py-8 text-center text-rose-500">Lỗi tải dữ liệu</td></tr>`;
    }
}

/**
 * Render products lên bảng
 */
function renderProducts() {
    if (!productTableBody) return;
    productTableBody.innerHTML = ui.renderProductTable(products, expandedProductIds);
}

/**
 * Toggle expand/collapse variants
 */
async function toggleVariants(productId) {
    const variantsPanel = document.querySelector(`.variants-panel[data-product-id="${productId}"]`);
    const expandBtn = document.querySelector(`.expand-btn[data-id="${productId}"] svg`);

    if (expandedProductIds.has(productId)) {
        // Collapse
        expandedProductIds.delete(productId);
        variantsPanel?.classList.add('hidden');
        expandBtn?.classList.remove('rotate-90');
    } else {
        // Expand & load variants
        expandedProductIds.add(productId);
        variantsPanel?.classList.remove('hidden');
        expandBtn?.classList.add('rotate-90');

        // Load variants
        try {
            const variants = await api.fetchVariants(productId);
            const tbody = document.getElementById(`variants-tbody-${productId}`);
            if (tbody) {
                tbody.innerHTML = variants.length > 0
                    ? variants.map(v => ui.renderVariantRow(v)).join('')
                    : `<tr><td colspan="5" class="px-4 py-4 text-center text-slate-500">Chưa có variant nào</td></tr>`;
            }
        } catch (error) {
            console.error('Error loading variants:', error);
        }
    }
}

/**
 * Mở modal thêm/sửa sản phẩm
 */
async function openProductModal(productId = null) {
    let product = null;
    if (productId) {
        try {
            product = await api.fetchProductById(productId);
        } catch (error) {
            console.error('Error loading product:', error);
            showToast('Lỗi tải thông tin sản phẩm', 'error');
            return;
        }
    }

    modalContainer.innerHTML = ui.renderProductModal(product, categories, brands);
    setupModalEvents();
}

/**
 * Mở modal thêm/sửa variant
 */
async function openVariantModal(productId, variantId = null) {
    let variant = null;
    if (variantId) {
        try {
            const variants = await api.fetchVariants(productId);
            variant = variants.find(v => v.variantId === variantId);
        } catch (error) {
            console.error('Error loading variant:', error);
        }
    }

    modalContainer.innerHTML = ui.renderVariantModal(productId, variant);
    setupModalEvents();
}

/**
 * Setup modal event listeners
 */
function setupModalEvents() {
    // Close modal buttons
    modalContainer.querySelectorAll('.close-modal-btn').forEach(btn => {
        btn.addEventListener('click', closeModal);
    });

    // Click outside to close
    modalContainer.addEventListener('click', (e) => {
        if (e.target === modalContainer.querySelector('#product-modal') ||
            e.target === modalContainer.querySelector('#variant-modal') ||
            e.target === modalContainer.querySelector('#delete-modal')) {
            closeModal();
        }
    });

    // Product form submit
    const productForm = document.getElementById('product-form');
    if (productForm) {
        productForm.addEventListener('submit', handleProductSubmit);
    }

    // Variant form submit
    const variantForm = document.getElementById('variant-form');
    if (variantForm) {
        variantForm.addEventListener('submit', handleVariantSubmit);
    }

    // Confirm delete button
    const confirmDeleteBtn = modalContainer.querySelector('.confirm-delete-btn');
    if (confirmDeleteBtn) {
        confirmDeleteBtn.addEventListener('click', handleConfirmDelete);
    }
}

/**
 * Đóng modal
 */
function closeModal() {
    modalContainer.innerHTML = '';
    currentDeleteTarget = null;
}

/**
 * Xử lý submit form sản phẩm
 */
async function handleProductSubmit(e) {
    e.preventDefault();
    const form = e.target;
    const formData = new FormData(form);

    const data = {
        name: formData.get('name'),
        description: formData.get('description'),
        price: parseFloat(formData.get('price')) || 0,
        imageUrl: formData.get('imageUrl'),
        categoryId: formData.get('categoryId'),
        brandId: formData.get('brandId'),
        status: formData.get('status')
    };

    const productId = formData.get('productId');

    try {
        if (productId) {
            await api.updateProduct(productId, data);
            showToast('Đã cập nhật sản phẩm');
        } else {
            await api.createProduct(data);
            showToast('Đã thêm sản phẩm mới');
        }
        closeModal();
        await loadProducts();
    } catch (error) {
        console.error('Error saving product:', error);
        showToast('Lỗi lưu sản phẩm', 'error');
    }
}

/**
 * Xử lý submit form variant
 */
async function handleVariantSubmit(e) {
    e.preventDefault();
    const form = e.target;
    const formData = new FormData(form);

    const data = {
        size: formData.get('size'),
        color: formData.get('color'),
        stock: parseInt(formData.get('stock')) || 0,
        imageUrl: formData.get('imageUrl')
    };

    const variantId = formData.get('variantId');
    const productId = formData.get('productId');

    try {
        if (variantId) {
            await api.updateVariant(variantId, data);
            showToast('Đã cập nhật variant');
        } else {
            await api.createVariant(productId, data);
            showToast('Đã thêm variant mới');
        }
        closeModal();

        // Reload variants in expanded panel
        const variants = await api.fetchVariants(productId);
        const tbody = document.getElementById(`variants-tbody-${productId}`);
        if (tbody) {
            tbody.innerHTML = variants.length > 0
                ? variants.map(v => ui.renderVariantRow(v)).join('')
                : `<tr><td colspan="5" class="px-4 py-4 text-center text-slate-500">Chưa có variant nào</td></tr>`;
        }

        // Reload products to update variant count
        await loadProducts();
    } catch (error) {
        console.error('Error saving variant:', error);
        showToast('Lỗi lưu variant', 'error');
    }
}

/**
 * Mở modal xác nhận xóa
 */
function openDeleteModal(type, id, name) {
    currentDeleteTarget = { type, id, name };
    modalContainer.innerHTML = ui.renderDeleteConfirmModal(type, name);
    setupModalEvents();
}

/**
 * Xử lý xác nhận xóa
 */
async function handleConfirmDelete() {
    if (!currentDeleteTarget) return;

    const { type, id } = currentDeleteTarget;

    try {
        if (type === 'product') {
            await api.deleteProduct(id);
            showToast('Đã xóa sản phẩm');
            expandedProductIds.delete(id);
        } else {
            await api.deleteVariant(id);
            showToast('Đã xóa variant');
        }
        closeModal();
        await loadProducts();
    } catch (error) {
        console.error('Error deleting:', error);
        showToast('Lỗi xóa dữ liệu', 'error');
    }
}

/**
 * Hiển thị toast notification
 */
function showToast(message, type = 'success') {
    const toast = document.createElement('div');
    const bgClass = type === 'success' ? 'bg-emerald-500' : 'bg-rose-500';
    toast.className = `fixed bottom-4 right-4 ${bgClass} text-white px-6 py-3 rounded-xl shadow-lg z-50 animate-fade-in`;
    toast.textContent = message;
    document.body.appendChild(toast);

    setTimeout(() => {
        toast.remove();
    }, 3000);
}

/**
 * Setup tất cả event listeners
 */
function setupEventListeners() {
    // Search
    let searchTimeout;
    searchInput?.addEventListener('input', () => {
        clearTimeout(searchTimeout);
        searchTimeout = setTimeout(loadProducts, 300);
    });

    // Filters
    categoryFilter?.addEventListener('change', loadProducts);
    brandFilter?.addEventListener('change', loadProducts);
    statusFilter?.addEventListener('change', loadProducts);
    sortFilter?.addEventListener('change', loadProducts);

    // Add product button
    addProductBtn?.addEventListener('click', () => openProductModal());

    // Table event delegation
    productTableBody?.addEventListener('click', async (e) => {
        // Expand button
        const expandBtn = e.target.closest('.expand-btn');
        if (expandBtn) {
            const productId = expandBtn.dataset.id;
            await toggleVariants(productId);
            return;
        }

        // Edit product
        const editProductBtn = e.target.closest('.edit-product-btn');
        if (editProductBtn) {
            const productId = editProductBtn.dataset.id;
            await openProductModal(productId);
            return;
        }

        // Delete product
        const deleteProductBtn = e.target.closest('.delete-product-btn');
        if (deleteProductBtn) {
            const productId = deleteProductBtn.dataset.id;
            const product = products.find(p => p.productId === productId);
            openDeleteModal('product', productId, product?.name || 'Sản phẩm');
            return;
        }

        // Add variant
        const addVariantBtn = e.target.closest('.add-variant-btn');
        if (addVariantBtn) {
            const productId = addVariantBtn.dataset.productId;
            await openVariantModal(productId);
            return;
        }

        // Edit variant
        const editVariantBtn = e.target.closest('.edit-variant-btn');
        if (editVariantBtn) {
            const variantId = editVariantBtn.dataset.id;
            const productId = editVariantBtn.dataset.productId;
            await openVariantModal(productId, variantId);
            return;
        }

        // Delete variant
        const deleteVariantBtn = e.target.closest('.delete-variant-btn');
        if (deleteVariantBtn) {
            const variantId = deleteVariantBtn.dataset.id;
            openDeleteModal('variant', variantId, 'variant này');
            return;
        }
    });
}

// Initialize on DOM ready
document.addEventListener('DOMContentLoaded', init);
