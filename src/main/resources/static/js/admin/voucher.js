// JS cho trang quản lý voucher
// Ở đây mình làm vài chức năng đơn giản để bạn dễ mở rộng sau này:
// - Lọc voucher theo ô search
// - Console log khi nhấn Create / Save

document.addEventListener("DOMContentLoaded", function () {
    const searchInput = document.getElementById("voucherSearchInput");
    const voucherTable = document.getElementById("voucherTable");
    const btnCreate = document.getElementById("btnCreateVoucher");
    const btnSave = document.getElementById("btnSaveVoucher");

    /* ========== LỌC VOUCHER THEO TÊN / CODE ========== */
    if (searchInput && voucherTable) {
        searchInput.addEventListener("keyup", function () {
            const filter = searchInput.value.toLowerCase();
            const rows = voucherTable.querySelectorAll("tbody tr");

            rows.forEach(row => {
                const name = row.cells[0].textContent.toLowerCase(); // Voucher Name
                const code = row.cells[1].textContent.toLowerCase(); // Code

                if (name.includes(filter) || code.includes(filter)) {
                    row.style.display = "";
                } else {
                    row.style.display = "none";
                }
            });
        });
    }

    /* ========== CLICK NÚT SAVE ========== */
    if (btnSave) {
        btnSave.addEventListener("click", function () {
            // TODO: sau này call API để lưu trạng thái voucher
            console.log("Save voucher clicked");
        });
    }

    /* ========== CLICK ĐỔI TRẠNG THÁI ACTIVE <-> INACTIVE ========== */
    const statusButtons = document.querySelectorAll(".status-badge");

    statusButtons.forEach(button => {
        // bỏ qua nút Expired (đã bị chặn click bằng CSS, nhưng vẫn check cho chắc)
        if (button.classList.contains("status-expired")) {
            return;
        }

        button.addEventListener("click", function () {
            // nếu đang Active -> chuyển sang Inactive
            if (button.classList.contains("status-active")) {
                button.classList.remove("status-active");
                button.classList.add("status-inactive");
                button.textContent = "Inactive";
            }
            // nếu đang Inactive -> chuyển sang Active
            else if (button.classList.contains("status-inactive")) {
                button.classList.remove("status-inactive");
                button.classList.add("status-active");
                button.textContent = "Active";
            }

            // TODO: sau này bạn có thể gửi AJAX về backend để lưu trạng thái mới
        });
    });

    /* ========== SUBMIT FORM TẠO VOUCHER (voucher-create) ========== */
    const voucherCreateForm = document.getElementById("voucherCreateForm");

    if (voucherCreateForm) {
        const discountInput = document.getElementById("discountValueInput");
        const minOrderInput = document.getElementById("minOrderValueInput");
        const startDateInput = document.getElementById("startDateInput");
        const endDateInput = document.getElementById("endDateInput");

        voucherCreateForm.addEventListener("submit", function (e) {
            // ----- VALIDATE NGÀY -----
            const startValue = startDateInput.value;
            const endValue = endDateInput.value;

            if (!startValue || !endValue) {
                e.preventDefault();
                alert("Vui lòng chọn Start Date và End Date.");
                return;
            }

            const startDate = new Date(startValue);
            const endDate = new Date(endValue);

            if (endDate < startDate) {
                e.preventDefault();
                alert("End Date phải lớn hơn hoặc bằng Start Date.");
                return;
            }

            // ----- VALIDATE SỐ GIẢM GIÁ / MIN ORDER > 0 -----
            const discount = Number(discountInput.value);
            const minOrder = Number(minOrderInput.value);

            if (discount <= 0 || minOrder <= 0 || isNaN(discount) || isNaN(minOrder)) {
                e.preventDefault();
                alert("Discount value và Minimum order value phải là số lớn hơn 0.");
                return;
            }

            // TODO: submit form lên backend
            console.log("Submit form tạo voucher");
            e.preventDefault(); // tạm chặn submit thật
        });
    }

    /* ========== BẬT / TẮT CÁC Ô DETAIL THEO SCOPE OF VOUCHER ========== */
    const scopeAllRadio = document.getElementById("scopeAll");
    const scopeCategoryRadio = document.getElementById("scopeCategory");
    const scopeBrandRadio = document.getElementById("scopeBrand");
    const scopeProductRadio = document.getElementById("scopeProduct");

    const categorySelect = document.getElementById("categorySelect");
    const brandSelect = document.getElementById("brandSelect");
    const productSelect = document.getElementById("productSelect");

    function updateDetailFields() {
        if (!categorySelect || !brandSelect || !productSelect) return;

        // 1. All Products: khóa hết 3 ô
        if (scopeAllRadio && scopeAllRadio.checked) {
            categorySelect.disabled = true;
            brandSelect.disabled = true;
            productSelect.disabled = true;
        }
        // 2. By Category: chỉ mở Category
        else if (scopeCategoryRadio && scopeCategoryRadio.checked) {
            categorySelect.disabled = false;
            brandSelect.disabled = true;
            productSelect.disabled = true;
        }
        // 3. By Brand: mở Category + Brand
        else if (scopeBrandRadio && scopeBrandRadio.checked) {
            categorySelect.disabled = false;
            brandSelect.disabled = false;
            productSelect.disabled = true;
        }
        // 4. By Specific Products: mở cả 3
        else if (scopeProductRadio && scopeProductRadio.checked) {
            categorySelect.disabled = false;
            brandSelect.disabled = false;
            productSelect.disabled = false;
        }
    }

    // Gắn sự kiện change cho các radio
    [scopeAllRadio, scopeCategoryRadio, scopeBrandRadio, scopeProductRadio].forEach(r => {
        if (r) {
            r.addEventListener("change", updateDetailFields);
        }
    });

    // Gọi 1 lần khi load trang để set trạng thái ban đầu
    updateDetailFields();
});
