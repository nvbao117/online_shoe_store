// Biến toàn cục
let curCartItemId = null;
let selVariantId = null;

// Hàm format tiền tệ
const formatMoney = (a) => a.toLocaleString('vi-VN') + '₫';

document.addEventListener("DOMContentLoaded", function() {
    // 1. Logic "Mua ngay" - Tự động tích chọn từ URL
    const urlParams = new URLSearchParams(window.location.search);
    const buyNowId = urlParams.get('buyNowItem');
    const buyNowSize = urlParams.get('size');

    if (buyNowId) {
        const checkboxes = document.querySelectorAll('.item-checkbox');
        let found = false;

        checkboxes.forEach(chk => {
            const pId = chk.getAttribute('data-pid');
            const pSize = chk.getAttribute('data-size');

            // Logic so khớp: Nếu URL có size thì so cả size, không thì chỉ so ID
            const isMatch = (pId === buyNowId) && (!buyNowSize || pSize == buyNowSize);

            if (isMatch) {
                chk.checked = true;
                found = true;
                chk.scrollIntoView({ behavior: 'smooth', block: 'center' });

                // Hiệu ứng highlight
                const row = chk.closest('.bg-white');
                if(row) {
                    row.style.transition = "background-color 0.5s";
                    row.style.backgroundColor = "#e0f2fe";
                    setTimeout(() => { row.style.backgroundColor = "#ffffff"; }, 1000);
                }
            }
        });

        if(found) calculateTotal();
    } else {
        calculateTotal();
    }
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

    if(grandTotalEl) grandTotalEl.innerText = formatMoney(totalMoney);
    if(countEl) countEl.innerText = totalQty;
}

function updateQuantity(id, change) {
    const inp = document.getElementById('qty-' + id);
    if(!inp) return;

    let newQty = parseInt(inp.value) + change;
    if (newQty < 1) return;

    // GỌI API TỪ FILE MỚI
    CartAPI.updateQuantity(id, newQty)
        .then(res => {
            if (res.ok) {
                inp.value = newQty;
                const cb = document.querySelector(`.item-checkbox[data-id="${id}"]`);
                if(cb) {
                    cb.setAttribute('data-qty', newQty);
                    const totalEl = document.getElementById('total-' + id);
                    if(totalEl) totalEl.innerText = formatMoney(parseFloat(cb.getAttribute('data-price')) * newQty);
                    calculateTotal();
                }
            }
        })
        .catch(err => console.error("Lỗi cập nhật số lượng:", err));
}

function deleteItem(id) {
    if(!confirm('Xóa sản phẩm này khỏi giỏ hàng?')) return;

    // GỌI API TỪ FILE MỚI
    CartAPI.remove(id)
        .then(res => {
            if (res.ok) window.location.reload();
        })
        .catch(err => console.error("Lỗi xóa:", err));
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
            if(!data || data.length === 0) {
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