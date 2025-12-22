/**
 * CHECKOUT PAGE JAVASCRIPT - REST API VERSION
 */

// Store checkout data globally
let checkoutData = null;
// Currently selected shipping address (when user dùng địa chỉ đã lưu)
let currentAddress = null;
let baseSubtotal = 0;
let baseTotal = 0;
let appliedDiscount = 0;
let selectedVoucherCode = null;

document.addEventListener('DOMContentLoaded', function () {
    initMethodSelection();
    initFormValidation();
    initVoucherSelection();
});

/**
 * Load checkout data from REST API
 */
async function loadCheckoutData() {
    const loadingIndicator = document.getElementById('loadingIndicator');
    const checkoutContent = document.getElementById('checkoutContent');

    try {
        const response = await fetch('/api/checkout/data');

        if (response.status === 401) {
            window.location.href = '/login';
            return;
        }

        if (!response.ok) {
            const error = await response.json();
            throw new Error(error.error || 'Failed to load checkout data');
        }

        checkoutData = await response.json();

        // Khởi tạo địa chỉ đang được chọn (mặc định là địa chỉ default nếu có)
        currentAddress = checkoutData.defaultAddress || null;

        // Populate UI with data
        populateUserInfo(checkoutData.user);
        populateAddresses(checkoutData.addresses, checkoutData.defaultAddress);
        populateCartItems(checkoutData.cartItems);
        populatePriceSummary(checkoutData.subtotal, checkoutData.total);
        updateVoucherList();

        // Pre-fill form with default address and user email
        if (checkoutData.defaultAddress) {
            prefillFormWithAddress(checkoutData.defaultAddress, checkoutData.user.email);
        } else {
            // No default address, prefill email from user
            const emailInput = document.getElementById('email');
            if (emailInput) emailInput.value = checkoutData.user.email || '';
        }

        // Setup form behavior (confirm default btn, edit mode toggle)
        setupFormBehavior(!!checkoutData.defaultAddress, checkoutData.user.email);

        // Load Vietnam address dropdowns
        await initAddressDropdowns();

        // Hide loading, show content
        if (loadingIndicator) loadingIndicator.style.display = 'none';
        if (checkoutContent) checkoutContent.style.display = 'grid';

    } catch (error) {
        console.error('Error loading checkout data:', error);
        if (loadingIndicator) {
            loadingIndicator.innerHTML = `
                <div class="alert alert-danger">
                    <i class="bi bi-exclamation-triangle"></i>
                    ${error.message || 'Không thể tải dữ liệu. Vui lòng thử lại.'}
                </div>
                <a href="/templates/cart" class="btn btn-outline-primary">Quay lại giỏ hàng</a>
            `;
        }
    }
}

/**
 * Setup form behavior for default address flow
 */
function setupFormBehavior(hasSavedAddress, userEmail) {
    const confirmDefaultBtn = document.getElementById('confirmDefaultBtn');
    const cancelEditBtn = document.getElementById('cancelEditBtn');
    const editAddressBtn = document.getElementById('editAddressBtn');

    // Confirm default address button
    if (confirmDefaultBtn && hasSavedAddress) {
        confirmDefaultBtn.addEventListener('click', function () {
            // Use currently selected saved address for checkout (email from user)
            if (!currentAddress) {
                alert('Vui lòng chọn hoặc nhập địa chỉ giao hàng.');
                return;
            }

            const shippingData = {
                fullName: currentAddress.recipientName || '',
                email: userEmail || '',
                phone: currentAddress.phone || '',
                address: currentAddress.detail || '',
                city: currentAddress.province || '',
                district: currentAddress.district || '',
                ward: currentAddress.ward || '',
                shippingType: 'home'
            };

            sessionStorage.setItem('checkoutShippingData', JSON.stringify(shippingData));
            window.location.href = '/checkout/step2';
        });
    }

    // Cancel edit button - return to using default
    if (cancelEditBtn) {
        cancelEditBtn.addEventListener('click', function () {
            const editSection = document.getElementById('editAddressSection');
            const defaultActions = document.getElementById('defaultAddressActions');
            const defaultSection = document.getElementById('defaultAddressSection');

            if (editSection) editSection.style.display = 'none';
            if (defaultActions) defaultActions.style.display = 'flex';
            if (defaultSection) defaultSection.style.display = 'block';
            this.style.display = 'none';
        });
    }

    // Edit/enter another address manually
    if (editAddressBtn) {
        editAddressBtn.addEventListener('click', function () {
            const editSection = document.getElementById('editAddressSection');
            const defaultActions = document.getElementById('defaultAddressActions');
            const defaultSection = document.getElementById('defaultAddressSection');
            const cancelEditBtnEl = document.getElementById('cancelEditBtn');

            if (editSection) editSection.style.display = 'block';
            if (defaultActions) defaultActions.style.display = 'none';
            if (defaultSection) defaultSection.style.display = 'none';
            if (cancelEditBtnEl) cancelEditBtnEl.style.display = 'block';

            // Nếu đang có currentAddress đã chọn, đồng bộ form với địa chỉ đó
            if (currentAddress) {
                const addressCards = document.querySelectorAll('.address-card-item');
                const targetCard = Array.from(addressCards).find(card => card.dataset.id === currentAddress.id);
                if (targetCard) {
                    selectAddress(targetCard);
                }
            }
        });
    }
}

function populateUserInfo(user) {
    const userName = document.getElementById('userName');
    const userEmail = document.getElementById('userEmail');

    if (userName) userName.textContent = user.name || 'Khách hàng';
    if (userEmail) userEmail.textContent = user.email || '';
}

function populateAddresses(addresses, defaultAddress) {
    const defaultSection = document.getElementById('defaultAddressSection');
    const defaultCard = document.getElementById('defaultAddressCard');
    const noAddressHint = document.getElementById('noAddressHint');
    const addressList = document.getElementById('addressList');

    if (defaultAddress) {
        // Show default (hoặc địa chỉ đang chọn) ở khu vực "Địa chỉ giao hàng"
        if (defaultSection) defaultSection.style.display = 'block';
        if (noAddressHint) noAddressHint.style.display = 'none';

        if (defaultCard) {
            renderSelectedAddress(defaultCard, defaultAddress);
        }
    } else {
        if (defaultSection) defaultSection.style.display = 'none';
        if (noAddressHint) noAddressHint.style.display = 'block';
    }

    // Control form visibility
    const editSection = document.getElementById('editAddressSection');
    const defaultActions = document.getElementById('defaultAddressActions');

    if (defaultAddress) {
        // Has default address - hide form, show default actions
        if (editSection) editSection.style.display = 'none';
        if (defaultActions) defaultActions.style.display = 'flex';
    } else {
        // No default - show form
        if (editSection) editSection.style.display = 'block';
        if (defaultActions) defaultActions.style.display = 'none';
    }

    // Populate address list in modal
    if (addressList && addresses) {
        // Lọc chỉ lấy các địa chỉ đã lưu của user (không lấy địa chỉ từ các đơn hàng cũ)
        // Giả sử mỗi địa chỉ có thuộc tính isSavedAddress, nếu không có thì chỉ lấy các địa chỉ không trùng lặp id
        const uniqueAddresses = [];
        const seen = new Set();
        addresses.forEach(addr => {
            if (addr.id && !seen.has(addr.id)) {
                uniqueAddresses.push(addr);
                seen.add(addr.id);
            }
        });
        addressList.innerHTML = uniqueAddresses.map(addr => `
            <div class="address-card-item ${addr.isDefault ? 'selected' : ''}"
                 data-id="${addr.id}"
                 data-recipient="${addr.recipientName || ''}"
                 data-phone="${addr.phone || ''}"
                 data-detail="${addr.detail || ''}"
                 data-province="${addr.province || ''}"
                 data-district="${addr.district || ''}"
                 data-ward="${addr.ward || ''}">
                <div class="d-flex justify-content-between align-items-start">
                    <div onclick="chooseAddressForOrder(this.closest('.address-card-item'))" style="cursor:pointer; flex:1">
                        <strong>${addr.recipientName || ''}</strong>
                        <span class="text-muted ms-2">${addr.phone || ''}</span>
                        <div class="small text-muted mt-1">
                            ${addr.detail || ''}, ${addr.ward || ''}, ${addr.district || ''}, ${addr.province || ''}
                        </div>
                    </div>
                    <div class="d-flex flex-column align-items-end gap-1">
                        ${addr.isDefault ? '<span class="badge bg-danger">Mặc định</span>' :
                `<button type="button" class="btn btn-sm btn-outline-secondary" onclick="setDefaultAddress('${addr.id}')">Đặt mặc định</button>`}
                    </div>
                </div>
            </div>
        `).join('');
    }
}

// Render thông tin địa chỉ đang được chọn vào thẻ card hiển thị bên ngoài
function renderSelectedAddress(cardElement, address) {
    if (!cardElement || !address) return;

    cardElement.innerHTML = `
        <div class="d-flex align-items-center gap-2 mb-1">
            <strong>${address.recipientName || ''}</strong>
            <span class="text-muted">|</span>
            <span>${address.phone || ''}</span>
            ${address.isDefault ? '<span class="badge bg-danger">Mặc định</span>' : ''}
        </div>
        <div class="text-muted small">
            ${address.detail || ''}, ${address.ward || ''}, ${address.district || ''}, ${address.province || ''}
        </div>
    `;
}

function populateCartItems(cartItems) {
    const orderItemsContainer = document.getElementById('orderItems');
    if (!orderItemsContainer || !cartItems) return;

    orderItemsContainer.innerHTML = cartItems.map(item => {
        // Xử lý đường dẫn ảnh: nếu có src/data/images/products thì chuyển thành /images/products
        let imgUrl = item.imageUrl || '';
        if (imgUrl.startsWith('src/data/images/products/')) {
            imgUrl = imgUrl.replace('src/data', '');
        }
        if (!imgUrl || imgUrl === 'null') {
            imgUrl = '/images/logo-shop/favicon.png';
        }
        return `
        <div class="order-item" style="display: flex; gap: 10px; align-items: center; padding-bottom: 12px; border-bottom: 1px solid #E5E7EB;">
            <div class="item-image">
                <img src="${imgUrl}" alt="${item.productName || ''}">
            </div>
            <div class="item-details" style="flex: 1; min-width: 0; display: flex; flex-direction: column;">
                <div style="display: flex; align-items: center; justify-content: space-between;">
                    <span class="item-name" style="font-size: 13px; font-weight: 500;">${item.productName || ''}</span>
                    <span class="item-qty" style="font-size: 12px; color: #6B7280; margin-left: 8px;">x${item.quantity || 1}</span>
                    <span class="item-price" style="font-size: 13px; font-weight: 600; color: #1F2937; white-space: nowrap; margin-left: 12px;">${formatPrice(item.totalPrice)}</span>
                </div>
                <div class="item-variant" style="font-size: 11px; color: #6B7280;">${item.colorName || ''} / ${item.sizeName || ''}</div>
            </div>
        </div>
        `;
    }).join('');
}

function populatePriceSummary(subtotal, total) {
    const subtotalEl = document.getElementById('subtotal');
    const totalEl = document.getElementById('total');
    const discountRow = document.getElementById('discountRow');
    const discountAmountEl = document.getElementById('discountAmount');

    baseSubtotal = Number(subtotal) || 0;
    baseTotal = Number(total) || baseSubtotal;
    appliedDiscount = 0;
    selectedVoucherCode = null;

    if (subtotalEl) subtotalEl.textContent = formatPrice(baseSubtotal);
    if (totalEl) totalEl.textContent = formatPrice(baseTotal);
    if (discountRow) discountRow.hidden = true;
    if (discountAmountEl) discountAmountEl.textContent = '-0đ';
}

function prefillFormWithAddress(address, userEmail) {
    if (!address) return;

    document.getElementById('fullName')?.setAttribute('value', address.recipientName || '');
    document.getElementById('email')?.setAttribute('value', userEmail || '');
    document.getElementById('phone')?.setAttribute('value', address.phone || '');
    document.getElementById('address')?.setAttribute('value', address.detail || '');

    // Store default values for dropdown selection
    const citySelect = document.getElementById('city');
    const districtSelect = document.getElementById('district');
    const wardSelect = document.getElementById('ward');

    if (citySelect) citySelect.dataset.defaultProvince = address.province || '';
    if (districtSelect) districtSelect.dataset.defaultDistrict = address.district || '';
    if (wardSelect) wardSelect.dataset.defaultWard = address.ward || '';
}

function formatPrice(price) {
    if (!price) return '0đ';
    return new Intl.NumberFormat('vi-VN').format(price) + 'đ';
}

/**
 * Vietnamese Address API Integration
 * Using provinces.open-api.vn for province/district/ward data
 */
const API_BASE = 'https://provinces.open-api.vn/api';

async function initAddressDropdowns() {
    const citySelect = document.querySelector('select[name="city"]');
    const districtSelect = document.querySelector('select[name="district"]');
    const wardSelect = document.querySelector('select[name="ward"]');

    if (!citySelect || !districtSelect || !wardSelect) return;

    // Get default values from data attributes
    const defaultProvince = citySelect.dataset.defaultProvince;
    const defaultDistrict = districtSelect.dataset.defaultDistrict;
    const defaultWard = wardSelect.dataset.defaultWard;

    // Load provinces
    try {
        const response = await fetch(`${API_BASE}/p/`);
        const provinces = await response.json();

        citySelect.innerHTML = '<option value="">Chọn tỉnh thành</option>';
        provinces.forEach(province => {
            const option = document.createElement('option');
            option.value = province.name;
            option.dataset.code = province.code;
            option.textContent = province.name;
            // Auto-select if matches default
            if (defaultProvince && province.name === defaultProvince) {
                option.selected = true;
            }
            citySelect.appendChild(option);
        });

        // If there's a default province, trigger change to load districts
        if (defaultProvince) {
            await loadDistricts(citySelect, districtSelect, wardSelect, defaultDistrict, defaultWard);
        }
    } catch (error) {
        console.error('Failed to load provinces:', error);
    }

    // When province changes, load districts
    citySelect.addEventListener('change', async function () {
        await loadDistricts(this, districtSelect, wardSelect, null, null);
    });

    // When district changes, load wards
    districtSelect.addEventListener('change', async function () {
        await loadWards(this, wardSelect, null);
    });
}

async function loadDistricts(citySelect, districtSelect, wardSelect, defaultDistrict, defaultWard) {
    const selectedOption = citySelect.options[citySelect.selectedIndex];
    const provinceCode = selectedOption.dataset.code;

    // Reset district and ward
    districtSelect.innerHTML = '<option value="">Chọn quận/huyện</option>';
    wardSelect.innerHTML = '<option value="">Chọn phường/xã</option>';

    if (!provinceCode) return;

    try {
        const response = await fetch(`${API_BASE}/p/${provinceCode}?depth=2`);
        const data = await response.json();

        data.districts.forEach(district => {
            const option = document.createElement('option');
            option.value = district.name;
            option.dataset.code = district.code;
            option.textContent = district.name;
            // Auto-select if matches default
            if (defaultDistrict && district.name === defaultDistrict) {
                option.selected = true;
            }
            districtSelect.appendChild(option);
        });

        // If there's a default district, trigger load wards
        if (defaultDistrict) {
            await loadWards(districtSelect, wardSelect, defaultWard);
        }
    } catch (error) {
        console.error('Failed to load districts:', error);
    }
}

async function loadWards(districtSelect, wardSelect, defaultWard) {
    const selectedOption = districtSelect.options[districtSelect.selectedIndex];
    const districtCode = selectedOption.dataset.code;

    // Reset ward
    wardSelect.innerHTML = '<option value="">Chọn phường/xã</option>';

    if (!districtCode) return;

    try {
        const response = await fetch(`${API_BASE}/d/${districtCode}?depth=2`);
        const data = await response.json();

        data.wards.forEach(ward => {
            const option = document.createElement('option');
            option.value = ward.name;
            option.textContent = ward.name;
            // Auto-select if matches default
            if (defaultWard && ward.name === defaultWard) {
                option.selected = true;
            }
            wardSelect.appendChild(option);
        });
    } catch (error) {
        console.error('Failed to load wards:', error);
    }
}

function initMethodSelection() {
    const methodOptions = document.querySelectorAll('.method-option');

    methodOptions.forEach(option => {
        option.addEventListener('click', function () {
            const container = this.closest('.shipping-methods, .payment-methods');
            if (container) {
                container.querySelectorAll('.method-option').forEach(opt => {
                    opt.classList.remove('active');
                });
                this.classList.add('active');
                const radio = this.querySelector('input[type="radio"]');
                if (radio) radio.checked = true;
            }
        });
    });
}

function initFormValidation() {
    const form = document.getElementById('shippingForm');
    if (form) {
        form.addEventListener('submit', function (e) {
            e.preventDefault();

            const inputs = form.querySelectorAll('[required]');
            let isValid = true;

            inputs.forEach(input => {
                if (!input.value.trim()) {
                    isValid = false;
                    input.classList.add('is-invalid');
                } else {
                    input.classList.remove('is-invalid');
                }
            });

            if (!isValid) {
                alert('Vui lòng điền đầy đủ thông tin!');
                return;
            }

            // Collect form data
            const shippingData = {
                fullName: document.getElementById('fullName')?.value || '',
                email: document.getElementById('email')?.value || '',
                phone: document.getElementById('phone')?.value || '',
                address: document.getElementById('address')?.value || '',
                city: document.getElementById('city')?.value || '',
                district: document.getElementById('district')?.value || '',
                ward: document.getElementById('ward')?.value || '',
                shippingType: document.querySelector('input[name="shippingType"]:checked')?.value || 'home'
            };

            // Save to sessionStorage
            sessionStorage.setItem('checkoutShippingData', JSON.stringify(shippingData));

            // Navigate to step 2
            window.location.href = '/checkout/step2';
        });
    }
}

function initVoucherSelection() {
    const voucherInput = document.getElementById('voucherInput');
    const voucherList = document.getElementById('voucherList');
    const applyButton = document.getElementById('applyVoucherBtn');

    if (voucherInput) {
        voucherInput.addEventListener('click', async () => {
            await updateVoucherList();
            toggleVoucherList(true);
        });
    }

    if (applyButton) {
        applyButton.addEventListener('click', () => {
            applySelectedVoucher();
        });
    }

    document.addEventListener('click', (event) => {
        const wrapper = document.querySelector('.coupon-input-wrapper');
        if (!wrapper || wrapper.contains(event.target)) {
            return;
        }
        toggleVoucherList(false);
    });

    if (voucherList) {
        voucherList.addEventListener('click', (event) => {
            const item = event.target.closest('.voucher-item');
            if (!item || item.classList.contains('voucher-item-disabled')) return;
            const code = item.dataset.code;
            if (!code) return;
            selectedVoucherCode = code;
            if (voucherInput) voucherInput.value = code;
            toggleVoucherList(false);
            showVoucherMessage('');
        });
    }
}

async function updateVoucherList() {
    const voucherList = document.getElementById('voucherList');
    if (!voucherList) return;

    try {
        voucherList.innerHTML = '<div class="voucher-item">Đang tải voucher...</div>';
        const productIds = getCheckoutProductIds();
        const query = new URLSearchParams({ subtotal: baseSubtotal });
        productIds.forEach(id => query.append('productIds', id));
        const res = await fetch(`/api/vouchers/valid?${query.toString()}`);
        if (!res.ok) {
            throw new Error('Không thể tải voucher');
        }
        const vouchers = await res.json();
        renderVoucherList(vouchers);
    } catch (error) {
        voucherList.innerHTML = '<div class="voucher-item voucher-item-disabled">Không thể tải voucher</div>';
    }
}

function renderVoucherList(vouchers) {
    const voucherList = document.getElementById('voucherList');
    if (!voucherList) return;

    if (!Array.isArray(vouchers) || vouchers.length === 0) {
        voucherList.innerHTML = '<div class="voucher-item voucher-item-disabled">Không có voucher phù hợp</div>';
        return;
    }

    voucherList.innerHTML = vouchers.map(voucher => `
        <div class="voucher-item" data-code="${voucher.code}">
            <div class="voucher-item-code">${voucher.code} • ${formatVoucherLabel(voucher)}</div>
            <div class="voucher-item-desc">${voucher.description || 'Voucher áp dụng cho đơn hàng'}</div>
        </div>
    `).join('');
}

function formatVoucherLabel(voucher) {
    if (!voucher) return '';
    const value = voucher.discountValue || 0;
    if (voucher.discountType === 'PERCENT') {
        const maxText = voucher.maxDiscountAmount ? ` (tối đa ${formatPrice(voucher.maxDiscountAmount)})` : '';
        return `Giảm ${value}%${maxText}`;
    }
    return `Giảm ${formatPrice(value)}`;
}

function toggleVoucherList(shouldShow) {
    const voucherList = document.getElementById('voucherList');
    if (!voucherList) return;
    voucherList.hidden = !shouldShow;
}

async function applySelectedVoucher() {
    const voucherInput = document.getElementById('voucherInput');
    const voucherCode = selectedVoucherCode || voucherInput?.value?.trim();
    if (!voucherCode) {
        showVoucherMessage('Vui lòng chọn mã giảm giá.');
        return;
    }

    try {
        const res = await fetch('/api/vouchers/apply', {
            method: 'POST',
            headers: {'Content-Type': 'application/json'},
            body: JSON.stringify({
                voucherCode,
                subtotal: baseSubtotal,
                items: getVoucherApplyItems()
            })
        });
        const body = await res.json().catch(() => ({}));
        if (!res.ok) {
            throw new Error(body.message || 'Không thể áp dụng voucher');
        }

        appliedDiscount = Number(body.discountAmount) || 0;
        persistVoucherSelection(voucherCode, body);
        updateTotalsAfterDiscount(body);
        showVoucherMessage('Áp dụng voucher thành công.', true);
    } catch (error) {
        appliedDiscount = 0;
        sessionStorage.removeItem('checkoutVoucherData');
        updateTotalsAfterDiscount({ discountAmount: 0, finalTotal: baseTotal });
        showVoucherMessage(error.message || 'Không thể áp dụng voucher');
    }
}

function updateTotalsAfterDiscount(payload) {
    const discountRow = document.getElementById('discountRow');
    const discountAmountEl = document.getElementById('discountAmount');
    const totalEl = document.getElementById('total');

    const discountAmount = Number(payload.discountAmount) || 0;
    const finalTotal = payload.finalTotal !== undefined ? Number(payload.finalTotal) : baseTotal;

    if (discountRow) discountRow.hidden = discountAmount <= 0;
    if (discountAmountEl) discountAmountEl.textContent = `-${formatPrice(discountAmount)}`;
    if (totalEl) totalEl.textContent = formatPrice(finalTotal);
}

function showVoucherMessage(message, isSuccess = false) {
    const voucherMessage = document.getElementById('voucherMessage');
    if (!voucherMessage) return;
    if (!message) {
        voucherMessage.hidden = true;
        voucherMessage.textContent = '';
        return;
    }
    voucherMessage.hidden = false;
    voucherMessage.textContent = message;
    voucherMessage.style.color = isSuccess ? 'var(--success)' : 'var(--danger)';
}

function persistVoucherSelection(voucherCode, payload) {
    if (!voucherCode) return;
    const discountAmount = Number(payload.discountAmount) || 0;
    const finalTotal = payload.finalTotal !== undefined ? Number(payload.finalTotal) : baseTotal;
    const data = {
        voucherCode,
        discountAmount,
        finalTotal,
        subtotal: baseSubtotal
    };
    sessionStorage.setItem('checkoutVoucherData', JSON.stringify(data));
    localStorage.setItem('checkoutVoucherData', JSON.stringify(data));
}

function getCheckoutProductIds() {
    if (!checkoutData?.cartItems) return [];
    return checkoutData.cartItems
        .map(item => item.productId)
        .filter(Boolean);
}

function getVoucherApplyItems() {
    if (!checkoutData?.cartItems) return [];
    return checkoutData.cartItems.map(item => ({
        productId: item.productId,
        lineTotal: item.totalPrice
    }));
}

/**
 * VNPay Payment Loading Indicator
 * Hiển thị loading khi chuyển hướng đến VNPay
 */
function initVNPayLoading() {
    document.querySelector('form[action*="place-order"]')?.addEventListener('submit', function (e) {
        const paymentMethod = document.querySelector('input[name="paymentMethod"]:checked')?.value;

        if (paymentMethod === 'vnpay') {
            const btn = document.querySelector('.btn-continue');
            if (btn) {
                btn.innerHTML = '<span class="spinner-border spinner-border-sm me-2"></span>Đang chuyển hướng...';
                btn.disabled = true;
            }
        }
    });
}

// Gọi hàm init VNPay loading
document.addEventListener('DOMContentLoaded', function () {
    initVNPayLoading();
});

/**
 * Select saved address and fill form
 */
function selectAddress(element) {
    // Remove selected class from all address cards
    document.querySelectorAll('.address-card-item').forEach(card => {
        card.classList.remove('selected');
    });

    // Add selected class to clicked card
    element.classList.add('selected');

    // Get data from clicked address
    const recipient = element.dataset.recipient;
    const phone = element.dataset.phone;
    const detail = element.dataset.detail;
    const province = element.dataset.province;
    const district = element.dataset.district;
    const ward = element.dataset.ward;

    // Fill form fields
    const fullNameInput = document.querySelector('input[name="fullName"]');
    const phoneInput = document.querySelector('input[name="phone"]');
    const addressInput = document.querySelector('input[name="address"]');
    const citySelect = document.querySelector('select[name="city"]');
    const districtSelect = document.querySelector('select[name="district"]');
    const wardSelect = document.querySelector('select[name="ward"]');

    if (fullNameInput) fullNameInput.value = recipient || '';
    if (phoneInput) phoneInput.value = phone || '';
    if (addressInput) addressInput.value = detail || '';

    // Update dropdowns with selected values
    if (citySelect && province) {
        // Find and select matching province option
        for (let option of citySelect.options) {
            if (option.value === province) {
                option.selected = true;
                // Trigger load districts with the selected address defaults
                loadDistricts(citySelect, districtSelect, wardSelect, district, ward);
                break;
            }
        }
    }
}

/**
 * Select address for THIS ORDER only (does not set as default)
 * Fills the form and switches to edit mode
 */
function chooseAddressForOrder(element) {
    if (!element) return;

    // Cập nhật lớp selected trong danh sách
    document.querySelectorAll('.address-card-item').forEach(card => {
        card.classList.remove('selected');
    });
    element.classList.add('selected');

    // Tạo object địa chỉ hiện tại từ data-* của card
    currentAddress = {
        id: element.dataset.id,
        recipientName: element.dataset.recipient || '',
        phone: element.dataset.phone || '',
        detail: element.dataset.detail || '',
        province: element.dataset.province || '',
        district: element.dataset.district || '',
        ward: element.dataset.ward || '',
        isDefault: element.classList.contains('default') || false
    };

    // Cập nhật card hiển thị "Địa chỉ giao hàng"
    const defaultSection = document.getElementById('defaultAddressSection');
    const defaultCard = document.getElementById('defaultAddressCard');
    const noAddressHint = document.getElementById('noAddressHint');
    const editSection = document.getElementById('editAddressSection');
    const defaultActions = document.getElementById('defaultAddressActions');

    if (defaultSection) defaultSection.style.display = 'block';
    if (noAddressHint) noAddressHint.style.display = 'none';
    if (defaultCard) renderSelectedAddress(defaultCard, currentAddress);

    // Đồng bộ form ẩn với địa chỉ đang chọn (để khi người dùng bấm "Nhập địa chỉ khác" sẽ thấy sẵn dữ liệu)
    selectAddress(element);

    // Khi đã chọn 1 địa chỉ trong danh sách, ưu tiên dùng nó thay vì form
    if (editSection) editSection.style.display = 'none';
    if (defaultActions) defaultActions.style.display = 'flex';

    // Đóng modal
    const modalElement = document.getElementById('addressModal');
    if (modalElement) {
        const modalInstance = bootstrap.Modal.getInstance(modalElement);
        if (modalInstance) modalInstance.hide();
    }
}

/**
 * Set an address as default (calls API)
 */
async function setDefaultAddress(addressId) {
    try {
        const response = await fetch(`/api/address/set-default/${addressId}`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            }
        });

        if (!response.ok) {
            throw new Error('Failed to set default address');
        }

        // Reload page to show updated default address
        window.location.reload();

    } catch (error) {
        console.error('Error setting default address:', error);
        alert('Không thể đặt địa chỉ mặc định. Vui lòng thử lại.');
    }
}
