import { fetchShippingOrders, confirmReceivedOrder } from "../api/shipping-orders.api.js";
import { renderShippingOrders } from "../ui/shipping-orders.ui.js";

document.addEventListener("DOMContentLoaded", () => {
    const btnShipping = document.querySelector('.order-subtab[data-tab="shipping"]');
    const container = document.querySelector('.order-tab-content[data-content="shipping"]');
    let isLoaded = false;

    if (btnShipping) {
        btnShipping.addEventListener("click", async () => {
            if (!isLoaded) {
                await loadData();
            }
        });
    }

    async function loadData() {
        if (container) {
            container.innerHTML = `
                <div class="flex items-center justify-center py-12">
                    <div class="animate-spin rounded-full h-8 w-8 border-b-2 border-blue-600"></div>
                    <span class="ml-3 text-gray-500">Đang tải đơn hàng vận chuyển...</span>
                </div>
            `;
        }

        const orders = await fetchShippingOrders();
        renderShippingOrders(orders);
        isLoaded = true;
        bindEvents();
    }

    function bindEvents() {
        if (!container) return;

        container.querySelectorAll('.btn-received').forEach(btn => {
            btn.addEventListener('click', async (e) => {
                const btn = e.currentTarget;
                const orderId = btn.getAttribute('data-order-id');

                // Removed confirm dialog as requested

                try {
                    btn.disabled = true;
                    btn.innerText = "Đang xử lý...";

                    await confirmReceivedOrder(orderId);

                    alert("Cảm ơn bạn đã mua hàng! Hãy đánh giá sản phẩm nhé.");

                    // Switch to Completed tab
                    // We can try to find the completed tab button and click it, 
                    // or reload the page with a query param if the page supports it.
                    // Given the current structure, clicking the tab button is the cleanest SPA way.
                    const completedTabBtn = document.querySelector('.order-subtab[data-tab="completed"]');
                    if (completedTabBtn) {
                        completedTabBtn.click();
                    } else {
                        window.location.reload();
                    }

                } catch (error) {
                    console.error(error);
                    alert("Có lỗi xảy ra. Vui lòng thử lại.");
                    btn.disabled = false;
                    btn.innerText = "Đã nhận được hàng";
                }
            });
        });
    }
});
