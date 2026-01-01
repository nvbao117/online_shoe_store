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

    // Product image file change handler
    const imageFileInput = document.getElementById('product-image-file');
    if (imageFileInput) {
        imageFileInput.addEventListener('change', (e) => handleImageFileChange(e, 'product-image-preview'));
    }

    // Variant image file change handler
    const variantImageFileInput = document.getElementById('variant-image-file');
    if (variantImageFileInput) {
        variantImageFileInput.addEventListener('change', (e) => handleImageFileChange(e, 'variant-image-preview'));
    }
}

function handleImageFileChange(e, previewContainerId) {
    const file = e.target.files[0];
    if (!file) return;

    // Validate file size (max 5MB)
    if (file.size > 5 * 1024 * 1024) {
        showToast('Ảnh quá lớn. Tối đa 5MB', 'error');
        e.target.value = '';
        return;
    }

    // Preview image
    const previewContainer = document.getElementById(previewContainerId);
    if (previewContainer) {
        const reader = new FileReader();
        reader.onload = (event) => {
            previewContainer.innerHTML = `<img src="${event.target.result}" alt="Preview" class="w-full h-full object-cover">`;
        };
        reader.readAsDataURL(file);
    }
}

function showToast(message, type = 'success') {
    const existingToast = document.querySelector('.toast-notification');
    if (existingToast) existingToast.remove();

    const bgColor = type === 'error' ? 'bg-rose-500' : type === 'warning' ? 'bg-amber-500' : 'bg-emerald-500';
    const toast = document.createElement('div');
    toast.className = `toast-notification fixed top-4 right-4 ${bgColor} text-white px-6 py-3 rounded-xl shadow-lg z-[100] animate-fade-in flex items-center gap-2`;
    toast.innerHTML = `
        <span>${message}</span>
        <button class="ml-2 hover:opacity-70" onclick="this.parentElement.remove()">
            <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path></svg>
        </button>
    `;
    document.body.appendChild(toast);
    setTimeout(() => toast.remove(), 4000);
}

function closeModal() { modalContainer.innerHTML = ''; currentDeleteTarget = null; }

async function handleProductSubmit(e) {
    e.preventDefault();
    const form = e.target;
    const formData = new FormData(form);
    const submitBtn = document.getElementById('submit-product-btn');
    const productId = formData.get('productId');
    const isEdit = !!productId;

    // Check if there's a new image file to upload
    const imageFile = document.getElementById('product-image-file')?.files[0];
    let imageUrl = formData.get('imageUrl');

    // Validate: Bắt buộc phải có ảnh
    if (!imageFile && (!imageUrl || imageUrl.trim() === '')) {
        showToast('Vui lòng chọn ảnh sản phẩm', 'error');
        return;
    }

    // Disable button while processing
    if (submitBtn) {
        submitBtn.disabled = true;
        submitBtn.innerHTML = '<svg class="animate-spin w-5 h-5 mr-2 inline" fill="none" viewBox="0 0 24 24"><circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle><path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path></svg>Đang xử lý...';
    }

    try {
        // Upload image if there's a new file
        if (imageFile) {
            const uploadStatus = document.getElementById('upload-status');
            if (uploadStatus) {
                uploadStatus.classList.remove('hidden');
                uploadStatus.className = 'text-xs mt-1 text-blue-600';
                uploadStatus.textContent = 'Đang tải ảnh lên...';
            }

            const uploadResult = await api.uploadImage(imageFile);
            imageUrl = uploadResult.imageUrl;

            if (uploadStatus) {
                uploadStatus.className = 'text-xs mt-1 text-emerald-600';
                uploadStatus.textContent = 'Tải ảnh thành công!';
            }
        }

        const data = {
            name: formData.get('name'),
            description: formData.get('description'),
            price: parseFloat(formData.get('price')) || 0,
            imageUrl: imageUrl,
            categoryId: formData.get('categoryId'),
            brandId: formData.get('brandId'),
            status: formData.get('status')
        };

        if (isEdit) await api.updateProduct(productId, data);
        else await api.createProduct(data);

        closeModal();
        showToast(isEdit ? 'Đã cập nhật sản phẩm!' : 'Đã thêm sản phẩm mới!', 'success');
        await loadProducts();
    } catch (error) {
        console.error('Error saving product:', error);
        showToast(error.message || 'Lỗi khi lưu sản phẩm', 'error');

        // Re-enable button
        if (submitBtn) {
            submitBtn.disabled = false;
            submitBtn.innerHTML = isEdit ? 'Lưu thay đổi' : 'Thêm sản phẩm';
        }
    }
}

async function handleVariantSubmit(e) {
    e.preventDefault();
    const form = e.target;
    const formData = new FormData(form);
    const variantId = formData.get('variantId');
    const productId = formData.get('productId');
    const isEdit = !!variantId;
    const submitBtn = document.getElementById('submit-variant-btn');

    // Check for image file
    const imageFile = document.getElementById('variant-image-file')?.files[0];
    let imageUrl = formData.get('imageUrl');

    // Validate: Bắt buộc phải có ảnh
    if (!imageFile && (!imageUrl || imageUrl.trim() === '')) {
        showToast('Vui lòng chọn ảnh cho variant', 'error');
        return;
    }

    // Disable button
    if (submitBtn) {
        submitBtn.disabled = true;
        submitBtn.innerHTML = '<svg class="animate-spin w-5 h-5 mr-2 inline" fill="none" viewBox="0 0 24 24"><circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle><path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path></svg>Đang xử lý...';
    }

    try {
        // Upload image if new file selected
        if (imageFile) {
            const uploadStatus = document.getElementById('variant-upload-status');
            if (uploadStatus) {
                uploadStatus.classList.remove('hidden');
                uploadStatus.className = 'text-xs mt-1 text-blue-600';
                uploadStatus.textContent = 'Đang tải ảnh lên...';
            }

            const uploadResult = await api.uploadImage(imageFile);
            imageUrl = uploadResult.imageUrl;

            if (uploadStatus) {
                uploadStatus.className = 'text-xs mt-1 text-emerald-600';
                uploadStatus.textContent = 'Tải ảnh thành công!';
            }
        }

        const data = {
            size: formData.get('size'),
            color: formData.get('color'),
            stock: parseInt(formData.get('stock')) || 0,
            imageUrl: imageUrl
        };

        if (variantId) await api.updateVariant(variantId, data);
        else await api.createVariant(productId, data);

        closeModal();
        showToast(isEdit ? 'Đã cập nhật variant!' : 'Đã thêm variant mới!', 'success');
        const variants = await api.fetchVariants(productId);
        const tbody = document.getElementById(`variants-tbody-${productId}`);
        if (tbody) tbody.innerHTML = variants.length > 0 ? variants.map(v => ui.renderVariantRow(v)).join('') : `<tr><td colspan="5" class="px-4 py-4 text-center text-slate-500">Chưa có variant nào</td></tr>`;
        await loadProducts();
    } catch (error) {
        console.error('Error saving variant:', error);
        showToast(error.message || 'Lỗi khi lưu variant', 'error');

        // Re-enable button
        if (submitBtn) {
            submitBtn.disabled = false;
            submitBtn.innerHTML = isEdit ? 'Lưu thay đổi' : 'Thêm variant';
        }
    }
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
        showToast('Đã xóa thành công!', 'success');
        await loadProducts();
    } catch (error) {
        console.error('Error deleting:', error);
        showToast('Lỗi khi xóa', 'error');
    }
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
