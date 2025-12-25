const AdminOrderPage = {
    API_URL: '/api/admin/orders',

    init() {
        this.bindFilterEvents();
        this.loadOrders();
    },

    bindFilterEvents() {
        // Search button
        const btnSearch = document.getElementById('btn-search');
        if (btnSearch) {
            btnSearch.addEventListener('click', () => this.loadOrders());
        }

        // Reset button
        const btnReset = document.getElementById('btn-reset');
        if (btnReset) {
            btnReset.addEventListener('click', () => this.resetFilters());
        }

        // Enter key on search input
        const searchInput = document.getElementById('search-keyword');
        if (searchInput) {
            searchInput.addEventListener('keypress', (e) => {
                if (e.key === 'Enter') {
                    this.loadOrders();
                }
            });
        }

        // Auto search when filters change
        const filterStatus = document.getElementById('filter-status');
        const filterPaymentStatus = document.getElementById('filter-payment-status');
        const filterPaymentMethod = document.getElementById('filter-payment-method');

        if (filterStatus) filterStatus.addEventListener('change', () => this.loadOrders());
        if (filterPaymentStatus) filterPaymentStatus.addEventListener('change', () => this.loadOrders());
        if (filterPaymentMethod) filterPaymentMethod.addEventListener('change', () => this.loadOrders());
    },

    resetFilters() {
        document.getElementById('search-keyword').value = '';
        document.getElementById('filter-status').value = '';
        document.getElementById('filter-payment-status').value = '';
        document.getElementById('filter-payment-method').value = '';
        this.loadOrders();
    },

    getFilterParams() {
        const keyword = document.getElementById('search-keyword')?.value || '';
        const status = document.getElementById('filter-status')?.value || '';
        const paymentStatus = document.getElementById('filter-payment-status')?.value || '';
        const paymentMethod = document.getElementById('filter-payment-method')?.value || '';

        const params = new URLSearchParams();
        if (keyword.trim()) params.append('keyword', keyword.trim());
        if (status) params.append('status', status);
        if (paymentStatus) params.append('paymentStatus', paymentStatus);
        if (paymentMethod) params.append('paymentMethod', paymentMethod);

        return params.toString();
    },

    async loadOrders() {
        try {
            const queryString = this.getFilterParams();
            const url = queryString ? `${this.API_URL}?${queryString}` : this.API_URL;
            const res = await fetch(url);
            if (res.ok) {
                const data = await res.json();
                this.render(data);
            } else {
                console.error("Failed to load orders");
            }
        } catch (e) {
            console.error("Error loading orders", e);
        }
    },

    // State
    modal: document.getElementById('order-modal'),

    render(orders) {
        const tbody = document.getElementById('order-rows');
        if (!tbody) return;
        tbody.innerHTML = '';

        orders.forEach(order => {
            const tr = document.createElement('tr');
            tr.className = 'hover:bg-slate-50 transition';

            // Status Badge Logic
            let statusClass = 'bg-gray-100 text-gray-600';
            let statusText = order.status;
            if (order.status === 'CONFIRMED') {
                statusClass = 'bg-blue-100 text-blue-700';
                statusText = 'Đã xác nhận';
            } else if (order.status === 'PENDING') {
                statusClass = 'bg-yellow-100 text-yellow-700';
                statusText = 'Chờ xác nhận';
            } else if (['SHIPPED', 'IN_TRANSIT', 'OUT_FOR_DELIVERY'].includes(order.status)) {
                statusClass = 'bg-orange-100 text-orange-700';
                statusText = 'Vận chuyển';
            } else if (order.status === 'CANCELLED') {
                statusClass = 'bg-red-100 text-red-700';
                statusText = 'Đã hủy';
            } else if (order.status === 'COMPLETED' || order.status === 'DELIVERED') {
                statusClass = 'bg-green-100 text-green-700';
                statusText = 'Hoàn thành';
            }

            // Payment Status Logic
            const paymentStatusHtml = order.isPaid
                ? '<span class="px-2 py-1 rounded-full bg-green-100 text-green-700 text-xs font-semibold">Đã thanh toán</span>'
                : '<span class="px-2 py-1 rounded-full bg-red-100 text-red-700 text-xs font-semibold">Chưa thanh toán</span>';

            // Format Currency
            const totalAmount = this.formatCurrency(order.totalAmount);

            // Action Buttons
            let actionsHtml = `<div class="flex justify-end gap-2">`;

            // View Detail Button
            actionsHtml += `
                <button class="btn-view p-1.5 text-slate-600 hover:bg-slate-100 rounded" title="Xem chi tiết" data-id="${order.orderId}">
                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"></path><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z"></path></svg>
                </button>`;

            // Only show Confirm if PENDING
            if (order.status === 'PENDING') {
                actionsHtml += `
                    <button class="btn-confirm p-1.5 text-blue-600 hover:bg-blue-50 rounded" title="Xác nhận" data-id="${order.orderId}">
                       <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path></svg>
                    </button>`;
            }

            // Show Mark as Delivered if SHIPPED, IN_TRANSIT, or OUT_FOR_DELIVERY
            if (['SHIPPED', 'IN_TRANSIT', 'OUT_FOR_DELIVERY'].includes(order.status)) {
                actionsHtml += `
                    <button class="btn-delivered p-1.5 text-green-600 hover:bg-green-50 rounded" title="Xác nhận đã giao hàng" data-id="${order.orderId}">
                       <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                    </button>`;
            }

            actionsHtml += `
                <button class="btn-delete p-1.5 text-red-600 hover:bg-red-50 rounded" title="Xoá" data-id="${order.orderId}">
                   <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"></path></svg>
                </button>
            </div>`;

            tr.innerHTML = `
                <td class="px-4 py-3 font-medium text-slate-800" title="${order.orderId}">#${order.orderId.substring(0, 8)}...</td>
                <td class="px-4 py-3 text-slate-600">${order.orderDate}</td>
                <td class="px-4 py-3 text-slate-800 font-medium">${order.customerName}</td>
                 <td class="px-4 py-3 text-slate-600 truncate max-w-xs" title="${order.products}">${order.products}</td>
                <td class="px-4 py-3 font-semibold text-slate-800">${totalAmount}</td>
                <td class="px-4 py-3 text-slate-600 text-center">${order.paymentMethod}</td>
                <td class="px-4 py-3 text-center">${paymentStatusHtml}</td>
                <td class="px-4 py-3 text-center">
                    <span class="px-2 py-1 rounded-full text-xs font-semibold ${statusClass}">${statusText}</span>
                </td>
                <td class="px-4 py-3">${actionsHtml}</td>
            `;

            tbody.appendChild(tr);
        });

        this.bindEvents();
    },

    bindEvents() {
        // View
        document.querySelectorAll('.btn-view').forEach(btn => {
            btn.addEventListener('click', (e) => {
                const id = e.currentTarget.dataset.id;
                this.loadOrderDetail(id);
            });
        });

        // Close Modal
        document.querySelectorAll('.btn-close-modal').forEach(btn => {
            btn.addEventListener('click', () => {
                this.modal.classList.add('hidden');
            });
        });
        // Backdrop click
        const backdrop = document.getElementById('modal-backdrop');
        if (backdrop) {
            backdrop.addEventListener('click', () => {
                this.modal.classList.add('hidden');
            });
        }

        document.querySelectorAll('.btn-confirm').forEach(btn => {
            btn.addEventListener('click', (e) => {
                const id = e.currentTarget.dataset.id;
                if (confirm('Xác nhận đơn hàng này?')) {
                    this.confirmOrder(id);
                }
            });
        });

        document.querySelectorAll('.btn-delivered').forEach(btn => {
            btn.addEventListener('click', (e) => {
                const id = e.currentTarget.dataset.id;
                if (confirm('Xác nhận đã giao hàng thành công?')) {
                    this.markAsDelivered(id);
                }
            });
        });

        document.querySelectorAll('.btn-delete').forEach(btn => {
            btn.addEventListener('click', (e) => {
                const id = e.currentTarget.dataset.id;
                if (confirm('Bạn có chắc muốn xoá đơn hàng này?')) {
                    this.deleteOrder(id);
                }
            });
        });
    },

    async loadOrderDetail(id) {
        try {
            const res = await fetch(`${this.API_URL}/${id}`);
            if (res.ok) {
                const data = await res.json();
                this.renderDetail(data);
                this.modal.classList.remove('hidden');
            } else {
                const text = await res.text();
                alert('Lỗi: ' + text);
            }
        } catch (e) {
            console.error(e);
            alert('Lỗi kết nối: ' + e.message);
        }
    },

    renderDetail(order) {
        // IDs: d-customer, d-phone, d-email, d-address
        // d-order-id, d-date, d-status, d-payment, d-payment-method
        // d-items (tbody), d-subtotal, d-shipping, d-discount, d-total

        const setText = (id, val) => {
            const el = document.getElementById(id);
            if (el) el.innerText = val || '';
        };

        setText('d-customer', order.customerName);
        setText('d-phone', order.customerPhone);
        setText('d-email', order.customerEmail);
        setText('d-address', order.shippingAddress);

        setText('d-order-id', '#' + order.orderId);
        setText('d-date', order.orderDate);
        setText('d-status', order.status);
        setText('d-payment', order.isPaid ? 'Đã thanh toán' : 'Chưa thanh toán');
        setText('d-payment-method', order.paymentMethod);

        setText('d-shipping', this.formatCurrency(order.shippingFee));
        setText('d-discount', '-' + this.formatCurrency(order.discountAmount));
        setText('d-total', this.formatCurrency(order.totalAmount));

        const tbody = document.getElementById('d-items');
        tbody.innerHTML = '';

        let subtotal = 0;

        order.items.forEach(item => {
            const tr = document.createElement('tr');
            tr.innerHTML = `
                <td class="px-4 py-3">
                    <div class="flex items-center">
                        <img class="h-10 w-10 rounded object-cover mr-3" src="${item.imageUrl}" alt="">
                        <div>
                            <div class="font-medium text-gray-900">${item.productName}</div>
                            <div class="text-gray-500 text-xs">${item.variantInfo}</div>
                        </div>
                    </div>
                </td>
                <td class="px-4 py-3 text-center text-gray-500">${this.formatCurrency(item.price)}</td>
                <td class="px-4 py-3 text-center text-gray-900">${item.quantity}</td>
                <td class="px-4 py-3 text-right font-medium text-gray-900">${this.formatCurrency(item.totalPrice)}</td>
            `;
            tbody.appendChild(tr);
            subtotal += (item.totalPrice || 0);
        });

        setText('d-subtotal', this.formatCurrency(subtotal));
    },

    formatCurrency(amount) {
        return new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(amount || 0);
    },

    async confirmOrder(id) {
        try {
            const res = await fetch(`${this.API_URL}/${id}/confirm`, { method: 'POST' });
            if (res.ok) {
                alert('Đã xác nhận đơn hàng');
                this.loadOrders();
            } else {
                alert('Lỗi xác nhận');
            }
        } catch (e) {
            console.error(e);
        }
    },

    async markAsDelivered(id) {
        try {
            const res = await fetch(`${this.API_URL}/${id}/mark-delivered`, { method: 'POST' });
            if (res.ok) {
                alert('Đã xác nhận giao hàng thành công');
                this.loadOrders();
            } else {
                const text = await res.text();
                alert('Lỗi: ' + text);
            }
        } catch (e) {
            console.error(e);
            alert('Lỗi khi xác nhận giao hàng');
        }
    },

    async deleteOrder(id) {
        try {
            const res = await fetch(`${this.API_URL}/${id}`, { method: 'DELETE' });
            if (res.ok) {
                alert('Đã xoá đơn hàng');
                this.loadOrders();
            } else {
                alert('Lỗi xoá đơn hàng');
            }
        } catch (e) {
            console.error(e);
        }
    }
};

document.addEventListener('DOMContentLoaded', () => {
    AdminOrderPage.init();
});
