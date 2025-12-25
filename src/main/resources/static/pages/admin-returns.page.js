const AdminReturnsPage = {
    API_URL: '/api/admin/orders',
    allOrders: [],
    currentFilter: 'all',

    init() {
        this.bindFilterEvents();
        this.loadReturns();
    },

    bindFilterEvents() {
        document.querySelectorAll('.filter-btn').forEach(btn => {
            btn.addEventListener('click', (e) => {
                document.querySelectorAll('.filter-btn').forEach(b => {
                    b.classList.remove('bg-blue-600', 'text-white');
                    b.classList.add('bg-gray-100', 'text-gray-700');
                });
                e.target.classList.remove('bg-gray-100', 'text-gray-700');
                e.target.classList.add('bg-blue-600', 'text-white');

                const filterId = e.target.id;
                if (filterId === 'filter-all') {
                    this.currentFilter = 'all';
                } else if (filterId === 'filter-requested') {
                    this.currentFilter = 'RETURN_REQUESTED';
                } else if (filterId === 'filter-in-progress') {
                    this.currentFilter = 'RETURN_IN_PROGRESS';
                } else if (filterId === 'filter-refunded') {
                    this.currentFilter = 'refunded';
                }
                this.renderFiltered();
            });
        });
    },

    async loadReturns() {
        try {
            const res = await fetch(`${this.API_URL}/returns`);
            if (res.ok) {
                this.allOrders = await res.json();
                this.renderFiltered();
            } else {
                console.error("Failed to load return orders");
            }
        } catch (e) {
            console.error("Error loading return orders", e);
        }
    },

    renderFiltered() {
        let orders = this.allOrders;
        if (this.currentFilter !== 'all') {
            if (this.currentFilter === 'refunded') {
                orders = orders.filter(o => o.status === 'REFUNDED' || o.status === 'PARTIALLY_REFUNDED' || o.status === 'RETURNED');
            } else {
                orders = orders.filter(o => o.status === this.currentFilter);
            }
        }
        this.render(orders);
    },

    modal: null,

    render(orders) {
        this.modal = document.getElementById('order-modal');
        const tbody = document.getElementById('return-rows');
        const emptyState = document.getElementById('empty-state');

        if (!tbody) return;
        tbody.innerHTML = '';

        if (orders.length === 0) {
            emptyState?.classList.remove('hidden');
            return;
        }
        emptyState?.classList.add('hidden');

        orders.forEach(order => {
            const tr = document.createElement('tr');
            tr.className = 'hover:bg-slate-50 transition';

            let statusClass = 'bg-gray-100 text-gray-600';
            let statusText = order.status;

            if (order.status === 'RETURN_REQUESTED') {
                statusClass = 'bg-orange-100 text-orange-700';
                statusText = 'Yêu cầu hoàn trả';
            } else if (order.status === 'RETURN_IN_PROGRESS') {
                statusClass = 'bg-blue-100 text-blue-700';
                statusText = 'Đang xử lý';
            } else if (order.status === 'RETURNED') {
                statusClass = 'bg-purple-100 text-purple-700';
                statusText = 'Đã trả hàng';
            } else if (order.status === 'REFUNDED') {
                statusClass = 'bg-green-100 text-green-700';
                statusText = 'Đã hoàn tiền';
            } else if (order.status === 'PARTIALLY_REFUNDED') {
                statusClass = 'bg-yellow-100 text-yellow-700';
                statusText = 'Hoàn tiền một phần';
            }

            const totalAmount = this.formatCurrency(order.totalAmount);

            let actionsHtml = `<div class="flex justify-end gap-2">`;

            actionsHtml += `
                <button class="btn-view p-1.5 text-slate-600 hover:bg-slate-100 rounded" title="Xem chi tiết" data-id="${order.orderId}">
                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"></path><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z"></path></svg>
                </button>`;

            if (order.status === 'RETURN_REQUESTED') {
                actionsHtml += `
                    <button class="btn-accept p-1.5 text-green-600 hover:bg-green-50 rounded" title="Chấp nhận" data-id="${order.orderId}">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path></svg>
                    </button>
                    <button class="btn-reject p-1.5 text-red-600 hover:bg-red-50 rounded" title="Từ chối" data-id="${order.orderId}">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path></svg>
                    </button>`;
            }

            if (order.status === 'RETURN_IN_PROGRESS') {
                actionsHtml += `
                    <button class="btn-complete p-1.5 text-blue-600 hover:bg-blue-50 rounded" title="Hoàn thành hoàn trả" data-id="${order.orderId}">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                    </button>`;
            }

            actionsHtml += `</div>`;

            tr.innerHTML = `
                <td class="px-4 py-3 font-medium text-slate-800" title="${order.orderId}">#${order.orderId.substring(0, 8)}...</td>
                <td class="px-4 py-3 text-slate-600">${order.orderDate}</td>
                <td class="px-4 py-3 text-slate-800 font-medium">${order.customerName}</td>
                <td class="px-4 py-3 text-slate-600 truncate max-w-xs" title="${order.products}">${order.products}</td>
                <td class="px-4 py-3 font-semibold text-slate-800">${totalAmount}</td>
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
        document.querySelectorAll('.btn-view').forEach(btn => {
            btn.addEventListener('click', (e) => {
                const id = e.currentTarget.dataset.id;
                this.loadOrderDetail(id);
            });
        });

        document.querySelectorAll('.btn-close-modal').forEach(btn => {
            btn.addEventListener('click', () => {
                this.modal?.classList.add('hidden');
            });
        });

        const backdrop = document.getElementById('modal-backdrop');
        if (backdrop) {
            backdrop.addEventListener('click', () => {
                this.modal?.classList.add('hidden');
            });
        }

        document.querySelectorAll('.btn-accept').forEach(btn => {
            btn.addEventListener('click', (e) => {
                const id = e.currentTarget.dataset.id;
                if (confirm('Chấp nhận yêu cầu hoàn trả này?')) {
                    this.acceptReturn(id);
                }
            });
        });

        document.querySelectorAll('.btn-reject').forEach(btn => {
            btn.addEventListener('click', (e) => {
                const id = e.currentTarget.dataset.id;
                if (confirm('Từ chối yêu cầu hoàn trả này?')) {
                    this.rejectReturn(id);
                }
            });
        });

        document.querySelectorAll('.btn-complete').forEach(btn => {
            btn.addEventListener('click', (e) => {
                const id = e.currentTarget.dataset.id;
                if (confirm('Xác nhận hoàn thành hoàn trả và hoàn tiền?')) {
                    this.completeReturn(id);
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
                this.modal?.classList.remove('hidden');
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
        setText('d-status', this.getStatusText(order.status));
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

    getStatusText(status) {
        const statusMap = {
            'RETURN_REQUESTED': 'Yêu cầu hoàn trả',
            'RETURN_IN_PROGRESS': 'Đang xử lý',
            'RETURNED': 'Đã trả hàng',
            'REFUNDED': 'Đã hoàn tiền',
            'PARTIALLY_REFUNDED': 'Hoàn tiền một phần'
        };
        return statusMap[status] || status;
    },

    formatCurrency(amount) {
        return new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(amount || 0);
    },

    async acceptReturn(id) {
        try {
            const res = await fetch(`${this.API_URL}/${id}/accept-return`, { method: 'POST' });
            if (res.ok) {
                alert('Đã chấp nhận yêu cầu hoàn trả');
                this.loadReturns();
            } else {
                const text = await res.text();
                alert('Lỗi: ' + text);
            }
        } catch (e) {
            console.error(e);
            alert('Lỗi kết nối');
        }
    },

    async rejectReturn(id) {
        try {
            const res = await fetch(`${this.API_URL}/${id}/reject-return`, { method: 'POST' });
            if (res.ok) {
                alert('Đã từ chối yêu cầu hoàn trả');
                this.loadReturns();
            } else {
                const text = await res.text();
                alert('Lỗi: ' + text);
            }
        } catch (e) {
            console.error(e);
            alert('Lỗi kết nối');
        }
    },

    async completeReturn(id) {
        try {
            const res = await fetch(`${this.API_URL}/${id}/complete-return`, { method: 'POST' });
            if (res.ok) {
                alert('Đã hoàn thành xử lý hoàn trả');
                this.loadReturns();
            } else {
                const text = await res.text();
                alert('Lỗi: ' + text);
            }
        } catch (e) {
            console.error(e);
            alert('Lỗi kết nối');
        }
    }
};

document.addEventListener('DOMContentLoaded', () => {
    AdminReturnsPage.init();
});
