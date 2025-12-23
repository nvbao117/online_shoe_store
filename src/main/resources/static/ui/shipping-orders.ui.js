export function renderShippingOrders(orders) {
    const container = document.querySelector('.order-tab-content[data-content="shipping"]');
    if (!container) return;

    if (orders.length === 0) {
        container.innerHTML = `
            <div class="flex flex-col items-center justify-center py-12 text-gray-500">
                <svg class="w-16 h-16 mb-4 text-gray-300" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                   <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 8h14M5 8a2 2 0 110-4h14a2 2 0 110 4M5 8v10a2 2 0 002 2h10a2 2 0 002-2V8m-9 4h4"></path>
                </svg>
                <p>Chưa có đơn hàng nào đang vận chuyển.</p>
            </div>
        `;
        return;
    }

    const html = orders.map(order => {
        const productHtml = order.items.map(item => `
            <div class="flex gap-4 mt-4 first:mt-0">
                <div class="w-20 h-20 flex-shrink-0">
                    <img src="${item.imageUrl || 'https://via.placeholder.com/80'}" 
                         class="w-full h-full object-cover rounded-lg border"
                         alt="${item.productName}" 
                         onerror="this.src='https://via.placeholder.com/80'"/>
                </div>
                <div class="flex-1 min-w-0">
                    <h4 class="font-medium text-gray-800 truncate" title="${item.productName}">
                        ${item.productName}
                    </h4>
                    <p class="text-xs text-gray-400 mt-1">
                        Phân loại: ${item.color} · Size ${item.size}
                    </p>
                    <p class="text-xs text-gray-400 mt-1">Số lượng: x${item.quantity}</p>
                </div>
                <div class="text-right">
                    <p class="text-blue-600 font-bold">${formatCurrency(item.price)}</p>
                </div>
            </div>
        `).join('<div class="border-t border-gray-50 my-3"></div>');

        return `
            <div class="order-item border rounded-xl p-4 md:p-6 hover:shadow-md transition-shadow bg-white">
                <!-- HEADER -->
                <div class="flex items-center justify-between pb-3 border-b border-gray-100">
                    <div class="text-sm text-gray-500">
                        Mã đơn: <span class="font-medium text-gray-800">#${order.orderId ? order.orderId.substring(0, 8) : 'N/A'}</span>
                        <span class="mx-2">|</span>
                        <span>${formatDate(order.createdAt)}</span>
                    </div>
                    <span class="text-orange-600 font-semibold text-sm uppercase">Đang vận chuyển</span>
                </div>

                <!-- PRODUCTS -->
                <div class="mt-4">
                    ${productHtml}
                </div>

                <!-- FOOTER -->
                <div class="flex flex-col md:flex-row items-center justify-between gap-4 mt-5 pt-4 border-t border-gray-100">
                    <div class="text-sm text-gray-500">
                        Tổng thanh toán:
                        <span class="text-lg font-bold text-blue-600 ml-1">
                            ${formatCurrency(order.finalAmount)}
                        </span>
                    </div>

                    <div class="flex gap-2 w-full md:w-auto">
                        <button class="btn-received flex-1 md:flex-none px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 text-sm font-medium transition"
                                data-order-id="${order.orderId}">
                            Đã nhận được hàng
                        </button>
                    </div>
                </div>
            </div>
        `;
    }).join('');

    container.innerHTML = html;
}

function formatCurrency(amount) {
    if (amount === undefined || amount === null) return '0đ';
    return new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(amount);
}

function formatDate(dateString) {
    if (!dateString) return '';
    const date = new Date(dateString);
    return date.toLocaleDateString('vi-VN') + ' ' + date.toLocaleTimeString('vi-VN', { hour: '2-digit', minute: '2-digit' });
}
