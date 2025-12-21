// /api/review.api.js
// API module cho đánh giá sản phẩm

/**
 * Lấy tổng quan đánh giá sản phẩm (điểm trung bình, số lượng mỗi mức sao)
 * @param {string} productId - ID sản phẩm
 * @returns {Promise<Object>} - { averageRating, totalReviews, fiveStarCount, ... }
 */
export async function fetchReviewSummary(productId) {
    const res = await fetch(`/api/reviews/product/${productId}/summary`);
    if (!res.ok) throw new Error("Failed to fetch review summary");
    return res.json();
}

/**
 * Lấy danh sách đánh giá của sản phẩm
 * @param {string} productId - ID sản phẩm
 * @param {number|null} rating - Lọc theo số sao (1-5), null = tất cả
 * @returns {Promise<Array>} - Danh sách reviews
 */
export async function fetchProductReviews(productId, rating = null) {
    let url = `/api/reviews/product/${productId}`;
    if (rating && rating >= 1 && rating <= 5) {
        url += `?rating=${rating}`;
    }
    const res = await fetch(url);
    if (!res.ok) throw new Error("Failed to fetch reviews");
    return res.json();
}
