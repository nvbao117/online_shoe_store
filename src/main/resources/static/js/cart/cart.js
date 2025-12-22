// Biến toàn cục
let curCartItemId = null;
let selVariantId = null;

// Hàm format tiền tệ
const formatMoney = (a) => a.toLocaleString('vi-VN') + '₫';
// Biến lưu trữ toàn bộ items
let allItems = [];

const loadCart = () => {
    CartAPI.getAll().then(items => {
        allItems = items || [];
        renderCartItems(allItems);

        // Xử lý logic Mua ngay sau khi render xong
        checkBuyNowParams();
        checkBuyAgainParams();
    });
};

const searchCart = () => {
    const term = document.getElementById('searchInput').value.toLowerCase().trim();
    if (!term) {
        renderCartItems(allItems);
        return;
    }
    const filtered = allItems.filter(i => i.productName.toLowerCase().includes(term));
    renderCartItems(filtered);
};

const renderCartItems = (items) => {
    const container = document.getElementById('cartItemsContainer');
    container.innerHTML = '';

    if (!items || items.length === 0) {
        container.innerHTML = '<p class="text-center text-gray-500 py-4">Không tìm thấy sản phẩm.</p>';
        calculateTotal();
        return;
    }

    items.forEach(item => {
        const html = `
        <div id="row-${item.cartItemId}" class="bg-white rounded shadow-sm border border-gray-100 p-4 grid grid-cols-1 md:grid-cols-12 gap-4 items-center hover:bg-blue-50/20 transition relative">
            <div class="md:col-span-5 flex items-center gap-4 w-full">
                <input type="checkbox" class="item-checkbox w-5 h-5 rounded text-blue-600 cursor-pointer"
                       data-id="${item.cartItemId}"
                       data-price="${item.price}"
                       data-qty="${item.quantity}"
                       data-pid="${item.productId}"
                       data-size="${item.size}"
                       onchange="calculateTotal()">

                <div class="flex gap-4 flex-1">
                    <img src="${item.imageUrl}" class="w-24 h-24 object-cover border border-gray-200 rounded-md">
                    <div class="flex flex-col justify-between py-1">
                        <h3 class="text-gray-800 font-medium line-clamp-2 text-base">${item.productName}</h3>
                        <div class="relative group cursor-pointer w-fit" onclick="openVariantModal('${item.productName}', '${item.productId}', '${item.cartItemId}')">
                            <div class="flex items-center gap-1 text-sm text-gray-500 bg-gray-100 px-3 py-1 rounded hover:bg-gray-200 border border-transparent hover:border-gray-300 transition">
                                <span>Phân loại: <b>Size ${item.size}, ${item.color}</b></span>
                                <i class="fa-solid fa-caret-down text-xs"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="md:col-span-2 text-center text-gray-600 font-medium">
                ${formatMoney(item.price)}
            </div>
            <div class="md:col-span-2 flex justify-center">
                <div class="flex items-center border border-gray-300 rounded-md bg-white">
                    <button onclick="updateQuantity('${item.cartItemId}', -1)" class="w-8 h-8 flex items-center justify-center hover:bg-gray-100 border-r text-gray-600">-</button>
                    <input type="number" id="qty-${item.cartItemId}" value="${item.quantity}" class="w-12 text-center text-sm h-8 font-semibold outline-none" readonly>
                    <button onclick="updateQuantity('${item.cartItemId}', 1)" class="w-8 h-8 flex items-center justify-center hover:bg-gray-100 border-l text-gray-600">+</button>
                </div>
            </div>
            <div class="md:col-span-2 text-center">
                <span class="text-blue-600 font-bold text-lg" id="total-${item.cartItemId}">${formatMoney(item.totalPrice)}</span>
            </div>
            <div class="md:col-span-1 text-center">
                <button onclick="deleteItem('${item.cartItemId}')" class="text-gray-400 hover:text-red-600 transition p-2 hover:bg-red-50 rounded-full"><i class="fa-regular fa-trash-can"></i></button>
            </div>
        </div>`;
        container.insertAdjacentHTML('beforeend', html);
    });

    // Tính lại tổng tiền sau khi render (chỉ tính những cái đang visible và checked, 
    // nhưng lưu ý: nếu đang filter thì những cái ẩn có được tính không? 
    // Logic calculateTotal hiện tại selectAll .item-checkbox:checked. 
    // Khi filter, các item ẩn bị xóa khỏi DOM nên sẽ KHÔNG được tính. Điều này là hợp lý cho UX tìm kiếm.)
    calculateTotal();
};

// --- 1. XỬ LÝ MUA NGAY (Logic cũ, dùng URL param) ---
const checkBuyNowParams = () => {
    const urlParams = new URLSearchParams(window.location.search);
    const buyNowId = urlParams.get('buyNowItem');
    const buyNowSize = urlParams.get('size');

    if (buyNowId) {
        let found = false;
        document.querySelectorAll('.item-checkbox').forEach(chk => {
            const pId = chk.getAttribute('data-pid');
            const pSize = chk.getAttribute('data-size');

            // Logic cũ: ID chính xác, Size lỏng
            if (String(pId) === String(buyNowId) && (!buyNowSize || String(pSize) == String(buyNowSize))) {
                chk.checked = true;
                found = true;
                highlightRow(chk);
            }
        });

        if (found) {
            calculateTotal();
            scrollToCart();
        }
    }
};

// --- 2. XỬ LÝ MUA LẠI (Logic mới, dùng LocalStorage) ---
const checkBuyAgainParams = () => {
    // 1. Lấy dữ liệu từ LocalStorage
    const stored = localStorage.getItem('cart_selected_items');
    if (!stored) return;

    let targets = [];
    try {
        targets = JSON.parse(stored);
        console.log("Load từ LocalStorage:", targets);

        // Xóa ngay để tránh load lại khi F5
        localStorage.removeItem('cart_selected_items');
    } catch (e) {
        console.error("Lỗi parse LocalStorage:", e);
        return;
    }

    if (!targets || targets.length === 0) return;

    let found = false;
    document.querySelectorAll('.item-checkbox').forEach(chk => {
        const rawPid = chk.getAttribute('data-pid');
        const rawSize = chk.getAttribute('data-size');

        // Normalize
        const pId = String(rawPid).trim().toLowerCase();
        const pSize = String(rawSize).trim().toLowerCase();

        // Check match trong list targets
        const isMatch = targets.some(t => {
            const tPid = String(t.productId || t.pid).trim().toLowerCase();
            const tSize = String(t.size).trim().toLowerCase();
            return tPid === pId && tSize === pSize;
        });

        if (isMatch) {
            chk.checked = true;
            found = true;
            highlightRow(chk);
        }
    });

    if (found) {
        calculateTotal();
        scrollToCart();
    }
};

// Helper: Hiệu ứng highlight
const highlightRow = (checkbox) => {
    const row = checkbox.closest('.bg-white');
    if (row) {
        row.style.transition = "background-color 0.5s";
        row.style.backgroundColor = "#e0f2fe";
        setTimeout(() => { row.style.backgroundColor = "#ffffff"; }, 1500);
    }
};

// Helper: Scroll
const scrollToCart = () => {
    const container = document.getElementById('cartItemsContainer');
    if (container) container.scrollIntoView({ behavior: 'smooth', block: 'start' });
};

document.addEventListener("DOMContentLoaded", function () {
    loadCart();
});

// --- CÁC HÀM XỬ LÝ GIAO DIỆN (Gọi qua CartAPI) ---

function toggleSelectAll(src) {
    const isChecked = src.checked;
    document.querySelectorAll('.item-checkbox').forEach(cb => cb.checked = isChecked);
    document.getElementById('selectAllTop').checked = isChecked;
    document.getElementById('selectAllBottom').checked = isChecked;
    calculateTotal();
}

function calculateTotal() {
    let totalMoney = 0, totalQty = 0;
    document.querySelectorAll('.item-checkbox:checked').forEach(cb => {
        const price = parseFloat(cb.getAttribute('data-price'));
        const qty = parseInt(cb.getAttribute('data-qty'));
        totalMoney += (price * qty);
        totalQty += qty;
    });

    const grandTotalEl = document.getElementById('grandTotalDisplay');
    const countEl = document.getElementById('countDisplay');

    if (grandTotalEl) grandTotalEl.innerText = formatMoney(totalMoney);
    if (countEl) countEl.innerText = totalQty;
}

function updateQuantity(id, change) {
    const inp = document.getElementById('qty-' + id);
    if (!inp) return;

    let newQty = parseInt(inp.value) + change;
    if (newQty < 1) return;

    // GỌI API TỪ FILE MỚI
    CartAPI.updateQuantity(id, newQty)
        .then(res => {
            if (res.ok) {
                inp.value = newQty;
                const cb = document.querySelector(`.item-checkbox[data-id="${id}"]`);
                if (cb) {
                    cb.setAttribute('data-qty', newQty);
                    const totalEl = document.getElementById('total-' + id);
                    if (totalEl) totalEl.innerText = formatMoney(parseFloat(cb.getAttribute('data-price')) * newQty);
                    calculateTotal();
                }
            }
        })
        .catch(err => console.error("Lỗi cập nhật số lượng:", err));
}

function deleteItem(id) {
    // 2. Gọi API xóa
    CartAPI.remove(id)
        .then(res => {
            if (res.ok) {
                window.location.reload();
            } else {
                console.error("Lỗi xóa sản phẩm (Server trả về lỗi):", res.status);
            }
        })
        .catch(err => {
            console.error("Lỗi kết nối:", err);
        });
}

function openVariantModal(name, pid, cid) {
    curCartItemId = cid;
    selVariantId = null;

    const modal = document.getElementById('variantModal');
    modal.classList.remove('hidden');
    modal.classList.add('flex');

    document.getElementById('modalProductName').innerText = name;
    const container = document.getElementById('variantOptions');
    container.innerHTML = '<p class="text-gray-400 text-xs italic">Đang tải phân loại...</p>';

    // GỌI API TỪ FILE MỚI
    CartAPI.getVariants(pid)
        .then(data => {
            container.innerHTML = '';
            if (!data || data.length === 0) {
                container.innerHTML = '<p class="text-red-500 text-xs">Không có phân loại khác.</p>';
                return;
            }
            data.forEach(v => {
                const b = document.createElement('button');
                b.className = 'v-btn px-3 py-1.5 border rounded hover:border-blue-500 transition text-sm font-medium';
                b.innerText = `Size ${v.size} - ${v.color}`;
                b.onclick = () => {
                    document.querySelectorAll('.v-btn').forEach(x => x.classList.remove('bg-blue-50', 'border-blue-600', 'text-blue-600'));
                    b.classList.add('bg-blue-50', 'border-blue-600', 'text-blue-600');
                    selVariantId = v.variantId;
                };
                container.appendChild(b);
            });
        })
        .catch(err => {
            container.innerHTML = '<p class="text-red-500 text-xs">Lỗi kết nối.</p>';
        });
}

function confirmChangeVariant() {
    if (!selVariantId) return alert("Vui lòng chọn 1 phân loại mới!");

    // GỌI API TỪ FILE MỚI
    CartAPI.updateVariant(curCartItemId, selVariantId)
        .then(res => {
            if (res.ok) window.location.reload();
            else alert("Lỗi khi đổi size!");
        });
}

function closeVariantModal() {
    document.getElementById('variantModal').classList.add('hidden');
    document.getElementById('variantModal').classList.remove('flex');
}

function submitCheckout() {
    const checked = document.querySelectorAll('.item-checkbox:checked');
    if (checked.length === 0) return alert("Vui lòng chọn ít nhất 1 sản phẩm!");

    const container = document.getElementById('hiddenIdContainer');
    container.innerHTML = '';

    checked.forEach(cb => {
        const inp = document.createElement('input');
        inp.type = 'hidden';
        inp.name = 'selectedItems';
        inp.value = cb.getAttribute('data-id');
        container.appendChild(inp);
    });

    document.getElementById('checkoutForm').submit();
}