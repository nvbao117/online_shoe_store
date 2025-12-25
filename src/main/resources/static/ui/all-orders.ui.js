const allBox = document.querySelector('[data-content="all"]');

// Cancel order
import { cancelOrder, fetchMyOrders } from "../api/orders.api.js";

window.handleCancelOrder = async function (orderId) {
  if (!confirm('Bạn có chắc chắn muốn hủy đơn hàng này?')) return;

  try {
    // Basic loading indication could be added here
    await cancelOrder(orderId, 'Khách hàng hủy');
    alert('Đã hủy đơn hàng thành công');

    // Re-fetch and render to update UI by clicking the active tab
    const activeTab = document.querySelector('.order-subtab.text-blue-600'); // Based on active class logic in profile.ui.js
    // OR safer:
    // const activeTab = document.querySelector('.order-subtab.active') || document.querySelector('.order-subtab[data-tab="all"]');

    // In profile.ui.js we saw it adds 'active' class. Let's use that.
    const currentTab = document.querySelector('.order-subtab.active');

    if (currentTab) {
      currentTab.click();
    } else {
      // Fallback if no tab system or standalone page
      try {
        const orders = await fetchMyOrders();
        renderAllOrders(orders);
      } catch (err) {
        window.location.reload();
      }
    }

  } catch (e) {
    alert(e.message || 'Có lỗi xảy ra khi hủy đơn hàng');
  }
};

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
      ${orders.map((order) => renderOrderCard(order)).join('')}
    </div>
  `;
}

function renderOrderCard(order) {
  const items = Array.isArray(order?.items) ? order.items : [];
  const first = items[0] || {};
  const moreCount = items.length > 1 ? items.length - 1 : 0;
  const total = order?.finalAmount ?? order?.totalAmount ?? 0;

  const statusText = mapStatus(order?.status);
  const statusTextUpper = statusText ? statusText.toUpperCase() : '';

  // mimic the screenshot: show return label for completed-like states
  const showReturnPill = order?.status === 'DELIVERED' || order?.status === 'COMPLETED';

  // Show review button only for delivered/completed orders
  const showReviewBtn = order?.status === 'DELIVERED' || order?.status === 'COMPLETED';

  // Show cancel button for pending only
  const showCancelBtn = order?.status === 'PENDING';

  return `
    <div class="border border-gray-100 rounded-xl bg-white p-4 md:p-6 hover:shadow-md transition-shadow" data-order-id="${escapeAttr(order?.orderId)}">
      <div class="flex items-center justify-between pb-3 border-b border-gray-100">
        <div class="text-sm text-gray-500">
          Mã đơn: <span class="font-medium text-gray-800">#${escapeHtml(order?.orderId || '')}</span>
        </div>
        <div class="${statusClass(order?.status)} font-semibold text-sm uppercase">${escapeHtml(statusTextUpper)}</div>
      </div>

      <div class="flex gap-4 mt-4">
        <div class="relative w-20 h-20 flex-shrink-0">
          <img
            src="${escapeAttr(normalizeImageUrl(first.imageUrl) || '/images/logo-shop/favicon.png')}"
            class="w-full h-full object-cover rounded-lg border"
            alt="${escapeAttr(first.productName || 'Sản phẩm')}"
            onerror="this.onerror=null; this.src='/images/logo-shop/favicon.png'"
          />
          ${first.quantity ? `
            <span class="absolute -top-2 -left-2 w-6 h-6 rounded-full bg-gray-900 text-white text-xs flex items-center justify-center">
              ${escapeHtml(String(first.quantity))}
            </span>
          ` : ''}
        </div>

        <div class="flex-1 min-w-0">
          <div class="flex items-start justify-between gap-3">
            <div class="min-w-0">
              <h4 class="font-medium text-gray-800 truncate">${escapeHtml(first.productName || '')}</h4>
              <p class="text-xs text-gray-400 mt-1">
                Phân loại: ${escapeHtml(first.color || '')}${first.color && first.size ? ' · ' : ''}${first.size ? `Size ${escapeHtml(first.size)}` : ''}
              </p>
              ${showReturnPill ? `<span class="inline-block mt-2 px-3 py-1 rounded-full border border-gray-200 text-xs text-gray-500">7 ngày trả hàng</span>` : ''}
              ${moreCount ? `<div class="text-xs text-gray-400 mt-2">+${moreCount} sản phẩm khác</div>` : ''}
            </div>

            <div class="text-right flex-shrink-0">
              <p class="text-blue-600 font-bold">${formatPrice(first.totalPrice ?? first.price ?? 0)}</p>
            </div>
          </div>
        </div>
      </div>

      <div class="flex flex-col md:flex-row md:items-center md:justify-between gap-4 mt-5 pt-4 border-t border-gray-100">
        <div class="text-sm text-gray-500">
          Tổng số tiền:
          <span class="text-lg font-bold text-blue-600 ml-1">${formatPrice(total)}</span>
        </div>

        <div class="flex flex-wrap gap-3 md:justify-end">

          ${showCancelBtn ? `
          <button onclick="handleCancelOrder('${escapeAttr(order?.orderId)}')" 
                  class="px-5 py-2 border border-red-200 text-red-600 rounded-lg hover:bg-red-50 text-sm font-medium transition">
            Hủy Đơn
          </button>
          ` : ''}

          ${showReviewBtn ? `
          <button onclick="navigateToReviewsTab()" 
                  class="px-5 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 text-sm font-medium transition">
            Đánh Giá
          </button>
          ` : ''}
          <button onclick="reorderProduct('${escapeAttr(first.productId)}')"
                  class="px-5 py-2 border border-gray-200 text-gray-700 rounded-lg hover:bg-gray-50 text-sm font-medium transition">
            Mua Lại
          </button>
        </div>
      </div>
    </div>
  `;
}


// Navigate to Reviews tab when clicking review button from orders
window.navigateToReviewsTab = function () {
  // Click on reviews tab button
  const reviewsTabBtn = document.querySelector('[data-tab="reviews"]');
  if (reviewsTabBtn) {
    reviewsTabBtn.click();
  }
};

// Reorder product - navigate to product detail page
window.reorderProduct = function (productId) {
  if (!productId) {
    alert('Không tìm thấy thông tin sản phẩm');
    return;
  }
  window.location.href = `/product-detail/${productId}`;
};

function normalizeImageUrl(url) {
  if (!url) return url;
  // Some APIs may return a placeholder path that doesn't exist in static assets.
  if (url === '/images/placeholder.png') return '/images/logo-shop/favicon.png';
  return url;
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
