import { fetchCancelledOrders } from "../api/cancelled-orders.api.js";
import { renderCancelledOrders } from "../ui/cancelled-orders.ui.js";
import { addToCartBatch } from "../api/completed-orders.api.js";

document.addEventListener("DOMContentLoaded", () => {
    console.log("Cancelled Orders Script Loaded");
    const btnCancelled = document.querySelector('.order-subtab[data-tab="cancelled"]');
    const container = document.querySelector('.order-tab-content[data-content="cancelled"]');
    let isLoaded = false;

    if (btnCancelled) {
        btnCancelled.addEventListener("click", async () => {
            console.log("Cancelled tab clicked");
            // Always reload or check if loaded. To follow others:
            if (!isLoaded) {
                console.log("Loading cancelled orders...");
                await loadData();
            }
        });
    } else {
        console.error("Cancelled tab button not found");
    }

    async function loadData() {
        if (container) {
            container.innerHTML = `
                <div class="flex items-center justify-center py-12">
                    <div class="animate-spin rounded-full h-8 w-8 border-b-2 border-blue-600"></div>
                    <span class="ml-3 text-gray-500">Đang tải đơn hàng đã hủy...</span>
                </div>
            `;
        }

        const orders = await fetchCancelledOrders();
        renderCancelledOrders(orders);
        isLoaded = true;
        bindEvents();
    }

    function bindEvents() {
        if (!container) return;

        // Buy Again (Reusing logic from completed orders is fine, or we can duplicate it here if we want isolation)
        // Since we import addToCartBatch from completed-orders.api.js, we can reuse the logic.

        container.querySelectorAll('.btn-buy-again').forEach(btn => {
            btn.addEventListener('click', async (e) => {
                const btn = e.currentTarget;
                const originalText = btn.innerText;
                const itemsData = btn.getAttribute('data-items');

                if (!itemsData) return;

                try {
                    const items = JSON.parse(itemsData);

                    btn.innerText = 'Đang xử lý...';
                    btn.disabled = true;

                    await addToCartBatch(items);

                    const itemsToSelect = items.map(item => ({ productId: item.productId, size: item.size }));
                    localStorage.setItem('cart_selected_items', JSON.stringify(itemsToSelect));

                    window.location.href = `/templates/cart`;
                } catch (err) {
                    console.error(err);
                    alert('Có lỗi xảy ra khi thêm vào giỏ hàng.');
                    btn.innerText = originalText;
                    btn.disabled = false;
                }
            });
        });
    }
});
