document.addEventListener("DOMContentLoaded", () => {
    // ====== 1. CONFIG ======
    const IMG_BASE = "/images/products/";

    // Lấy ProductId từ URL
    const urlIdMatch = window.location.pathname.match(/product-detail\/([^/]+)/);
    const productId = urlIdMatch ? urlIdMatch[1] : null;
    if (!productId) {
        console.error("Missing productId in URL.");
        return;
    }

    // ====== 2. DOM ELEMENTS ======
    const els = {
        mainImg: document.getElementById("pd-main-image"),
        thumbsWrap: document.getElementById("pd-thumbs"),
        colorsWrap: document.getElementById("pd-colors"),
        sizesWrap: document.getElementById("pd-sizes"),
        name: document.getElementById("pd-name"),
        price: document.getElementById("pd-price"),
        brand: document.getElementById("pd-brand"),
        status: document.getElementById("pd-status"),
        desc: document.getElementById("pd-desc"),
        code: document.getElementById("pd-code"),
        bcName: document.getElementById("pd-breadcrumb-name"),
        // Các nút hành động
        buyNowBtn: document.querySelector(".btn-buy-now"),
        addCartBtn: document.querySelector(".btn-add-cart"),
        qtyInput: document.querySelector(".quantity-group .qty-input"),
        // Thêm cái này để không bị lỗi ReferenceError
        cartBadge: document.getElementById("cart-badge")
    };

    // ====== 3. STATE ======
    let product = null;
    let selectedColor = null;
    let selectedSize = null;
    let currentThumbUrls = [];

    // ====== 4. HELPERS ======
    function formatPrice(price) {
        if (price == null) return "";
        return new Intl.NumberFormat("vi-VN").format(price) + " đ";
    }

    function toImageUrl(u) {
        if (!u) return "";
        if (u.startsWith("http") || u.startsWith("/")) return u;
        return IMG_BASE + u;
    }

    function unique(arr) {
        return [...new Set(arr.filter(Boolean))];
    }

    // Lấy ảnh theo màu
    function getImagesForColor(color) {
        const vs = product?.variants || [];
        const matched = vs.filter(v => (v.color || "") === (color || "") && v.imageUrl);
        const urls = unique(matched.map(v => toImageUrl(v.imageUrl)));

        // Fallback: nếu variant không có ảnh riêng -> lấy ảnh chính product
        if (urls.length === 0 && product?.imageUrl) {
            urls.push(toImageUrl(product.imageUrl));
        }
        return urls;
    }

    // Lấy size theo màu
    function getSizesForColor(color) {
        const vs = product?.variants || [];
        return unique(vs
            .filter(v => (v.color || "") === (color || "") && v.stock > 0) // Chỉ lấy size còn hàng
            .map(v => (v.size || "").trim())
        );
    }

    // ====== 5. RENDER FUNCTIONS ======

    // Render ảnh nhỏ
    function renderThumbnails(urls) {
        if (!els.thumbsWrap) return;
        els.thumbsWrap.innerHTML = "";
        currentThumbUrls = urls || [];

        if (currentThumbUrls.length > 0 && els.mainImg) {
            els.mainImg.src = currentThumbUrls[0]; // Set ảnh chính mặc định
        }

        currentThumbUrls.forEach((url, idx) => {
            const img = document.createElement("img");
            img.src = url;
            img.className = "img-thumbnail thumb-item" + (idx === 0 ? " active" : "");
            img.style.cursor = "pointer";
            img.onclick = () => {
                if (els.mainImg) els.mainImg.src = url;
                document.querySelectorAll(".thumb-item").forEach(t => t.classList.remove("active"));
                img.classList.add("active");
            };
            els.thumbsWrap.appendChild(img);
        });
    }

    // Render Màu
    function renderColors(colors) {
        if (!els.colorsWrap) return;
        els.colorsWrap.innerHTML = "";

        (colors || []).forEach((c, idx) => {
            const btn = document.createElement("button");
            btn.className = "btn btn-outline-secondary btn-sm color-option me-2 mb-2" + (idx === 0 ? " active" : "");
            btn.textContent = c;

            btn.onclick = () => {
                document.querySelectorAll(".color-option").forEach(b => b.classList.remove("active"));
                btn.classList.add("active");

                selectedColor = c;
                selectedSize = null; // Reset size khi đổi màu

                renderThumbnails(getImagesForColor(selectedColor));
                renderSizes(); // Render lại size theo màu mới
            };
            els.colorsWrap.appendChild(btn);
        });

        // Default: chọn màu đầu tiên
        if (colors && colors.length > 0) {
            selectedColor = colors[0];
        }
    }

    // Render Size (Logic sort + disable)
    function renderSizes() {
        if (!els.sizesWrap) return;
        els.sizesWrap.innerHTML = "";

        // Sort logic: Số -> XS/S/M -> Chữ
        const weight = ["XS", "S", "M", "L", "XL", "2XL", "3XL", "4XL"];
        const allSizes = [...product.sizes].sort((a, b) => { // Sắp xếp list gốc
            if (!isNaN(a) && !isNaN(b)) return Number(a) - Number(b);
            const wa = weight.indexOf(String(a).toUpperCase());
            const wb = weight.indexOf(String(b).toUpperCase());
            if (wa !== -1 && wb !== -1) return wa - wb;
            return String(a).localeCompare(String(b));
        });

        // Lấy list size khả dụng cho màu hiện tại
        const availableSizes = getSizesForColor(selectedColor);

        allSizes.forEach(s => {
            const isAvailable = availableSizes.includes(s);
            const btn = document.createElement("button");
            btn.className = "btn btn-outline-secondary btn-sm size-option me-2 mb-2";
            btn.textContent = s;

            if (!isAvailable) {
                btn.disabled = true;
                btn.style.opacity = "0.5";
                btn.style.cursor = "not-allowed";
            } else {
                btn.onclick = () => {
                    document.querySelectorAll(".size-option").forEach(b => {
                        if (!b.disabled) {
                            b.classList.remove("active", "bg-primary", "text-white");
                            b.classList.add("btn-outline-secondary");
                        }
                    });
                    btn.classList.remove("btn-outline-secondary");
                    btn.classList.add("active", "bg-primary", "text-white");
                    selectedSize = s;
                };
            }
            els.sizesWrap.appendChild(btn);
        });
    }

    function renderProduct(p) {
        product = p;
        if (els.name) els.name.textContent = p.name;
        if (els.bcName) els.bcName.textContent = p.name;
        if (els.price) els.price.textContent = formatPrice(p.price);
        if (els.code) els.code.textContent = p.productId;
        if (els.brand) els.brand.textContent = p.brandName;
        if (els.desc) els.desc.innerHTML = p.description;

        const totalStock = (p.variants || []).reduce((sum, v) => sum + (v.stock || 0), 0);
        if (els.status) {
            els.status.textContent = totalStock > 0 ? "Còn hàng" : "Hết hàng";
            els.status.className = totalStock > 0 ? "text-success fw-bold" : "text-danger fw-bold";
        }

        // Render variants
        renderColors(p.colors || []);

        // Trigger render lần đầu
        if (selectedColor) {
            renderThumbnails(getImagesForColor(selectedColor));
            renderSizes();
        } else if (p.imageUrl) {
            // Trường hợp không có màu
            if (els.mainImg) els.mainImg.src = toImageUrl(p.imageUrl);
        }
    }


    // ====== 6. EVENTS & ACTIONS ======

    // Logic số lượng
    const qtyGroup = document.querySelector(".quantity-group");
    if (qtyGroup) {
        const btnMinus = qtyGroup.querySelector(".btn-qty-minus");
        const btnPlus = qtyGroup.querySelector(".btn-qty-plus");

        const getQty = () => {
            const v = parseInt(els.qtyInput?.value || 1);
            return (isNaN(v) || v < 1) ? 1 : v;
        };

        if (btnPlus) btnPlus.onclick = () => els.qtyInput.value = getQty() + 1;
        if (btnMinus) btnMinus.onclick = () => {
            const v = getQty();
            if (v > 1) els.qtyInput.value = v - 1;
        };
    }

    // Logic Mua hàng / Thêm giỏ
    function getOrderPayload() {
        if (!selectedSize) {
            alert("⚠️ Vui lòng chọn Size giày trước khi mua!");
            return null;
        }
        const qty = els.qtyInput ? parseInt(els.qtyInput.value) : 1;
        return {
            productId: productId,
            size: selectedSize,
            quantity: qty
        };
    }

    // Kiểm tra authentication trước khi thực hiện hành động
    async function checkAuth() {
        try {
            const res = await fetch("/api/me", {
                credentials: "include"
            });
            return res.ok;
        } catch (e) {
            return false;
        }
    }

    async function handleCartAction(isBuyNow) {
        const payload = getOrderPayload();
        if (!payload) return;

        // ✅ Kiểm tra đăng nhập trước khi gọi API
        const isAuthenticated = await checkAuth();
        if (!isAuthenticated) {
            alert("Vui lòng đăng nhập trước khi mua hàng");
            return;
        }

        try {
            const res = await fetch("/api/cart/add", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(payload),
                credentials: "include"
            });

            if (res.status === 401) {
                alert("Vui lòng đăng nhập trước khi mua hàng");
                return;
            }

            if (!res.ok) {
                const err = await res.json();
                throw new Error(err.message || "Lỗi server");
            }

            const data = await res.json();

            // Cập nhật chấm đỏ
            const badge = els.cartBadge || document.getElementById("cart-badge");
            if (badge && data.cartCount !== undefined) {
                badge.innerText = data.cartCount;
                badge.classList.remove('d-none');

                // Anim
                badge.style.transition = "transform 0.2s";
                badge.style.transform = "scale(1.5)";
                setTimeout(() => badge.style.transform = "scale(1)", 200);
            }

            if (isBuyNow) {
                window.location.href = `/templates/cart?buyNowItem=${productId}&size=${encodeURIComponent(selectedSize)}`;
            } else {
                alert("✅ " + data.message);
            }
        } catch (e) {
            console.error(e);
            alert("❌ " + e.message);
        }
    }

    // Gắn sự kiện click
    if (els.addCartBtn) els.addCartBtn.onclick = () => handleCartAction(false);
    if (els.buyNowBtn) els.buyNowBtn.onclick = () => handleCartAction(true);


    // ====== 7. INITIAL LOAD (Đã đưa ra ngoài khối if qtyGroup) ======
    fetch(`/api/products/${productId}`)
        .then(res => {
            if (!res.ok) throw new Error("API Error");
            return res.json();
        })
        .then(renderProduct)
        .catch(err => {
            console.error(err);
            if (els.name) els.name.textContent = "Không tìm thấy sản phẩm";
        });

    // Load lại số lượng giỏ hàng để cập nhật badge nếu user F5 trang
    fetch('/api/cart/count', {
        credentials: "include"
    })
        .then(res => {
            if (!res.ok) return null;
            return res.json();
        })
        .then(data => {
            if (data && els.cartBadge && data.count > 0) {
                els.cartBadge.textContent = data.count;
                els.cartBadge.classList.remove('d-none');
            }
        }).catch(e => { 
            // Ignore error - user chưa đăng nhập hoặc có lỗi
        });
});