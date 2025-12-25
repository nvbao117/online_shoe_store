import { fetchCompletedOrders, addToCartBatch } from "../api/completed-orders.api.js";
import { renderCompletedOrders } from "../ui/completed-orders.ui.js";

document.addEventListener("DOMContentLoaded", () => {
    const btnCompleted = document.querySelector('.order-subtab[data-tab="completed"]');
    const container = document.querySelector('.order-tab-content[data-content="completed"]');
    let isLoaded = false;

    if (btnCompleted) {
        btnCompleted.addEventListener("click", async () => {
            // Switch tabs visually is handled by profile.ui.js usually, but we ensure content loading
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
                    <span class="ml-3 text-gray-500">Đang tải đơn hàng hoàn thành...</span>
                </div>
            `;
        }

        const orders = await fetchCompletedOrders();
        renderCompletedOrders(orders);
        isLoaded = true;
        bindEvents();
    }

    function bindEvents() {
        if (!container) return;

        // Buy Again
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

                    // LOGIC MỚI: Dùng LocalStorage để chuyển danh sách cần chọn sang trang cart
                    // Cách này ổn định hơn URL param vì không bị giới hạn độ dài và ký tự
                    const itemsToSelect = items.map(item => ({ productId: item.productId, size: item.size }));
                    localStorage.setItem('cart_selected_items', JSON.stringify(itemsToSelect));

                    console.log("Đã lưu vào LocalStorage:", itemsToSelect);

                    // Redirect sang trang giỏ hàng (không cần query param nữa)
                    window.location.href = `/templates/cart`;
                } catch (err) {
                    console.error(err);
                    alert('Có lỗi xảy ra khi thêm vào giỏ hàng.');
                    btn.innerText = originalText;
                    btn.disabled = false;
                }
            });
        });

        // Review - Switch to Reviews tab
        container.querySelectorAll('.btn-review').forEach(btn => {
            btn.addEventListener('click', () => {
                const reviewTab = document.querySelector('[data-tab="reviews"]');
                const pendingReviewSubTab = document.querySelector('#review-tab-pending');

                if (reviewTab) {
                    reviewTab.click(); // Switch main tab
                    // Optionally switch to 'Pending' subtab inside reviews
                    if (pendingReviewSubTab) pendingReviewSubTab.click();

                    // Scroll to top
                    window.scrollTo({ top: 0, behavior: 'smooth' });
                }
            });
        });

        // Return
        container.querySelectorAll('.btn-return').forEach(btn => {
            btn.addEventListener('click', async () => {
                const orderId = btn.getAttribute('data-order-id');
                if (confirm(`Bạn muốn gửi yêu cầu trả hàng/hoàn tiền cho đơn hàng #${orderId}?`)) {
                    try {
                        btn.disabled = true;
                        btn.innerText = 'Đang xử lý...';

                        const res = await fetch(`/api/orders/${orderId}/request-return`, {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/json'
                            },
                            body: JSON.stringify('Khách hàng yêu cầu hoàn trả')
                        });

                        if (res.ok) {
                            alert('Yêu cầu hoàn trả đã được gửi thành công! Nhân viên sẽ xử lý sớm nhất.');
                            // Reload orders to update UI
                            window.location.reload();
                        } else {
                            const text = await res.text();
                            alert('Lỗi: ' + text);
                            btn.disabled = false;
                            btn.innerText = 'Trả hàng';
                        }
                    } catch (err) {
                        console.error(err);
                        alert('Có lỗi xảy ra khi gửi yêu cầu hoàn trả.');
                        btn.disabled = false;
                        btn.innerText = 'Trả hàng';
                    }
                }
            });
        });
    }
});
