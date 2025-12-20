/**
 * CLIP Semantic Search - Header Search Functionality
 * Handles both text and image search in the header search bar
 */

const CLIP_SERVICE_URL = 'http://localhost:8001';

document.addEventListener('DOMContentLoaded', function () {
    console.log('CLIP Search JS loaded!');

    const clipSearchForm = document.getElementById('clipSearchForm');
    const mainSearchInput = document.getElementById('mainSearchInput');
    const clipResults = document.getElementById('clip-search-results');
    const clipResultsContent = document.getElementById('clip-results-content');
    const closeClipResults = document.getElementById('closeClipResults');
    const searchResultTitle = document.getElementById('searchResultTitle');
    const imageSearchBtn = document.getElementById('imageSearchBtn');
    const imageSearchInput = document.getElementById('imageSearchInput');

    console.log('imageSearchBtn:', imageSearchBtn);
    console.log('imageSearchInput:', imageSearchInput);

    // ===================== TEXT SEARCH =====================
    if (clipSearchForm) {
        clipSearchForm.addEventListener('submit', async (e) => {
            e.preventDefault();

            const query = mainSearchInput.value.trim();
            if (!query) return;

            showLoading('🔍 Đang tìm kiếm...');
            if (searchResultTitle) searchResultTitle.textContent = '🔍 Kết quả tìm kiếm';

            try {
                const res = await fetch(`${CLIP_SERVICE_URL}/api/search/text`, {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify({ query: query, top_k: 12 })
                });
                const data = await res.json();

                if (data.error) {
                    showError(data.error);
                    return;
                }

                renderResults(data.results || []);
            } catch (err) {
                showError(err.message);
            }
        });
    }

    // ===================== IMAGE SEARCH =====================
    if (imageSearchBtn && imageSearchInput) {
        imageSearchBtn.addEventListener('click', () => {
            imageSearchInput.click();
        });

        imageSearchInput.addEventListener('change', async (e) => {
            const file = e.target.files[0];
            if (!file) return;

            showLoading('📷 Đang tìm kiếm bằng hình ảnh...');

            try {
                const formData = new FormData();
                formData.append('file', file);

                const res = await fetch(`${CLIP_SERVICE_URL}/api/search/image?top_k=20`, {
                    method: 'POST',
                    body: formData
                });
                const data = await res.json();

                const results = data.results || [];
                if (results.length === 0) {
                    showError('Không tìm thấy sản phẩm tương tự');
                    return;
                }

                // Store results in sessionStorage and redirect to products page
                const productIds = results.map(item => item.product_id);
                sessionStorage.setItem('imageSearchResults', JSON.stringify(productIds));
                sessionStorage.setItem('imageSearchQuery', '📷 Tìm kiếm bằng hình ảnh');

                // Redirect to products page with image search flag
                window.location.href = '/products?imageSearch=true';

            } catch (err) {
                showError(err.message);
            }

            // Reset file input
            imageSearchInput.value = '';
        });
    }

    // ===================== CLOSE BUTTON =====================
    if (closeClipResults) {
        closeClipResults.addEventListener('click', () => {
            if (clipResults) clipResults.classList.add('d-none');
        });
    }

    // ===================== CLOSE ON OUTSIDE CLICK =====================
    document.addEventListener('click', (e) => {
        if (clipResults && clipSearchForm &&
            !clipResults.contains(e.target) &&
            !clipSearchForm.contains(e.target)) {
            clipResults.classList.add('d-none');
        }
    });

    // ===================== HELPER FUNCTIONS =====================
    function showLoading(message) {
        if (clipResultsContent) {
            clipResultsContent.innerHTML = `<div class="text-center p-3"><div class="spinner-border spinner-border-sm"></div> ${message}</div>`;
        }
        if (clipResults) clipResults.classList.remove('d-none');
    }

    function showError(message) {
        if (clipResultsContent) {
            clipResultsContent.innerHTML = `<div class="text-danger p-3">Lỗi: ${message}</div>`;
        }
    }

    function renderResults(results) {
        if (!clipResultsContent) return;

        if (results.length === 0) {
            clipResultsContent.innerHTML = '<div class="text-muted p-3">Không tìm thấy sản phẩm phù hợp</div>';
            return;
        }

        clipResultsContent.innerHTML = results.map(item => `
            <a href="/product-detail/${item.product_id}" class="image-result-item">
                <img src="${item.image_url || '/images/placeholder.jpg'}" 
                     onerror="this.src='/images/placeholder.jpg'" alt="">
                <div class="info">
                    <div class="name">${item.product_name || 'Sản phẩm'}</div>
                    <div class="price">${formatPrice(item.price)}đ</div>
                    <div class="similarity">🎯 ${(item.similarity * 100).toFixed(0)}% phù hợp</div>
                </div>
            </a>
        `).join('');
    }

    function formatPrice(price) {
        if (!price) return '0';
        return Number(price).toLocaleString('vi-VN');
    }
});
