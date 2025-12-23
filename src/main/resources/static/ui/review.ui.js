// /ui/review.ui.js
// UI module cho đánh giá sản phẩm - Shopee style

/**
 * Tạo HTML cho các ngôi sao đánh giá
 * @param {number} rating - Số sao (1-5)
 * @returns {string} HTML chuỗi sao
 */
export function renderStars(rating) {
    const fullStars = Math.floor(rating);
    const hasHalfStar = rating % 1 >= 0.5;
    let stars = '';

    for (let i = 0; i < fullStars; i++) {
        stars += '<i class="bi bi-star-fill text-warning"></i>';
    }
    if (hasHalfStar) {
        stars += '<i class="bi bi-star-half text-warning"></i>';
    }
    const emptyStars = 5 - fullStars - (hasHalfStar ? 1 : 0);
    for (let i = 0; i < emptyStars; i++) {
        stars += '<i class="bi bi-star text-warning"></i>';
    }

    return stars;
}

/**
 * Tạo HTML cho rating summary section
 * @param {Object} summary - { averageRating, totalReviews, fiveStarCount, ... }
 * @returns {string} HTML 
 */
export function renderReviewSummary(summary) {
    const { averageRating, totalReviews, fiveStarCount, fourStarCount, threeStarCount, twoStarCount, oneStarCount } = summary;

    // Tính phần trăm cho progress bars
    const getPercent = (count) => totalReviews > 0 ? Math.round((count / totalReviews) * 100) : 0;

    return `
        <div class="row mb-4">
            <!-- Điểm trung bình -->
            <div class="col-md-4 text-center border-end">
                <div class="display-4 fw-bold text-primary">${averageRating.toFixed(1)}</div>
                <div class="text-muted small">trên 5</div>
                <div class="fs-4 my-2">${renderStars(averageRating)}</div>
                <div class="text-muted small">${totalReviews} đánh giá</div>
            </div>
            
            <!-- Filter buttons & Progress bars -->
            <div class="col-md-8">
                <!-- Filter buttons -->
                <div class="d-flex flex-wrap gap-2 mb-3" id="rating-filters">
                    <button class="btn btn-primary btn-sm active" data-rating="all">
                        Tất cả (${totalReviews})
                    </button>
                    <button class="btn btn-outline-secondary btn-sm" data-rating="5">
                        5 Sao (${fiveStarCount})
                    </button>
                    <button class="btn btn-outline-secondary btn-sm" data-rating="4">
                        4 Sao (${fourStarCount})
                    </button>
                    <button class="btn btn-outline-secondary btn-sm" data-rating="3">
                        3 Sao (${threeStarCount})
                    </button>
                    <button class="btn btn-outline-secondary btn-sm" data-rating="2">
                        2 Sao (${twoStarCount})
                    </button>
                    <button class="btn btn-outline-secondary btn-sm" data-rating="1">
                        1 Sao (${oneStarCount})
                    </button>
                </div>
                
                <!-- Rating bars -->
                <div class="rating-bars">
                    ${renderRatingBar(5, fiveStarCount, getPercent(fiveStarCount))}
                    ${renderRatingBar(4, fourStarCount, getPercent(fourStarCount))}
                    ${renderRatingBar(3, threeStarCount, getPercent(threeStarCount))}
                    ${renderRatingBar(2, twoStarCount, getPercent(twoStarCount))}
                    ${renderRatingBar(1, oneStarCount, getPercent(oneStarCount))}
                </div>
            </div>
        </div>
    `;
}

/**
 * Tạo HTML cho một rating bar
 */
function renderRatingBar(stars, count, percent) {
    return `
        <div class="d-flex align-items-center mb-1">
            <span class="text-nowrap me-2" style="width: 50px;">${stars} sao</span>
            <div class="progress flex-grow-1" style="height: 8px;">
                <div class="progress-bar bg-primary" style="width: ${percent}%"></div>
            </div>
            <span class="text-muted small ms-2" style="width: 40px;">${count}</span>
        </div>
    `;
}

/**
 * Tạo HTML cho một review item
 * @param {Object} review - Review object từ API
 * @returns {string} HTML
 */
export function renderReviewItem(review) {
    const { username, rating, comment, reviewDate, variantColor, variantSize, imageUrls } = review;

    // Format date
    const date = new Date(reviewDate);
    const formattedDate = date.toLocaleDateString('vi-VN', {
        year: 'numeric',
        month: '2-digit',
        day: '2-digit',
        hour: '2-digit',
        minute: '2-digit'
    });

    // Hiển thị tên đầy đủ hoặc "Ẩn danh" nếu không có
    const displayName = username || 'Ẩn danh';

    // Review images
    let imagesHtml = '';
    if (imageUrls && imageUrls.length > 0) {
        imagesHtml = `
            <div class="d-flex flex-wrap gap-2 mt-2">
                ${imageUrls.map(url => `
                    <img src="${url}" alt="Review image" 
                         class="rounded border" 
                         style="width: 80px; height: 80px; object-fit: cover; cursor: pointer;"
                         onclick="window.open('${url}', '_blank')"
                         onerror="this.style.display='none'">
                `).join('')}
            </div>
        `;
    }

    return `
        <div class="review-item border-bottom py-3">
            <div class="d-flex align-items-start">
                <!-- Avatar -->
                <div class="me-3">
                    <div class="rounded-circle bg-primary text-white d-flex align-items-center justify-content-center" 
                         style="width: 40px; height: 40px; font-size: 14px;">
                        ${username ? username.charAt(0).toUpperCase() : 'U'}
                    </div>
                </div>
                
                <!-- Content -->
                <div class="flex-grow-1">
                    <div class="fw-semibold">${displayName}</div>
                    <div class="mb-1">${renderStars(rating)}</div>
                    <div class="text-muted small mb-2">
                        ${formattedDate} | Phân loại: ${variantColor || ''} - Size ${variantSize || ''}
                    </div>
                    ${comment ? `<p class="mb-0">${escapeHtml(comment)}</p>` : ''}
                    ${imagesHtml}
                </div>
            </div>
        </div>
    `;
}

/**
 * Tạo HTML cho danh sách reviews
 * @param {Array} reviews - Danh sách reviews
 * @returns {string} HTML
 */
export function renderReviewList(reviews) {
    if (!reviews || reviews.length === 0) {
        return `
            <div class="text-center py-4 text-muted">
                <i class="bi bi-chat-square-text fs-1 d-block mb-2"></i>
                Chưa có đánh giá nào
            </div>
        `;
    }

    return reviews.map(review => renderReviewItem(review)).join('');
}

/**
 * Mask username for privacy (e.g., "nguyenvana" -> "ng***na")
 */
function maskUsername(username) {
    if (!username || username.length < 4) return username || 'Ẩn danh';
    const first = username.substring(0, 2);
    const last = username.substring(username.length - 2);
    return `${first}***${last}`;
}

/**
 * Escape HTML để tránh XSS
 */
function escapeHtml(text) {
    const div = document.createElement('div');
    div.textContent = text;
    return div.innerHTML;
}

/**
 * Render loading state
 */
export function renderLoading() {
    return `
        <div class="text-center py-4">
            <div class="spinner-border text-primary" role="status">
                <span class="visually-hidden">Đang tải...</span>
            </div>
        </div>
    `;
}
