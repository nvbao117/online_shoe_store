(() => {
  const rowsEl = document.getElementById('user-rows');
  const countEl = document.getElementById('user-count');
  const searchEl = document.getElementById('user-search');
  const roleEl = document.getElementById('filter-role');
  const activeEl = document.getElementById('filter-active');
  const sortEl = document.getElementById('filter-sort');

  let users = [];

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

  const roleBadge = (role) => {
    if (!role) return '<span class="px-2 py-1 text-xs rounded bg-slate-100 text-slate-600">N/A</span>';
    const map = {
      ADMIN: 'bg-purple-100 text-purple-700',
      USER: 'bg-green-100 text-green-700'
    };
    const cls = map[role] || 'bg-slate-100 text-slate-600';
    return `<span class="px-2 py-1 text-xs rounded ${cls}">${role}</span>`;
  };

  const activeBadge = (active) => active
    ? '<span class="px-2 py-1 text-xs rounded bg-emerald-100 text-emerald-700">Active</span>'
    : '<span class="px-2 py-1 text-xs rounded bg-rose-100 text-rose-700">Inactive</span>';

  const render = () => {
    const keyword = (searchEl?.value || '').toLowerCase();
    const roleFilter = roleEl?.value || '';
    const activeFilter = activeEl?.value || '';

    const filtered = users.filter(u => {
      const matchKeyword = u.username.toLowerCase().includes(keyword)
        || (u.email && u.email.toLowerCase().includes(keyword))
        || (u.phone && u.phone.toLowerCase().includes(keyword));
      const matchRole = !roleFilter || u.role === roleFilter;
      const matchActive = activeFilter === '' || String(u.isActive) === activeFilter;
      return matchKeyword && matchRole && matchActive;
    });
    countEl.textContent = `${filtered.length} users`;
    rowsEl.innerHTML = filtered.map(u => `
      <tr class="hover:bg-slate-50">
        <td class="px-4 py-3 font-medium text-slate-800">${u.username}</td>
        <td class="px-4 py-3 text-slate-600">${u.email || ''}</td>
        <td class="px-4 py-3 text-slate-600">${u.phone || ''}</td>
        <td class="px-4 py-3">${roleBadge(u.role)}</td>
        <td class="px-4 py-3">${activeBadge(u.isActive)}</td>
        <td class="px-4 py-3 text-slate-500">${u.createdAt ? u.createdAt.replace('T',' ') : ''}</td>
        <td class="px-4 py-3 text-right space-x-2">
          <a class="px-3 py-1 rounded-lg text-xs font-semibold border border-slate-200 text-slate-700 hover:bg-slate-100" href="/admin/users/${u.userId}" data-action="view" data-id="${u.userId}">
            Xem
          </a>
          <button class="px-3 py-1 rounded-lg text-xs font-semibold border border-slate-200 text-slate-700 hover:bg-slate-100" data-action="toggle" data-id="${u.userId}">
            ${u.isActive ? 'Disable' : 'Enable'}
          </button>
          <select class="px-2 py-1 rounded-lg text-xs border border-slate-200 text-slate-700" data-action="role" data-id="${u.userId}">
            <option value="USER" ${u.role === 'USER' ? 'selected' : ''}>USER</option>
            <option value="ADMIN" ${u.role === 'ADMIN' ? 'selected' : ''}>ADMIN</option>
          </select>
        </td>
      </tr>
    `).join('');
  };

  const load = async () => {
    const params = new URLSearchParams();
    if (searchEl?.value) params.append('search', searchEl.value.trim());
    if (roleEl?.value) params.append('role', roleEl.value);
    if (activeEl?.value !== undefined && activeEl.value !== '') params.append('active', activeEl.value);
    if (sortEl?.value) {
      const [sort, dir] = sortEl.value.split(':');
      params.append('sort', sort);
      params.append('dir', dir);
    }

    const res = await axios.get('/api/admin/users', { params });
    users = res.data || [];
    render();
  };

  rowsEl?.addEventListener('click', async (e) => {
    const btn = e.target.closest('button[data-action="toggle"]');
    if (!btn) return;
    const id = btn.dataset.id;
    await axios.patch(`/api/admin/users/${id}/toggle-active`);
    await load();
  });

  rowsEl?.addEventListener('change', async (e) => {
    const sel = e.target.closest('select[data-action="role"]');
    if (!sel) return;
    const id = sel.dataset.id;
    const role = sel.value;
    await axios.put(`/api/admin/users/${id}/role`, { role });
    await load();
  });

  searchEl?.addEventListener('input', () => load());
  roleEl?.addEventListener('change', () => load());
  activeEl?.addEventListener('change', () => load());
  sortEl?.addEventListener('change', () => load());

  load();
})();
