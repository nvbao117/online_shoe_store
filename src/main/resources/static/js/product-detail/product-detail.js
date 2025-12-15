document.addEventListener("DOMContentLoaded", () => {
    // ====== CONFIG ======
    const IMG_BASE = "/images/products/"; // khớp WebConfig: /images/products/**

    // ====== GET productId from Thymeleaf or URL ======
    const urlIdMatch = window.location.pathname.match(/product-detail\/([^/]+)/);
    const productId = window.__PRODUCT_ID__ || (urlIdMatch ? urlIdMatch[1] : null);
    if (!productId) {
        console.error("Missing productId (window.__PRODUCT_ID__)");
        return;
    }

    // ====== DOM ======
    const mainImg = document.getElementById("pd-main-image");
    const thumbsWrap = document.getElementById("pd-thumbs");

    const colorsWrap = document.getElementById("pd-colors");
    const sizesWrap = document.getElementById("pd-sizes");

    // (Nếu bạn có các id này trong HTML thì JS sẽ set luôn, không có cũng không sao)
    const nameEl = document.getElementById("pd-name");
    const priceEl = document.getElementById("pd-price");
    const brandEl = document.getElementById("pd-brand");
    const statusEl = document.getElementById("pd-status");
    const descEl = document.getElementById("pd-desc");
    const codeEl = document.getElementById("pd-code");
    const bcNameEl = document.getElementById("pd-breadcrumb-name");
    const buyNowBtn = document.querySelector(".btn-buy-now");
    const addCartBtn = document.querySelector(".btn-add-cart");
    const qtyInput = document.querySelector(".quantity-group .qty-input");

    // ====== STATE ======
    let product = null;
    let selectedColor = null;
    let selectedSize = null;

    let currentThumbIndex = 0;
    let currentThumbUrls = [];

    // ====== HELPERS ======
    function formatPrice(price) {
        if (price == null) return "";
        return new Intl.NumberFormat("vi-VN").format(price) + " đ";
    }

    // imageUrl có thể là:
    // - "Badminton/Yonex/.../main.png" (relative)
    // - "/images/products/Badminton/..." (absolute)
    // - "http(s)://..." (full)
    function toImageUrl(u) {
        if (!u) return "";
        if (u.startsWith("http://") || u.startsWith("https://")) return u;
        if (u.startsWith("/")) return u;
        return IMG_BASE + u;
    }

    function setMainImage(url) {
        if (!mainImg) return;
        mainImg.src = url || "";
    }

    function unique(arr) {
        return [...new Set(arr.filter(Boolean))];
    }

    function computeTotalStock(variants) {
        return (variants || []).reduce((sum, v) => sum + (v.stock || 0), 0);
    }

    // Lấy danh sách ảnh theo màu (ưu tiên ảnh trong variants, fallback về product.imageUrl)
    function getImagesForColor(color) {
        const vs = product?.variants || [];
        const matched = vs.filter(v => (v.color || "") === (color || "") && v.imageUrl);

        // ảnh từ variants (unique)
        const urls = unique(matched.map(v => toImageUrl(v.imageUrl)));

        // fallback: nếu không có ảnh variant thì dùng ảnh product
        if (urls.length === 0 && product?.imageUrl) {
            urls.push(toImageUrl(product.imageUrl));
        }

        return urls;
    }

    // Lấy sizes available theo màu (nếu muốn disable size không có)
    function getSizesForColor(color) {
        const vs = product?.variants || [];
        const sizes = vs
            .filter(v => (v.color || "") === (color || ""))
            .map(v => (v.size || "").trim())
            .filter(Boolean);
        return unique(sizes);
    }

    // ====== RENDER ======
    function renderThumbnails(urls) {
        if (!thumbsWrap) return;

        thumbsWrap.innerHTML = "";
        currentThumbUrls = urls || [];
        currentThumbIndex = 0;

        // Không có ảnh nào
        if (currentThumbUrls.length === 0) return;

        // Tạo thumbs
        currentThumbUrls.forEach((url, idx) => {
            const img = document.createElement("img");
            img.src = url;
            img.alt = "Thumb";
            img.className = "img-thumbnail thumb-item" + (idx === 0 ? " active" : "");
            img.style.cursor = "pointer";

            img.addEventListener("click", () => {
                // active
                thumbsWrap.querySelectorAll(".thumb-item").forEach(t => t.classList.remove("active"));
                img.classList.add("active");
                currentThumbIndex = idx;

                setMainImage(url);
            });

            thumbsWrap.appendChild(img);
        });

        // set main image = first thumb
        setMainImage(currentThumbUrls[0]);
    }

    function renderColors(colors) {
        if (!colorsWrap) return;
        colorsWrap.innerHTML = "";

        (colors || []).forEach((c, idx) => {
            const btn = document.createElement("button");
            btn.type = "button";
            btn.className = "btn btn-outline-secondary btn-sm color-option" + (idx === 0 ? " active" : "");
            btn.dataset.color = c;
            btn.textContent = c;

            btn.addEventListener("click", () => {
                // active button
                colorsWrap.querySelectorAll(".color-option").forEach(b => b.classList.remove("active"));
                btn.classList.add("active");

                selectedColor = c;

                // đổi bộ ảnh theo màu
                const imgs = getImagesForColor(selectedColor);
                renderThumbnails(imgs);

                // update sizes (disable size không có cho màu đó)
                updateSizeAvailability();
            });

            colorsWrap.appendChild(btn);
        });

        // default selectedColor
        selectedColor = (colors && colors.length > 0) ? colors[0] : null;
    }

    function renderSizes(sizes) {
        if (!sizesWrap) return;
        sizesWrap.innerHTML = "";

        const weight = ["XS", "S", "M", "L", "XL", "2XL", "3XL", "4XL"];
        function sortSizes(list) {
            return [...(list || [])].sort((a, b) => {
                if (!isNaN(a) && !isNaN(b)) return Number(a) - Number(b);
                const wa = weight.indexOf(String(a).toUpperCase());
                const wb = weight.indexOf(String(b).toUpperCase());
                if (wa !== -1 && wb !== -1) return wa - wb;
                if (wa !== -1) return -1;
                if (wb !== -1) return 1;
                return String(a).localeCompare(String(b));
            });
        }

        sortSizes(sizes).forEach((s, idx) => {
            const btn = document.createElement("button");
            btn.type = "button";
            btn.className = "btn btn-outline-secondary btn-sm size-option" + (idx === 0 ? " active" : "");
            btn.textContent = s;

            btn.addEventListener("click", () => {
                // ignore if disabled
                if (btn.disabled) return;

                sizesWrap.querySelectorAll(".size-option").forEach(b => b.classList.remove("active"));
                btn.classList.add("active");
                selectedSize = s;
            });

            sizesWrap.appendChild(btn);
        });

        // default selectedSize
        selectedSize = (sizes && sizes.length > 0) ? sizes[0] : null;
    }

    function updateSizeAvailability() {
        if (!sizesWrap) return;
        if (!selectedColor) return;

        const available = new Set(getSizesForColor(selectedColor));
        const sizeButtons = sizesWrap.querySelectorAll(".size-option");

        sizeButtons.forEach(btn => {
            const sizeValue = (btn.textContent || "").trim();
            const ok = available.size === 0 ? true : available.has(sizeValue); // nếu DB chưa có variants thì không disable

            btn.disabled = !ok;
            btn.style.opacity = ok ? "1" : "0.4";
            btn.style.cursor = ok ? "pointer" : "not-allowed";

            // Nếu đang active mà bị disable thì bỏ active
            if (!ok && btn.classList.contains("active")) {
                btn.classList.remove("active");
            }
        });

        // nếu selectedSize bị disable, chọn size đầu tiên còn dùng được
        const active = sizesWrap.querySelector(".size-option.active");
        if (!active) {
            const firstEnabled = Array.from(sizeButtons).find(b => !b.disabled);
            if (firstEnabled) {
                firstEnabled.classList.add("active");
                selectedSize = (firstEnabled.textContent || "").trim();
            }
        }
    }

    function renderProduct(p) {
        product = p;

        if (bcNameEl) bcNameEl.textContent = p.name || "Chi tiết sản phẩm";
        if (nameEl) nameEl.textContent = p.name || "";
        if (priceEl) priceEl.textContent = formatPrice(p.price);

        // Nếu bạn chưa có mã sản phẩm riêng, tạm dùng productId
        if (codeEl) codeEl.textContent = p.productId || "---";

        if (brandEl) brandEl.textContent = p.brandName || "---";

        // status theo tổng stock
        if (statusEl) {
            const totalStock = computeTotalStock(p.variants);
            statusEl.textContent = totalStock > 0 ? "Còn hàng" : "Hết hàng";
        }

        // mô tả: nếu là HTML thì innerHTML (bạn đang dùng nhiều <p>, <li>... thì phù hợp)
        if (descEl) descEl.innerHTML = p.description || "";

        // render colors & sizes
        renderColors(p.colors || []);
        renderSizes(p.sizes || []);

        // render images theo màu mặc định
        const imgs = selectedColor ? getImagesForColor(selectedColor) : [];
        if (imgs.length > 0) {
            renderThumbnails(imgs);
        } else {
            // fallback chỉ set ảnh product
            const main = toImageUrl(p.imageUrl);
            if (main) setMainImage(main);
            if (thumbsWrap) thumbsWrap.innerHTML = "";
        }

        // disable size theo màu
        updateSizeAvailability();
    }

    // ====== MAIN IMAGE CLICK = next thumb ======
    if (mainImg) {
        mainImg.style.cursor = "pointer";
        mainImg.addEventListener("click", () => {
            if (!currentThumbUrls || currentThumbUrls.length === 0) return;
            currentThumbIndex = (currentThumbIndex + 1) % currentThumbUrls.length;

            // active thumb
            if (thumbsWrap) {
                const thumbItems = thumbsWrap.querySelectorAll(".thumb-item");
                thumbItems.forEach(t => t.classList.remove("active"));
                if (thumbItems[currentThumbIndex]) thumbItems[currentThumbIndex].classList.add("active");
            }

            setMainImage(currentThumbUrls[currentThumbIndex]);
        });
    }

    // ====== QUANTITY (+ / -) giữ y nguyên logic của bạn ======
    const qtyGroup = document.querySelector(".quantity-group");
    if (qtyGroup) {
        const btnMinus = qtyGroup.querySelector(".btn-qty-minus");
        const btnPlus = qtyGroup.querySelector(".btn-qty-plus");

        function getQuantity() {
            const value = parseInt(qtyInput?.value || "1", 10);
            return isNaN(value) || value < 1 ? 1 : value;
        }

        function normalizeQty() {
            let value = parseInt(qtyInput.value, 10);
            if (isNaN(value) || value < 1) value = 1;
            qtyInput.value = value;
            return value;
        }

        btnPlus?.addEventListener("click", () => {
            const current = normalizeQty();
            qtyInput.value = current + 1;
        });

        btnMinus?.addEventListener("click", () => {
            const current = normalizeQty();
            if (current > 1) qtyInput.value = current - 1;
        });

        qtyInput?.addEventListener("blur", normalizeQty);

        // ====== ACTIONS: Buy Now & Add to Cart ======
        function findVariantId() {
            const vs = product?.variants || [];
            const match = vs.find(v =>
                (!selectedColor || v.color === selectedColor) &&
                (!selectedSize || v.size === selectedSize)
            );
            return match?.variantId;
        }

        async function handleBuyNow() {
            const variantId = findVariantId();
            if (!variantId) {
                alert("Vui lòng chọn phân loại sản phẩm");
                return;
            }
            const quantity = getQuantity();
            try {
                const res = await fetch("/api/checkout/buy-now", {
                    method: "POST",
                    headers: { "Content-Type": "application/json" },
                    body: JSON.stringify({ variantId, quantity })
                });
                if (!res.ok) {
                    const text = await res.text();
                    throw new Error(text || `Lỗi ${res.status}`);
                }
                const data = await res.json();
                if (!data.draftId) {
                    throw new Error("Không nhận được draftId");
                }
                window.location.href = `/checkout/step1?draftId=${encodeURIComponent(data.draftId)}`;
            } catch (err) {
                console.error("Buy now failed", err);
                alert("Không thể mua ngay. Vui lòng thử lại.");
            }
        }

        async function handleAddToCart() {
            const variantId = findVariantId();
            if (!variantId) {
                alert("Vui lòng chọn phân loại sản phẩm");
                return;
            }
            const quantity = getQuantity();
            try {
                const res = await fetch("/api/cart/items", {
                    method: "POST",
                    headers: { "Content-Type": "application/json" },
                    body: JSON.stringify({ variantId, quantity })
                });
                if (!res.ok) {
                    const text = await res.text();
                    throw new Error(text || `Lỗi ${res.status}`);
                }
                await res.json();
                alert("Đã thêm vào giỏ hàng");
            } catch (err) {
                console.error("Add to cart failed", err);
                alert("Không thể thêm vào giỏ. Vui lòng thử lại.");
            }
        }

        buyNowBtn?.addEventListener("click", handleBuyNow);
        addCartBtn?.addEventListener("click", handleAddToCart);
    }

    // ====== FETCH API & START ======
    fetch(`/api/products/${productId}`)
        .then(r => {
            if (!r.ok) throw new Error(`API error: ${r.status}`);
            return r.json();
        })
        .then(renderProduct)
        .catch(err => {
            console.error("Failed to load product detail:", err);
            // Nếu API chưa làm (phần C), bạn sẽ thấy lỗi ở đây — bình thường.
        });
});
