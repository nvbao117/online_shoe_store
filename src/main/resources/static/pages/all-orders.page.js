import { renderAllOrders } from "../ui/all-orders.ui.js";
import { fetchMyOrders } from "../api/orders.api.js";

let allOrdersLoaded = false;

document.addEventListener("DOMContentLoaded", () => {
  const ordersTabBtn = document.querySelector('[data-tab="orders"]');
  const allSubTabBtn = document.querySelector('.order-subtab[data-tab="all"]');

  const loadAll = async () => {
    if (allOrdersLoaded) return;
    allOrdersLoaded = true;

    // Quick loading state
    const container = document.querySelector('[data-content="all"]');
    if (container) {
      container.innerHTML = `
        <div class="flex items-center justify-center py-12">
          <div class="animate-spin rounded-full h-8 w-8 border-b-2 border-blue-600"></div>
          <span class="ml-3 text-gray-500">Đang tải...</span>
        </div>
      `;
    }

    try {
      const orders = await fetchMyOrders();
      renderAllOrders(orders);
    } catch (e) {
      const message = e?.message === "UNAUTHORIZED"
        ? "Bạn cần đăng nhập để xem đơn hàng."
        : "Có lỗi xảy ra. Vui lòng thử lại.";

      if (container) {
        container.innerHTML = `<div class="p-6 text-center text-red-500">${message}</div>`;
      }
      allOrdersLoaded = false;
    }
  };

  if (ordersTabBtn) {
    ordersTabBtn.addEventListener("click", loadAll);
  }

  if (allSubTabBtn) {
    allSubTabBtn.addEventListener("click", loadAll);
  }
});
