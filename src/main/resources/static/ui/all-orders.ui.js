const allBox = document.querySelector('[data-content="all"]');

export function renderAllOrders(orders) {
  if (!allBox) return;

  if (!orders || orders.length === 0) {
    allBox.innerHTML = `
      <div class="p-6 text-center text-slate-500 text-base">
        📦 Chưa có đơn hàng.
      </div>
    `;
    return;
  }

  allBox.innerHTML = `
    <div class="space-y-4">
      ${orders
        .map(
          (order) => `
          <div class="order-item border rounded-xl p-4 md:p-6 hover:shadow-md transition-shadow" data-order-id="${escapeAttr(order.orderId)}">
            <div class="flex items-center justify-between pb-3 border-b border-gray-100">
              <div class="text-sm text-gray-500">
                Mã đơn:
                <span class="font-medium text-gray-800">#${escapeHtml(order.orderId)}</span>
              </div>
              <span class="${statusClass(order.status)} font-semibold text-sm uppercase">
                ${escapeHtml(mapStatus(order.status))}
              </span>
            </div>

            ${renderItems(order.items)}

            <div class="flex flex-col md:flex-row items-center justify-between gap-4 mt-5 pt-4 border-t border-gray-100">
              <div class="text-sm text-gray-500">
                Tổng thanh toán:
                <span class="text-lg font-bold text-blue-600 ml-1">${formatPrice(order.finalAmount ?? order.totalAmount ?? 0)}</span>
              </div>
              <div class="text-xs text-gray-400">
                ${order.createdAt ? `Ngày đặt: ${formatDate(order.createdAt)}` : ''}
              </div>
            </div>
          </div>
        `
        )
        .join('')}
    </div>
  `;
}

function renderItems(items) {
  if (!items || items.length === 0) return '';

  return items
    .map(
      (item) => `
      <div class="flex gap-4 mt-4">
        <div class="w-20 h-20 flex-shrink-0">
          <img
            src="${escapeAttr(item.imageUrl || '/images/placeholder.png')}"
            class="w-full h-full object-cover rounded-lg border"
            alt="${escapeAttr(item.productName || 'Sản phẩm')}"
            onerror="this.src='/images/placeholder.png'"
          />
        </div>

        <div class="flex-1 min-w-0">
          <h4 class="font-medium text-gray-800 truncate">${escapeHtml(item.productName || '')}</h4>
          <p class="text-xs text-gray-400 mt-1">Phân loại: ${escapeHtml(item.color || '')} · Size ${escapeHtml(item.size || '')}</p>
          <p class="text-xs text-gray-400 mt-1">Số lượng: x${escapeHtml(String(item.quantity ?? ''))}</p>
        </div>

        <div class="text-right">
          <p class="text-blue-600 font-bold">${formatPrice(item.totalPrice ?? item.price ?? 0)}</p>
        </div>
      </div>
    `
    )
    .join('');
}

function formatPrice(price) {
  return Number(price || 0).toLocaleString('vi-VN') + ' ₫';
}

function formatDate(iso) {
  try {
    const d = new Date(iso);
    if (Number.isNaN(d.getTime())) return '';
    return d.toLocaleDateString('vi-VN');
  } catch {
    return '';
  }
}

function mapStatus(status) {
  if (!status) return '';

  // Prefer accurate per-status labels (aligned with OrderStatus descriptions)
  switch (status) {
    case 'PENDING':
      return 'Chờ xác nhận';
    case 'AWAITING_PAYMENT':
      return 'Chờ thanh toán';
    case 'PAYMENT_FAILED':
      return 'Thanh toán thất bại';

    case 'CONFIRMED':
      return 'Đã xác nhận';
    case 'PROCESSING':
      return 'Đang xử lý';
    case 'READY_FOR_SHIPMENT':
      return 'Sẵn sàng giao';

    case 'SHIPPED':
      return 'Đã giao cho DVVC';
    case 'IN_TRANSIT':
      return 'Đang vận chuyển';
    case 'OUT_FOR_DELIVERY':
      return 'Đang giao hàng';

    case 'DELIVERED':
      return 'Đã giao hàng';
    case 'COMPLETED':
      return 'Hoàn thành';

    case 'CANCELLED':
      return 'Đã hủy';
    case 'EXPIRED':
      return 'Hết hạn';
    case 'FAILED':
      return 'Thất bại';

    case 'RETURN_REQUESTED':
      return 'Yêu cầu trả hàng';
    case 'RETURN_IN_PROGRESS':
      return 'Đang xử lý trả hàng';
    case 'RETURNED':
      return 'Đã trả hàng';
    case 'REFUNDED':
      return 'Đã hoàn tiền';
    case 'PARTIALLY_REFUNDED':
      return 'Đã hoàn tiền một phần';

    case 'ON_HOLD':
      return 'Tạm giữ';
    case 'SUSPENDED':
      return 'Tạm ngưng';
    case 'FRAUD_REVIEW':
      return 'Kiểm tra gian lận';

    default:
      return status;
  }
}

function statusClass(status) {
  // Color groupings similar to the profile tabs
  if (status === 'PENDING' || status === 'AWAITING_PAYMENT' || status === 'PAYMENT_FAILED') return 'text-yellow-600';
  if (status === 'CONFIRMED' || status === 'PROCESSING' || status === 'READY_FOR_SHIPMENT'
    || status === 'SHIPPED' || status === 'IN_TRANSIT' || status === 'OUT_FOR_DELIVERY') return 'text-orange-600';
  if (status === 'DELIVERED' || status === 'COMPLETED') return 'text-green-600';
  if (status === 'CANCELLED') return 'text-red-600';
  return 'text-gray-600';
}

function escapeHtml(input) {
  return String(input ?? '')
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')
    .replace(/'/g, '&#39;');
}

function escapeAttr(input) {
  return escapeHtml(input);
}
