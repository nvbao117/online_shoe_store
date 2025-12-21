(() => {
  const params = window.location.pathname.split('/');
  const userId = params[params.length - 1];

  const el = {
    breadcrumb: document.getElementById('user-breadcrumb'),
    avatar: document.getElementById('avatar'),
    role: document.getElementById('user-role'),
    name: document.getElementById('user-name'),
    email: document.getElementById('user-email'),
    phone: document.getElementById('user-phone'),
    joined: document.getElementById('user-joined'),
    heroBadges: document.getElementById('hero-badges'),
    statCards: document.getElementById('stat-cards'),
    ordersCount: document.getElementById('orders-count'),
    orderList: document.getElementById('order-list'),
    timelineCount: document.getElementById('timeline-count'),
    timelineList: document.getElementById('timeline-list'),
    reviewsCount: document.getElementById('reviews-count'),
    error: document.getElementById('error')
  };

  const tabs = {
    buttons: Array.from(document.querySelectorAll('.tab-btn')),
    panels: {
      orders: document.getElementById('tab-orders'),
      timeline: document.getElementById('tab-timeline'),
      reviews: document.getElementById('tab-reviews'),
      notes: document.getElementById('tab-notes')
    }
  };

  let state = {
    orders: []
  };

  const fmtNumber = (value, opts = {}) => {
    const num = Number(value || 0);
    return new Intl.NumberFormat('vi-VN', { maximumFractionDigits: 0, ...opts }).format(num);
  };

  const fmtMoney = (value) => {
    if (value === null || value === undefined) return '—';
    return new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND', maximumFractionDigits: 0 }).format(Number(value));
  };

  const fmtDate = (value) => {
    if (!value) return '';
    const d = new Date(value);
    if (Number.isNaN(d.getTime())) return value;
    return d.toLocaleString('vi-VN', { day: '2-digit', month: '2-digit', year: 'numeric', hour: '2-digit', minute: '2-digit' });
  };

  const badge = (text, cls) => `<span class="px-2 py-1 rounded-full text-xs font-semibold ${cls}">${text}</span>`;

  const renderOrders = () => {
    const orders = state.orders;
    el.ordersCount.textContent = `${orders.length} đơn`;
    const statusClasses = {
      COMPLETED: 'bg-emerald-100 text-emerald-700',
      DELIVERED: 'bg-emerald-100 text-emerald-700',
      PENDING: 'bg-amber-100 text-amber-700',
      PROCESSING: 'bg-blue-100 text-blue-700',
      CONFIRMED: 'bg-blue-100 text-blue-700',
      CANCELLED: 'bg-rose-100 text-rose-700',
      FAILED: 'bg-rose-100 text-rose-700'
    };

    if (orders.length === 0) {
      el.orderList.innerHTML = '<div class="text-sm text-slate-500">Chưa có đơn hàng.</div>';
      return;
    }

    el.orderList.innerHTML = orders.map(o => `
      <div class="rounded-xl border border-slate-200 bg-white p-4 shadow-sm">
        <div class="flex flex-wrap items-center justify-between gap-2 mb-2">
          <div class="font-semibold text-slate-800">#${o.orderId || ''}</div>
          ${badge(o.statusLabel || o.status || '—', statusClasses[o.status] || 'bg-slate-200 text-slate-700')}
        </div>
        <div class="grid grid-cols-2 md:grid-cols-4 gap-3 text-sm text-slate-600">
          <div>
            <div class="text-slate-500">Ngày đặt</div>
            <div class="font-semibold text-slate-800">${fmtDate(o.orderDate)}</div>
          </div>
          <div>
            <div class="text-slate-500">Số lượng</div>
            <div class="font-semibold text-slate-800">${fmtNumber(o.itemCount)} sản phẩm</div>
          </div>
          <div>
            <div class="text-slate-500">Tổng tiền</div>
            <div class="font-semibold text-slate-800">${fmtMoney(o.finalAmount || o.totalAmount)}</div>
          </div>
          <div>
            <div class="text-slate-500">Thanh toán</div>
            <div class="font-semibold text-slate-800">${o.paymentMethod || 'Chưa rõ'}${o.paymentStatus ? ` · ${o.paymentStatus}` : ''}</div>
          </div>
        </div>
      </div>
    `).join('');
  };

  const renderTimeline = () => {
    const events = state.orders.map(o => ({
      title: `Đơn #${o.orderId || ''}`,
      description: `${fmtNumber(o.itemCount)} sản phẩm · ${fmtMoney(o.finalAmount || o.totalAmount)}`,
      time: fmtDate(o.orderDate),
      status: o.statusLabel || o.status || 'Đơn hàng'
    }));
    el.timelineCount.textContent = `${events.length} sự kiện`;
    if (!events.length) {
      el.timelineList.innerHTML = '<div class="text-sm text-slate-500">Chưa có sự kiện.</div>';
      return;
    }
    el.timelineList.innerHTML = events.map(ev => `
      <div class="relative pl-6">
        <span class="absolute left-0 top-2 w-3 h-3 rounded-full bg-gradient-to-r from-indigo-500 to-blue-400 shadow"></span>
        <div class="text-sm font-semibold text-slate-800">${ev.title}</div>
        <div class="text-sm text-slate-600">${ev.description}</div>
        <div class="text-xs text-slate-500 mt-1">${ev.time}</div>
      </div>
    `).join('');
  };

  const render = (data) => {
    const u = data.user || {};
    const stats = data.stats || {};
    state.orders = data.recentOrders || [];

    el.breadcrumb.textContent = `> ${u.username || u.name || userId}`;
    el.avatar.textContent = (u.name || u.username || '?').substring(0, 2).toUpperCase();
    el.role.textContent = u.role || 'USER';
    el.name.textContent = u.name || u.username || '—';
    el.email.textContent = u.email || 'Chưa có email';
    el.phone.textContent = u.phone || 'Chưa có số';
    el.joined.textContent = u.createdAt ? fmtDate(u.createdAt) : '—';

    el.heroBadges.innerHTML = `
      ${badge(u.isActive ? 'Active' : 'Inactive', u.isActive ? 'bg-emerald-100 text-emerald-700' : 'bg-rose-100 text-rose-700')}
      ${badge(u.role || 'USER', u.role === 'ADMIN' ? 'bg-purple-100 text-purple-700' : 'bg-slate-100 text-slate-700')}
    `;

    el.statCards.innerHTML = [
      { label: 'Tổng đơn hàng', value: fmtNumber(stats.totalOrders) },
      { label: 'Tổng chi tiêu', value: fmtMoney(stats.totalSpend) },
      { label: 'Giá trị TB/đơn', value: fmtMoney(stats.averageOrderValue) },
      { label: 'Số sản phẩm', value: fmtNumber(stats.totalItems) }
    ].map(card => `
      <div class="rounded-xl border border-slate-200 p-3 bg-slate-50">
        <div class="text-xs uppercase text-slate-500">${card.label}</div>
        <div class="text-2xl font-bold text-slate-800">${card.value}</div>
      </div>
    `).join('');

    renderOrders();
    renderTimeline();
  };

  const bindTabs = () => {
    tabs.buttons.forEach(btn => {
      btn.addEventListener('click', () => {
        const target = btn.dataset.tab;
        tabs.buttons.forEach(b => b.classList.remove('active'));
        btn.classList.add('active');
        Object.entries(tabs.panels).forEach(([key, panel]) => {
          if (key === target) panel.classList.remove('hidden'); else panel.classList.add('hidden');
        });
      });
    });
  };

  const load = async () => {
    try {
      const res = await axios.get(`/api/admin/users/${userId}/dashboard`);
      render(res.data);
    } catch (err) {
      console.error(err);
      el.error.classList.remove('hidden');
      el.error.textContent = 'Không thể tải dữ liệu khách hàng. Vui lòng thử lại.';
    }
  };

  bindTabs();
  load();
})();
