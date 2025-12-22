// /ui/admin-product.ui.js
// UI module cho quản lý sản phẩm admin

export function formatMoney(value) {
    if (value === null || value === undefined) return '—';
    return new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND', maximumFractionDigits: 0 }).format(Number(value));
}

export function formatDate(value) {
    if (!value) return '';
    const d = new Date(value);
    if (Number.isNaN(d.getTime())) return value;
    return d.toLocaleDateString('vi-VN', { day: '2-digit', month: '2-digit', year: 'numeric' });
}

export function renderStatusBadge(status) {
    const map = {
        ACTIVE: { cls: 'bg-emerald-100 text-emerald-700', text: 'Đang bán' },
        INACTIVE: { cls: 'bg-slate-100 text-slate-600', text: 'Ngừng bán' },
        OUT_OF_STOCK: { cls: 'bg-rose-100 text-rose-700', text: 'Hết hàng' }
    };
    const cfg = map[status] || { cls: 'bg-slate-100 text-slate-600', text: status || 'N/A' };
    return `<span class="px-2 py-1 text-xs rounded-full font-medium ${cfg.cls}">${cfg.text}</span>`;
}

function normalizeImageUrl(raw) {
    if (!raw) return null;
    let v = raw.replace(/\\/g, '/').trim();
    if (v.startsWith('/src/data/images/products/')) return '/images/products/' + v.substring('/src/data/images/products/'.length);
    if (v.startsWith('src/data/images/products/')) return '/images/products/' + v.substring('src/data/images/products/'.length);
    if (v.startsWith('/images/') || v.startsWith('http://') || v.startsWith('https://')) return v;
    return '/images/products/' + v;
}

export function renderProductImage(imageUrl, name) {
    if (!imageUrl) {
        return `<div class="w-12 h-12 bg-slate-200 rounded-lg flex items-center justify-center text-slate-400">
            <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z"></path></svg>
        </div>`;
    }
    const url = normalizeImageUrl(imageUrl);
    return `<img src="${url}" alt="${name || 'Product'}" class="w-12 h-12 object-cover rounded-lg border border-slate-200" onerror="this.src='/images/no-image.png'">`;
}

export function renderProductRow(product, isExpanded = false) {
    return `
        <tr class="hover:bg-slate-50 border-b border-slate-100 product-row" data-id="${product.productId}">
            <td class="px-4 py-3">
                <button class="expand-btn text-slate-400 hover:text-slate-600 transition" data-id="${product.productId}">
                    <svg class="w-5 h-5 transition-transform ${isExpanded ? 'rotate-90' : ''}" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"></path>
                    </svg>
                </button>
            </td>
            <td class="px-4 py-3">${renderProductImage(product.imageUrl, product.name)}</td>
            <td class="px-4 py-3">
                <div class="font-medium text-slate-800">${product.name || ''}</div>
                <div class="text-xs text-slate-500 truncate max-w-xs">${product.description || ''}</div>
            </td>
            <td class="px-4 py-3 text-slate-700 font-medium">${formatMoney(product.price)}</td>
            <td class="px-4 py-3 text-slate-600">${product.brandName || '—'}</td>
            <td class="px-4 py-3 text-slate-600">${product.categoryName || '—'}</td>
            <td class="px-4 py-3">${renderStatusBadge(product.status)}</td>
            <td class="px-4 py-3 text-center">
                <span class="inline-flex items-center gap-1 px-2 py-1 bg-blue-50 text-blue-700 text-xs rounded-full">
                    ${product.variantCount || 0}
                </span>
            </td>
            <td class="px-4 py-3 text-right">
                <div class="flex items-center justify-end gap-2">
                    <button class="edit-product-btn p-2 text-blue-600 hover:bg-blue-50 rounded-lg transition" data-id="${product.productId}" title="Sửa">
                        <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path></svg>
                    </button>
                    <button class="delete-product-btn p-2 text-rose-600 hover:bg-rose-50 rounded-lg transition" data-id="${product.productId}" title="Xóa">
                        <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"></path></svg>
                    </button>
                </div>
            </td>
        </tr>
    `;
}

export function renderVariantRow(variant) {
    const imgUrl = normalizeImageUrl(variant.imageUrl);
    return `
        <tr class="hover:bg-slate-50" data-variant-id="${variant.variantId}">
            <td class="px-4 py-2">
                ${imgUrl
            ? `<img src="${imgUrl}" alt="" class="w-10 h-10 object-cover rounded border" onerror="this.src='/images/no-image.png'">`
            : `<div class="w-10 h-10 bg-slate-100 rounded flex items-center justify-center text-slate-400 text-xs">N/A</div>`
        }
            </td>
            <td class="px-4 py-2 font-medium text-slate-700">${variant.size || '—'}</td>
            <td class="px-4 py-2 text-slate-600">${variant.color || '—'}</td>
            <td class="px-4 py-2">
                <span class="px-2 py-1 text-xs rounded ${variant.stock > 0 ? 'bg-green-100 text-green-700' : 'bg-rose-100 text-rose-700'}">${variant.stock || 0}</span>
            </td>
            <td class="px-4 py-2 text-right">
                <button class="edit-variant-btn p-1.5 text-blue-600 hover:bg-blue-50 rounded transition" data-id="${variant.variantId}" data-product-id="${variant.productId}" title="Sửa">
                    <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path></svg>
                </button>
                <button class="delete-variant-btn p-1.5 text-rose-600 hover:bg-rose-50 rounded transition" data-id="${variant.variantId}" title="Xóa">
                    <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"></path></svg>
                </button>
            </td>
        </tr>
    `;
}

export function renderVariantsPanel(productId, variants = [], isExpanded = false) {
    const variantRows = variants.length > 0
        ? variants.map(v => renderVariantRow(v)).join('')
        : `<tr><td colspan="5" class="px-4 py-8 text-center text-slate-500">Chưa có variant nào</td></tr>`;

    return `
        <tr class="variants-panel ${isExpanded ? '' : 'hidden'}" data-product-id="${productId}">
            <td colspan="10" class="p-0">
                <div class="bg-slate-50 border-t border-slate-200 p-4">
                    <div class="flex items-center justify-between mb-3">
                        <h4 class="text-sm font-semibold text-slate-700">Variants</h4>
                        <button class="add-variant-btn px-3 py-1.5 bg-blue-600 text-white text-xs font-medium rounded-lg hover:bg-blue-700 transition flex items-center gap-1" data-product-id="${productId}">
                            <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"></path></svg>
                            Thêm Variant
                        </button>
                    </div>
                    <div class="bg-white rounded-lg border border-slate-200 overflow-hidden">
                        <table class="w-full text-sm">
                            <thead class="bg-slate-100 text-slate-600 text-xs uppercase">
                                <tr><th class="px-4 py-2 text-left">Hình</th><th class="px-4 py-2 text-left">Size</th><th class="px-4 py-2 text-left">Màu</th><th class="px-4 py-2 text-left">Tồn kho</th><th class="px-4 py-2 text-right">Thao tác</th></tr>
                            </thead>
                            <tbody class="divide-y divide-slate-100" id="variants-tbody-${productId}">${variantRows}</tbody>
                        </table>
                    </div>
                </div>
            </td>
        </tr>
    `;
}

export function renderProductTable(products, expandedIds = new Set()) {
    if (!products || products.length === 0) {
        return `<tr><td colspan="10" class="px-4 py-12 text-center text-slate-500">
            <svg class="w-12 h-12 mx-auto mb-3 text-slate-300" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20 7l-8-4-8 4m16 0l-8 4m8-4v10l-8 4m0-10L4 7m8 4v10M4 7v10l8 4"></path></svg>
            <p class="font-medium">Không có sản phẩm nào</p>
        </td></tr>`;
    }
    return products.map(p => {
        const isExpanded = expandedIds.has(p.productId);
        return renderProductRow(p, isExpanded) + renderVariantsPanel(p.productId, [], isExpanded);
    }).join('');
}

export function renderProductModal(product = null, categories = [], brands = []) {
    const isEdit = !!product;
    const title = isEdit ? 'Sửa sản phẩm' : 'Thêm sản phẩm mới';
    const categoryOptions = categories.map(c => `<option value="${c.value}" ${product?.categoryId === c.value ? 'selected' : ''}>${c.label}</option>`).join('');
    const brandOptions = brands.map(b => `<option value="${b.value}" ${product?.brandId === b.value ? 'selected' : ''}>${b.label}</option>`).join('');

    return `
        <div class="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4" id="product-modal">
            <div class="bg-white rounded-2xl shadow-xl w-full max-w-lg max-h-[90vh] overflow-hidden animate-fade-in">
                <div class="px-6 py-4 border-b border-slate-200 flex items-center justify-between">
                    <h3 class="text-lg font-semibold text-slate-800">${title}</h3>
                    <button class="close-modal-btn p-2 hover:bg-slate-100 rounded-lg transition">
                        <svg class="w-5 h-5 text-slate-500" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path></svg>
                    </button>
                </div>
                <form id="product-form" class="p-6 space-y-4 overflow-y-auto max-h-[calc(90vh-140px)]">
                    <input type="hidden" name="productId" value="${product?.productId || ''}">
                    <div>
                        <label class="block text-sm font-medium text-slate-700 mb-1">Tên sản phẩm *</label>
                        <input type="text" name="name" value="${product?.name || ''}" required class="w-full px-4 py-2 border border-slate-300 rounded-xl focus:outline-none focus:ring-2 focus:ring-blue-500">
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-slate-700 mb-1">Mô tả</label>
                        <textarea name="description" rows="3" class="w-full px-4 py-2 border border-slate-300 rounded-xl focus:outline-none focus:ring-2 focus:ring-blue-500">${product?.description || ''}</textarea>
                    </div>
                    <div class="grid grid-cols-2 gap-4">
                        <div>
                            <label class="block text-sm font-medium text-slate-700 mb-1">Giá (VNĐ) *</label>
                            <input type="number" name="price" value="${product?.price || ''}" required min="0" class="w-full px-4 py-2 border border-slate-300 rounded-xl focus:outline-none focus:ring-2 focus:ring-blue-500">
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-slate-700 mb-1">Trạng thái</label>
                            <select name="status" class="w-full px-4 py-2 border border-slate-300 rounded-xl focus:outline-none focus:ring-2 focus:ring-blue-500">
                                <option value="ACTIVE" ${product?.status === 'ACTIVE' ? 'selected' : ''}>Đang bán</option>
                                <option value="INACTIVE" ${product?.status === 'INACTIVE' ? 'selected' : ''}>Ngừng bán</option>
                                <option value="OUT_OF_STOCK" ${product?.status === 'OUT_OF_STOCK' ? 'selected' : ''}>Hết hàng</option>
                            </select>
                        </div>
                    </div>
                    <div class="grid grid-cols-2 gap-4">
                        <div>
                            <label class="block text-sm font-medium text-slate-700 mb-1">Danh mục</label>
                            <select name="categoryId" class="w-full px-4 py-2 border border-slate-300 rounded-xl focus:outline-none focus:ring-2 focus:ring-blue-500">
                                <option value="">-- Chọn danh mục --</option>${categoryOptions}
                            </select>
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-slate-700 mb-1">Thương hiệu</label>
                            <select name="brandId" class="w-full px-4 py-2 border border-slate-300 rounded-xl focus:outline-none focus:ring-2 focus:ring-blue-500">
                                <option value="">-- Chọn thương hiệu --</option>${brandOptions}
                            </select>
                        </div>
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-slate-700 mb-1">URL hình ảnh</label>
                        <input type="text" name="imageUrl" value="${product?.imageUrl || ''}" class="w-full px-4 py-2 border border-slate-300 rounded-xl focus:outline-none focus:ring-2 focus:ring-blue-500" placeholder="/images/products/example.jpg">
                    </div>
                </form>
                <div class="px-6 py-4 border-t border-slate-200 flex justify-end gap-3">
                    <button type="button" class="close-modal-btn px-4 py-2 text-slate-600 hover:bg-slate-100 rounded-xl transition">Hủy</button>
                    <button type="submit" form="product-form" class="px-4 py-2 bg-blue-600 text-white rounded-xl hover:bg-blue-700 transition font-medium">${isEdit ? 'Lưu thay đổi' : 'Thêm sản phẩm'}</button>
                </div>
            </div>
        </div>
    `;
}

export function renderVariantModal(productId, variant = null) {
    const isEdit = !!variant;
    const title = isEdit ? 'Sửa Variant' : 'Thêm Variant mới';

    return `
        <div class="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4" id="variant-modal">
            <div class="bg-white rounded-2xl shadow-xl w-full max-w-md animate-fade-in">
                <div class="px-6 py-4 border-b border-slate-200 flex items-center justify-between">
                    <h3 class="text-lg font-semibold text-slate-800">${title}</h3>
                    <button class="close-modal-btn p-2 hover:bg-slate-100 rounded-lg transition">
                        <svg class="w-5 h-5 text-slate-500" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path></svg>
                    </button>
                </div>
                <form id="variant-form" class="p-6 space-y-4">
                    <input type="hidden" name="variantId" value="${variant?.variantId || ''}">
                    <input type="hidden" name="productId" value="${productId}">
                    <div class="grid grid-cols-2 gap-4">
                        <div>
                            <label class="block text-sm font-medium text-slate-700 mb-1">Size *</label>
                            <input type="text" name="size" value="${variant?.size || ''}" required class="w-full px-4 py-2 border border-slate-300 rounded-xl focus:outline-none focus:ring-2 focus:ring-blue-500" placeholder="40, 41, 42...">
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-slate-700 mb-1">Màu sắc *</label>
                            <input type="text" name="color" value="${variant?.color || ''}" required class="w-full px-4 py-2 border border-slate-300 rounded-xl focus:outline-none focus:ring-2 focus:ring-blue-500" placeholder="Đen, Trắng...">
                        </div>
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-slate-700 mb-1">Số lượng tồn kho</label>
                        <input type="number" name="stock" value="${variant?.stock || 0}" min="0" class="w-full px-4 py-2 border border-slate-300 rounded-xl focus:outline-none focus:ring-2 focus:ring-blue-500">
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-slate-700 mb-1">URL hình ảnh</label>
                        <input type="text" name="imageUrl" value="${variant?.imageUrl || ''}" class="w-full px-4 py-2 border border-slate-300 rounded-xl focus:outline-none focus:ring-2 focus:ring-blue-500" placeholder="/images/products/variant.jpg">
                    </div>
                </form>
                <div class="px-6 py-4 border-t border-slate-200 flex justify-end gap-3">
                    <button type="button" class="close-modal-btn px-4 py-2 text-slate-600 hover:bg-slate-100 rounded-xl transition">Hủy</button>
                    <button type="submit" form="variant-form" class="px-4 py-2 bg-blue-600 text-white rounded-xl hover:bg-blue-700 transition font-medium">${isEdit ? 'Lưu thay đổi' : 'Thêm variant'}</button>
                </div>
            </div>
        </div>
    `;
}

export function renderDeleteConfirmModal(type, name) {
    const typeText = type === 'product' ? 'sản phẩm' : 'variant';
    return `
        <div class="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4" id="delete-modal">
            <div class="bg-white rounded-2xl shadow-xl w-full max-w-sm animate-fade-in">
                <div class="p-6 text-center">
                    <div class="w-16 h-16 mx-auto mb-4 bg-rose-100 text-rose-600 rounded-full flex items-center justify-center">
                        <svg class="w-8 h-8" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z"></path></svg>
                    </div>
                    <h3 class="text-lg font-semibold text-slate-800 mb-2">Xác nhận xóa</h3>
                    <p class="text-slate-600 mb-6">Bạn có chắc muốn xóa ${typeText} <strong>${name}</strong>?</p>
                    <div class="flex gap-3">
                        <button class="close-modal-btn flex-1 px-4 py-2 text-slate-600 bg-slate-100 hover:bg-slate-200 rounded-xl transition">Hủy</button>
                        <button class="confirm-delete-btn flex-1 px-4 py-2 bg-rose-600 text-white rounded-xl hover:bg-rose-700 transition font-medium">Xóa</button>
                    </div>
                </div>
            </div>
        </div>
    `;
}

export function renderLoading() {
    return `<tr><td colspan="10" class="px-4 py-12 text-center">
        <div class="inline-flex items-center gap-2 text-slate-500">
            <svg class="animate-spin w-5 h-5" fill="none" viewBox="0 0 24 24"><circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle><path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path></svg>
            <span>Đang tải...</span>
        </div>
    </td></tr>`;
}

export function renderSelectOptions(options, selectedValue = '') {
    return options.map(opt => `<option value="${opt.value}" ${opt.value === selectedValue ? 'selected' : ''}>${opt.label}</option>`).join('');
}
