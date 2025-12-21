const pendingBox = document.querySelector('[data-content="pending"]');
export function renderPendingOrders(orders) {
    // Không có dữ liệu
    if (!orders || orders.length === 0) {
        pendingBox.innerHTML = `
            <div class="p-6 text-center text-slate-500 text-base">
                📦 Không có đơn hàng chờ xác nhận
            </div>
        `;
        return;
    }

    pendingBox.innerHTML = `
        <div class="space-y-4">
            ${orders.map(order => `
                <div
                  class="order-item border rounded-xl p-4 md:p-6 hover:shadow-md transition-shadow"
                  data-order-id="${order.orderId}"
                >
                  <!-- HEADER -->
                  <div class="flex items-center justify-between pb-3 border-b border-gray-100">
                    <div class="text-sm text-gray-500">
                      Mã đơn:
                      <span class="font-medium text-gray-800">
                        #${order.orderId}
                      </span>
                    </div>

                    <span class="text-yellow-600 font-semibold text-sm uppercase">
                      ${mapStatus(order.status)}
                    </span>
                  </div>

                  <!-- ITEMS -->
                  ${order.items.map(item => `
                    <div class="flex gap-4 mt-4">
                      <div class="w-20 h-20 flex-shrink-0">
                        <img
                          src="${item.imageUrl || 'https://via.placeholder.com/80'}"
                          class="w-full h-full object-cover rounded-lg border"
                          alt="${item.productName}"
                        />
                      </div>

                      <div class="flex-1 min-w-0">
                        <h4 class="font-medium text-gray-800 truncate">
                          ${item.productEmoji || ''} ${item.productName}
                        </h4>
                        <p class="text-xs text-gray-400 mt-1">
                          Phân loại: ${item.color} · Size ${item.size}
                        </p>
                        <p class="text-xs text-gray-400 mt-1">
                          Số lượng: x${item.quantity}
                        </p>
                      </div>

                      <div class="text-right">
                        <p class="text-blue-600 font-bold">
                          ${formatPrice(item.totalPrice)}
                        </p>
                      </div>
                    </div>
                  `).join("")}

                  <!-- FOOTER -->
                  <div
                    class="flex flex-col md:flex-row items-center justify-between gap-4 mt-5 pt-4 border-t border-gray-100"
                  >
                    <div class="text-sm text-gray-500">
                      Tổng thanh toán:
                      <span class="text-lg font-bold text-blue-600 ml-1">
                        ${formatPrice(order.finalAmount)}
                      </span>
                    </div>

                    <div class="flex gap-2 w-full md:w-auto">
                      <button
                        class="btn-cancel flex-1 md:flex-none px-5 py-2 border border-red-500 text-red-500 rounded-lg hover:bg-red-50 text-sm font-medium transition"
                        data-order-id="${order.orderId}"
                      >
                        Hủy đơn
                      </button>

                      <button
                        class="flex-1 md:flex-none px-5 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 text-sm font-medium transition"
                      >
                        Liên hệ shop
                      </button>
                    </div>
                  </div>
                </div>
            `).join("")}
        </div>
    `;
}

/* ===== helpers ===== */

function formatPrice(price) {
    return Number(price).toLocaleString("vi-VN") + " ₫";
}

function mapStatus(status) {
    if (status === "PENDING") return "Chờ xác nhận";
    if (status === "CONFIRMED") return "Đã xác nhận";
    if (status === "CANCELLED") return "Đã hủy";
    return status;
}
