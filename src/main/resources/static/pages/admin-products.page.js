// /pages/admin-products.page.js
// Page module cho trang quản lý sản phẩm admin

import * as api from '../api/admin-product.api.js';
import * as ui from '../ui/admin-product.ui.js';

let products = [];
let categories = [];
let brands = [];
let expandedProductIds = new Set();
let currentDeleteTarget = null;

const productTableBody = document.getElementById('product-rows');
const searchInput = document.getElementById('product-search');
const categoryFilter = document.getElementById('filter-category');
const brandFilter = document.getElementById('filter-brand');
const statusFilter = document.getElementById('filter-status');
const sortFilter = document.getElementById('filter-sort');
const productCountEl = document.getElementById('product-count');
const addProductBtn = document.getElementById('add-product-btn');
const modalContainer = document.getElementById('modal-container');

async function init() {
    try {
        [categories, brands] = await Promise.all([api.fetchCategories(), api.fetchBrands()]);
        if (categoryFilter) categoryFilter.innerHTML = '<option value="">Tất cả danh mục</option>' + ui.renderSelectOptions(categories);
        if (brandFilter) brandFilter.innerHTML = '<option value="">Tất cả thương hiệu</option>' + ui.renderSelectOptions(brands);
        setupEventListeners();
        await loadProducts();
    } catch (error) {
        console.error('Error initializing page:', error);
    }
}

async function loadProducts() {
    if (!productTableBody) return;
    productTableBody.innerHTML = ui.renderLoading();
    try {
        const params = {
            search: searchInput?.value || '',
            categoryId: categoryFilter?.value || '',
            brandId: brandFilter?.value || '',
            status: statusFilter?.value || '',
            sort: 'createdAt', dir: 'desc'
        };
        if (sortFilter?.value) {
            const [sort, dir] = sortFilter.value.split(':');
            params.sort = sort; params.dir = dir;
        }
        products = await api.fetchProducts(params);
        renderProducts();
        if (productCountEl) productCountEl.textContent = `${products.length} sản phẩm`;
    } catch (error) {
        console.error('Error loading products:', error);
        productTableBody.innerHTML = `<tr><td colspan="10" class="px-4 py-8 text-center text-rose-500">Lỗi tải dữ liệu</td></tr>`;
    }
}

function renderProducts() {
    if (!productTableBody) return;
    productTableBody.innerHTML = ui.renderProductTable(products, expandedProductIds);
}

async function toggleVariants(productId) {
    const variantsPanel = document.querySelector(`.variants-panel[data-product-id="${productId}"]`);
    const expandBtn = document.querySelector(`.expand-btn[data-id="${productId}"] svg`);
    if (expandedProductIds.has(productId)) {
        expandedProductIds.delete(productId);
        variantsPanel?.classList.add('hidden');
        expandBtn?.classList.remove('rotate-90');
    } else {
        expandedProductIds.add(productId);
        variantsPanel?.classList.remove('hidden');
        expandBtn?.classList.add('rotate-90');
        try {
            const variants = await api.fetchVariants(productId);
            const tbody = document.getElementById(`variants-tbody-${productId}`);
            if (tbody) tbody.innerHTML = variants.length > 0 ? variants.map(v => ui.renderVariantRow(v)).join('') : `<tr><td colspan="5" class="px-4 py-4 text-center text-slate-500">Chưa có variant nào</td></tr>`;
        } catch (error) { console.error('Error loading variants:', error); }
    }
}

async function openProductModal(productId = null) {
    let product = null;
    if (productId) {
        try { product = await api.fetchProductById(productId); }
        catch (error) { console.error('Error loading product:', error); return; }
    }
    modalContainer.innerHTML = ui.renderProductModal(product, categories, brands);
    setupModalEvents();
}

async function openVariantModal(productId, variantId = null) {
    let variant = null;
    if (variantId) {
        try {
            const variants = await api.fetchVariants(productId);
            variant = variants.find(v => v.variantId === variantId);
        } catch (error) { console.error('Error loading variant:', error); }
    }
    modalContainer.innerHTML = ui.renderVariantModal(productId, variant);
    setupModalEvents();
}

function setupModalEvents() {
    modalContainer.querySelectorAll('.close-modal-btn').forEach(btn => btn.addEventListener('click', closeModal));
    modalContainer.addEventListener('click', (e) => {
        if (e.target === modalContainer.querySelector('#product-modal') || e.target === modalContainer.querySelector('#variant-modal') || e.target === modalContainer.querySelector('#delete-modal')) closeModal();
    });
    const productForm = document.getElementById('product-form');
    if (productForm) productForm.addEventListener('submit', handleProductSubmit);
    const variantForm = document.getElementById('variant-form');
    if (variantForm) variantForm.addEventListener('submit', handleVariantSubmit);
    const confirmDeleteBtn = modalContainer.querySelector('.confirm-delete-btn');
    if (confirmDeleteBtn) confirmDeleteBtn.addEventListener('click', handleConfirmDelete);
}

function closeModal() { modalContainer.innerHTML = ''; currentDeleteTarget = null; }

async function handleProductSubmit(e) {
    e.preventDefault();
    const form = e.target;
    const formData = new FormData(form);
    const data = {
        name: formData.get('name'), description: formData.get('description'),
        price: parseFloat(formData.get('price')) || 0, imageUrl: formData.get('imageUrl'),
        categoryId: formData.get('categoryId'), brandId: formData.get('brandId'), status: formData.get('status')
    };
    const productId = formData.get('productId');
    try {
        if (productId) await api.updateProduct(productId, data);
        else await api.createProduct(data);
        closeModal();
        await loadProducts();
    } catch (error) { console.error('Error saving product:', error); }
}

async function handleVariantSubmit(e) {
    e.preventDefault();
    const form = e.target;
    const formData = new FormData(form);
    const data = { size: formData.get('size'), color: formData.get('color'), stock: parseInt(formData.get('stock')) || 0, imageUrl: formData.get('imageUrl') };
    const variantId = formData.get('variantId');
    const productId = formData.get('productId');
    try {
        if (variantId) await api.updateVariant(variantId, data);
        else await api.createVariant(productId, data);
        closeModal();
        const variants = await api.fetchVariants(productId);
        const tbody = document.getElementById(`variants-tbody-${productId}`);
        if (tbody) tbody.innerHTML = variants.length > 0 ? variants.map(v => ui.renderVariantRow(v)).join('') : `<tr><td colspan="5" class="px-4 py-4 text-center text-slate-500">Chưa có variant nào</td></tr>`;
        await loadProducts();
    } catch (error) { console.error('Error saving variant:', error); }
}

function openDeleteModal(type, id, name) {
    currentDeleteTarget = { type, id, name };
    modalContainer.innerHTML = ui.renderDeleteConfirmModal(type, name);
    setupModalEvents();
}

async function handleConfirmDelete() {
    if (!currentDeleteTarget) return;
    const { type, id } = currentDeleteTarget;
    try {
        if (type === 'product') { await api.deleteProduct(id); expandedProductIds.delete(id); }
        else await api.deleteVariant(id);
        closeModal();
        await loadProducts();
    } catch (error) { console.error('Error deleting:', error); }
}

function setupEventListeners() {
    let searchTimeout;
    searchInput?.addEventListener('input', () => { clearTimeout(searchTimeout); searchTimeout = setTimeout(loadProducts, 300); });
    categoryFilter?.addEventListener('change', loadProducts);
    brandFilter?.addEventListener('change', loadProducts);
    statusFilter?.addEventListener('change', loadProducts);
    sortFilter?.addEventListener('change', loadProducts);
    addProductBtn?.addEventListener('click', () => openProductModal());

    productTableBody?.addEventListener('click', async (e) => {
        const expandBtn = e.target.closest('.expand-btn');
        if (expandBtn) { await toggleVariants(expandBtn.dataset.id); return; }
        const editProductBtn = e.target.closest('.edit-product-btn');
        if (editProductBtn) { await openProductModal(editProductBtn.dataset.id); return; }
        const deleteProductBtn = e.target.closest('.delete-product-btn');
        if (deleteProductBtn) {
            const product = products.find(p => p.productId === deleteProductBtn.dataset.id);
            openDeleteModal('product', deleteProductBtn.dataset.id, product?.name || 'Sản phẩm');
            return;
        }
        const addVariantBtn = e.target.closest('.add-variant-btn');
        if (addVariantBtn) { await openVariantModal(addVariantBtn.dataset.productId); return; }
        const editVariantBtn = e.target.closest('.edit-variant-btn');
        if (editVariantBtn) { await openVariantModal(editVariantBtn.dataset.productId, editVariantBtn.dataset.id); return; }
        const deleteVariantBtn = e.target.closest('.delete-variant-btn');
        if (deleteVariantBtn) { openDeleteModal('variant', deleteVariantBtn.dataset.id, 'variant này'); return; }
    });
}

document.addEventListener('DOMContentLoaded', init);
