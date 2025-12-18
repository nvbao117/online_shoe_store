/**
 * Profile Reviews Handler
 * Xử lý fetch dữ liệu và render UI cho phần đánh giá trong trang profile
 */

document.addEventListener('DOMContentLoaded', function() {
    // Khởi tạo khi tab reviews được click
    const reviewsTabBtn = document.querySelector('[data-tab="reviews"]');
    if (reviewsTabBtn) {
        reviewsTabBtn.addEventListener('click', () => {
            initReviewsTab();
        });
    }

    // Khởi tạo sub-tabs trong review section
    initReviewSubTabs();

    // Khởi tạo form submit
    initReviewFormSubmit();
});

let pendingDataLoaded = false;
let completedDataLoaded = false;

/**
 * Khởi tạo tab đánh giá - load dữ liệu lần đầu
 */
function initReviewsTab() {
    if (!pendingDataLoaded) {
        loadPendingReviews();
    }
}

/**
 * Khởi tạo sub-tabs chuyển đổi giữa Chờ đánh giá / Đã đánh giá
 */
function initReviewSubTabs() {
    const pendingTab = document.getElementById('review-tab-pending');
    const completedTab = document.getElementById('review-tab-completed');
    const pendingContent = document.getElementById('pending-reviews-content');
    const completedContent = document.getElementById('completed-reviews-content');

    if (pendingTab) {
        pendingTab.addEventListener('click', () => {
            // Update tab styles
            pendingTab.classList.add('text-blue-600', 'border-blue-600');
            pendingTab.classList.remove('text-gray-500', 'border-transparent');
            completedTab.classList.remove('text-blue-600', 'border-blue-600');
            completedTab.classList.add('text-gray-500', 'border-transparent');

            // Show/hide content
            pendingContent.classList.remove('hidden');
            completedContent.classList.add('hidden');

            if (!pendingDataLoaded) {
                loadPendingReviews();
            }
        });
    }

    if (completedTab) {
        completedTab.addEventListener('click', () => {
            // Update tab styles
            completedTab.classList.add('text-blue-600', 'border-blue-600');
            completedTab.classList.remove('text-gray-500', 'border-transparent');
            pendingTab.classList.remove('text-blue-600', 'border-blue-600');
            pendingTab.classList.add('text-gray-500', 'border-transparent');

            // Show/hide content
            completedContent.classList.remove('hidden');
            pendingContent.classList.add('hidden');

            if (!completedDataLoaded) {
                loadCompletedReviews();
            }
        });
    }
}

/**
 * Load danh sách sản phẩm chờ đánh giá
 */
async function loadPendingReviews() {
    const loadingEl = document.getElementById('pending-loading');
    const emptyEl = document.getElementById('pending-empty');
    const itemsEl = document.getElementById('pending-items');
    const countEl = document.getElementById('pending-count');

    try {
        const response = await fetch('/api/reviews/pending');
        if (!response.ok) throw new Error('Failed to load pending reviews');

        const data = await response.json();
        pendingDataLoaded = true;

        // Hide loading
        loadingEl.classList.add('hidden');

        if (data.length === 0) {
            emptyEl.classList.remove('hidden');
            itemsEl.classList.add('hidden');
            countEl.classList.add('hidden');
        } else {
            emptyEl.classList.add('hidden');
            itemsEl.classList.remove('hidden');
            itemsEl.innerHTML = data.map(item => renderPendingItem(item)).join('');

            // Update count badge
            countEl.textContent = data.length;
            countEl.classList.remove('hidden');
        }
    } catch (error) {
        console.error('Error loading pending reviews:', error);
        loadingEl.innerHTML = '<div class="text-center text-red-500">Có lỗi xảy ra. Vui lòng thử lại.</div>';
    }
}

/**
 * Load danh sách đánh giá đã viết
 */
async function loadCompletedReviews() {
    const loadingEl = document.getElementById('completed-loading');
    const emptyEl = document.getElementById('completed-empty');
    const itemsEl = document.getElementById('completed-items');

    try {
        const response = await fetch('/api/reviews/my-reviews');
        if (!response.ok) throw new Error('Failed to load completed reviews');

        const data = await response.json();
        completedDataLoaded = true;

        // Hide loading
        loadingEl.classList.add('hidden');

        if (data.length === 0) {
            emptyEl.classList.remove('hidden');
            itemsEl.classList.add('hidden');
        } else {
            emptyEl.classList.add('hidden');
            itemsEl.classList.remove('hidden');
            itemsEl.innerHTML = data.map(review => renderCompletedReview(review)).join('');
        }
    } catch (error) {
        console.error('Error loading completed reviews:', error);
        loadingEl.innerHTML = '<div class="text-center text-red-500">Có lỗi xảy ra. Vui lòng thử lại.</div>';
    }
}

/**
 * Render một item sản phẩm chờ đánh giá
 */
function renderPendingItem(item) {
    return `
        <div class="border rounded-xl p-4 hover:shadow-md transition-shadow">
            <div class="flex gap-4">
                <img src="${item.productImage || '/images/placeholder.png'}" 
                     alt="${item.productName}"
                     class="w-20 h-20 object-cover rounded-lg border"
                     onerror="this.src='/images/placeholder.png'">
                <div class="flex-1 min-w-0">
                    <h4 class="font-medium text-gray-800 truncate">${item.productName}</h4>
                    <p class="text-sm text-gray-500 mt-1">
                        Phân loại: ${item.variantColor} - Size ${item.variantSize}
                    </p>
                    <p class="text-xs text-gray-400 mt-1">
                        Giao ngày: ${item.deliveredDate ? formatDate(item.deliveredDate) : 'N/A'}
                    </p>
                </div>
                <div class="flex items-center">
                    <button onclick="openReviewModalForItem('${item.variantId}', '${escapeHtml(item.productName)}', '${item.variantColor}', '${item.variantSize}', '${item.productImage}')"
                            class="px-6 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 text-sm font-medium transition">
                        Đánh Giá
                    </button>
                </div>
            </div>
        </div>
    `;
}

/**
 * Render một đánh giá đã hoàn thành
 */
function renderCompletedReview(review) {
    const stars = '★'.repeat(review.rating) + '☆'.repeat(5 - review.rating);
    const imagesHtml = review.imageUrls && review.imageUrls.length > 0
        ? `<div class="flex gap-2 mt-3">
            ${review.imageUrls.map(url => `
                <img src="${url}" alt="Review image" 
                     class="w-16 h-16 object-cover rounded-lg border cursor-pointer hover:opacity-80"
                     onclick="window.open('${url}', '_blank')"
                     onerror="this.style.display='none'">
            `).join('')}
           </div>`
        : '';

    return `
        <div class="border rounded-xl p-4 hover:shadow-md transition-shadow">
            <div class="flex gap-4">
                <img src="${review.productImage || '/images/placeholder.png'}" 
                     alt="${review.productName}"
                     class="w-20 h-20 object-cover rounded-lg border"
                     onerror="this.src='/images/placeholder.png'">
                <div class="flex-1 min-w-0">
                    <h4 class="font-medium text-gray-800 truncate">${review.productName}</h4>
                    <p class="text-sm text-gray-500">
                        Phân loại: ${review.variantColor} - Size ${review.variantSize}
                    </p>
                    <div class="flex items-center gap-2 mt-2">
                        <span class="text-yellow-400 text-lg">${stars}</span>
                        <span class="text-xs text-gray-400">${formatDate(review.reviewDate)}</span>
                    </div>
                    ${review.comment ? `<p class="text-sm text-gray-600 mt-2">${escapeHtml(review.comment)}</p>` : ''}
                    ${imagesHtml}
                </div>
            </div>
        </div>
    `;
}

/**
 * Mở modal đánh giá cho sản phẩm cụ thể
 */
function openReviewModalForItem(variantId, productName, color, size, imageUrl) {
    const modal = document.getElementById('reviewModal');

    // Lưu variantId vào form
    let variantInput = document.getElementById('variantIdInput');
    if (!variantInput) {
        variantInput = document.createElement('input');
        variantInput.type = 'hidden';
        variantInput.id = 'variantIdInput';
        variantInput.name = 'variantId';
        document.getElementById('reviewForm').appendChild(variantInput);
    }
    variantInput.value = variantId;

    // Gán thông tin sản phẩm vào modal
    document.getElementById('modalProductName').innerText = productName;
    document.getElementById('modalProductVariant').innerText = `Phân loại: ${color} - Size ${size}`;
    document.getElementById('modalProductImg').src = imageUrl || '/images/placeholder.png';

    // Reset form
    document.getElementById('reviewForm').reset();
    document.getElementById('imagePreview').innerHTML = '';
    document.getElementById('alertContainer').innerHTML = '';

    // Hiện modal
    modal.classList.remove('hidden');
    document.body.style.overflow = 'hidden';
}

/**
 * Khởi tạo xử lý submit form đánh giá
 */
function initReviewFormSubmit() {
    const form = document.getElementById('reviewForm');
    if (!form) return;

    form.addEventListener('submit', async (e) => {
        e.preventDefault();

        const variantId = document.getElementById('variantIdInput')?.value;
        const rating = document.querySelector('input[name="rating"]:checked')?.value;
        const comment = document.getElementById('comment')?.value;
        const imageInput = document.getElementById('imageInput');

        if (!variantId) {
            showAlert('Vui lòng chọn sản phẩm để đánh giá', 'error');
            return;
        }

        if (!rating) {
            showAlert('Vui lòng chọn số sao đánh giá', 'error');
            return;
        }

        // Tạo FormData
        const formData = new FormData();
        formData.append('variantId', variantId);
        formData.append('rating', rating);
        if (comment) formData.append('comment', comment);

        // Thêm ảnh
        if (imageInput && imageInput.files.length > 0) {
            for (let i = 0; i < Math.min(imageInput.files.length, 5); i++) {
                formData.append('images', imageInput.files[i]);
            }
        }

        try {
            const response = await fetch('/api/reviews', {
                method: 'POST',
                body: formData
            });

            const result = await response.json();

            if (result.success) {
                showAlert('Đánh giá thành công! Cảm ơn bạn.', 'success');

                // Reload data sau 1.5s
                setTimeout(() => {
                    closeReviewModal();
                    pendingDataLoaded = false;
                    completedDataLoaded = false;
                    loadPendingReviews();
                }, 1500);
            } else {
                showAlert(result.message || 'Có lỗi xảy ra', 'error');
            }
        } catch (error) {
            console.error('Error submitting review:', error);
            showAlert('Có lỗi xảy ra. Vui lòng thử lại.', 'error');
        }
    });
}

/**
 * Hiển thị thông báo trong modal
 */
function showAlert(message, type) {
    const container = document.getElementById('alertContainer');
    const bgColor = type === 'success' ? 'bg-green-100 text-green-700 border-green-200' : 'bg-red-100 text-red-700 border-red-200';

    container.innerHTML = `
        <div class="p-3 rounded-lg border ${bgColor}">
            ${message}
        </div>
    `;
}

/**
 * Helper: Format date
 */
function formatDate(dateString) {
    if (!dateString) return '';
    const date = new Date(dateString);
    return date.toLocaleDateString('vi-VN', {
        day: '2-digit',
        month: '2-digit',
        year: 'numeric',
        hour: '2-digit',
        minute: '2-digit'
    });
}

/**
 * Helper: Escape HTML
 */
function escapeHtml(text) {
    if (!text) return '';
    const div = document.createElement('div');
    div.textContent = text;
    return div.innerHTML;
}
