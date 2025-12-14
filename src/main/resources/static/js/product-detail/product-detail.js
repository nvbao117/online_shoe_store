document.addEventListener("DOMContentLoaded", function () {
    const mainImg = document.querySelector('.product-main-image');
    const thumbs = document.querySelectorAll('.thumb-item');

    const colorButtons = document.querySelectorAll('.color-option');
    const sizeButtons = document.querySelectorAll('.size-option');


// Map màu → danh sách ảnh (0 là ảnh chính, 1..n là thumbnails)
    const colorImageMap = {
        BlackGray: [
            '/images/products/yonex-cascade-driver-3/BlackGray/main.png',
            '/images/products/yonex-cascade-driver-3/BlackGray/thumb-1.png',
            '/images/products/yonex-cascade-driver-3/BlackGray/thumb-2.png',
            '/images/products/yonex-cascade-driver-3/BlackGray/thumb-3.png',
            '/images/products/yonex-cascade-driver-3/BlackGray/thumb-4.png'
        ],
        LightBeige: [
            '/images/products/yonex-cascade-driver-3/LightBeige/main.png',
            '/images/products/yonex-cascade-driver-3/LightBeige/thumb-1.png',
            '/images/products/yonex-cascade-driver-3/LightBeige/thumb-2.png',
            '/images/products/yonex-cascade-driver-3/LightBeige/thumb-3.png',
            '/images/products/yonex-cascade-driver-3/LightBeige/thumb-4.png'
        ],
        PeacockBlue: [
            '/images/products/yonex-cascade-driver-3/PeacockBlue/main.png',
            '/images/products/yonex-cascade-driver-3/PeacockBlue/thumb-1.png',
            '/images/products/yonex-cascade-driver-3/PeacockBlue/thumb-2.png',
            '/images/products/yonex-cascade-driver-3/PeacockBlue/thumb-3.png',
            '/images/products/yonex-cascade-driver-3/PeacockBlue/thumb-4.png'
        ]
    };


    let currentIndex = 0; // index thumbnail đang active

    function applyColor(colorKey) {
        const images = colorImageMap[colorKey];
        if (!images || images.length === 0 || !mainImg) return;

        // cập nhật ảnh chính
        mainImg.src = images[0];

        // cập nhật thumbnails
        thumbs.forEach((thumb, i) => {
            if (images[i]) {
                thumb.src = images[i];
                thumb.style.display = '';
            } else {
                thumb.style.display = 'none'; // nếu ít ảnh hơn số thumbnail
            }
        });

        // reset trạng thái active của thumbnail
        thumbs.forEach(t => t.classList.remove('active'));
        currentIndex = 0;
        if (thumbs[0]) {
            thumbs[0].classList.add('active');
        }
    }

    // Click vào nút màu → đổi bộ ảnh
    colorButtons.forEach(btn => {
        btn.addEventListener('click', function () {
            // đổi nút active
            colorButtons.forEach(b => b.classList.remove('active'));
            this.classList.add('active');

            const colorKey = this.dataset.color;
            applyColor(colorKey);
        });
    });

    // Click vào size → đổi nút active
    sizeButtons.forEach(btn => {
        btn.addEventListener('click', function () {
            sizeButtons.forEach(b => b.classList.remove('active'));
            this.classList.add('active');
            // nếu sau này cần dùng size đã chọn thì lấy: this.textContent.trim()
        });
    });

// Khi load trang, apply màu đầu tiên (nút đang active)
    const firstColorBtn = document.querySelector('.color-option.active');
    if (firstColorBtn) {
        applyColor(firstColorBtn.dataset.color);
    }


    // Khi nhấp vào thumbnail
    thumbs.forEach((thumb, index) => {
        thumb.style.cursor = 'pointer';

        thumb.addEventListener('click', function () {
            const newSrc = this.getAttribute('data-full') || this.src;
            mainImg.src = newSrc;

            thumbs[currentIndex].classList.remove('active');
            currentIndex = index;
            this.classList.add('active');
        });
    });

    // Khi nhấp vào ảnh lớn → chuyển sang hình tiếp theo
    if (mainImg) {
        mainImg.style.cursor = 'pointer';

        mainImg.addEventListener('click', function () {
            if (thumbs.length === 0) return;

            currentIndex = (currentIndex + 1) % thumbs.length;
            const nextThumb = thumbs[currentIndex];
            const newSrc = nextThumb.getAttribute('data-full') || nextThumb.src;
            mainImg.src = newSrc;

            thumbs.forEach(t => t.classList.remove('active'));
            nextThumb.classList.add('active');
        });
    }

    // ====== Xử lý tăng / giảm số lượng ======
    const qtyGroup = document.querySelector('.quantity-group');
    if (qtyGroup) {
        const qtyInput = qtyGroup.querySelector('.qty-input');
        const btnMinus = qtyGroup.querySelector('.btn-qty-minus');
        const btnPlus  = qtyGroup.querySelector('.btn-qty-plus');

        // Hàm chuẩn hoá giá trị, không cho nhỏ hơn 1
        function normalizeQty() {
            let value = parseInt(qtyInput.value, 10);
            if (isNaN(value) || value < 1) {
                value = 1;
            }
            qtyInput.value = value;
            return value;
        }

        btnPlus.addEventListener('click', function () {
            const current = normalizeQty();
            qtyInput.value = current + 1;
        });

        btnMinus.addEventListener('click', function () {
            const current = normalizeQty();
            if (current > 1) {        // không cho về 0 hoặc âm
                qtyInput.value = current - 1;
            }
        });

        // Khi người dùng tự gõ rồi rời ô, tự chỉnh lại
        qtyInput.addEventListener('blur', normalizeQty);
    }
});
