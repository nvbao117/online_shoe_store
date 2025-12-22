// /pages/product-review.page.js
// Page module cho phần đánh giá trong trang chi tiết sản phẩm

import { fetchReviewSummary, fetchProductReviews } from '../api/review.api.js';
import { renderReviewSummary, renderReviewList, renderLoading } from '../ui/review.ui.js';

// State
let currentProductId = null;
let currentRating = null; // null = tất cả

/**
 * Khởi tạo phần đánh giá sản phẩm
 * @param {string} productId - ID sản phẩm
 */
export async function initProductReviews(productId) {
    currentProductId = productId;

    const reviewSection = document.getElementById('review-section');
    if (!reviewSection) {
        console.warn('Review section not found');
        return;
    }

    // Hiển thị loading
    const summaryContainer = document.getElementById('review-summary');
    const listContainer = document.getElementById('reviews-list');

    if (summaryContainer) summaryContainer.innerHTML = renderLoading();
    if (listContainer) listContainer.innerHTML = '';

    try {
        // Load summary và reviews song song
        const [summary, reviews] = await Promise.all([
            fetchReviewSummary(productId),
            fetchProductReviews(productId, null)
        ]);

        // Render summary
        if (summaryContainer) {
            summaryContainer.innerHTML = renderReviewSummary(summary);
            setupRatingFilters();
        }

        // Render reviews
        if (listContainer) {
            listContainer.innerHTML = renderReviewList(reviews);
        }

    } catch (error) {
        console.error('Error loading reviews:', error);
        if (summaryContainer) {
            summaryContainer.innerHTML = `
                <div class="text-center py-4 text-muted">
                    <i class="bi bi-exclamation-circle fs-1 d-block mb-2"></i>
                    Không thể tải đánh giá. Vui lòng thử lại sau.
                </div>
            `;
        }
    }
}

/**
 * Thiết lập sự kiện cho các nút lọc theo số sao
 */
function setupRatingFilters() {
    const filtersContainer = document.getElementById('rating-filters');
    if (!filtersContainer) return;

    filtersContainer.addEventListener('click', async (e) => {
        const btn = e.target.closest('button[data-rating]');
        if (!btn) return;

        // Update active state
        filtersContainer.querySelectorAll('button').forEach(b => {
            b.classList.remove('active', 'btn-primary');
            b.classList.add('btn-outline-secondary');
        });
        btn.classList.remove('btn-outline-secondary');
        btn.classList.add('active', 'btn-primary');

        // Get rating value
        const ratingValue = btn.dataset.rating;
        currentRating = ratingValue === 'all' ? null : parseInt(ratingValue);

        // Reload reviews with filter
        await loadFilteredReviews();
    });
}

/**
 * Load reviews với bộ lọc hiện tại
 */
async function loadFilteredReviews() {
    const listContainer = document.getElementById('reviews-list');
    if (!listContainer || !currentProductId) return;

    listContainer.innerHTML = renderLoading();

    try {
        const reviews = await fetchProductReviews(currentProductId, currentRating);
        listContainer.innerHTML = renderReviewList(reviews);
    } catch (error) {
        console.error('Error loading filtered reviews:', error);
        listContainer.innerHTML = `
            <div class="alert alert-danger">
                Không thể tải đánh giá. Vui lòng thử lại.
            </div>
        `;
    }
}

// Auto-init nếu có productId trong URL
document.addEventListener('DOMContentLoaded', () => {
    const urlMatch = window.location.pathname.match(/product-detail\/([^/]+)/);
    if (urlMatch) {
        const productId = urlMatch[1];
        initProductReviews(productId);
    }
});
