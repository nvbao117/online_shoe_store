// JS quản lý Voucher: danh sách + form tạo mới

document.addEventListener("DOMContentLoaded", () => {
    const tableBody = document.getElementById("voucherTableBody");
    const createForm = document.getElementById("voucherCreateForm");

        if (tableBody) {
            initVoucherStatusPage();
        }

        if (createForm) {
            initVoucherCreatePage();
        }
    });

    /* ================== COMMON HELPERS ================== */
    let voucherToast;
    let toastTimer;

    function getToastElement() {
        if (!voucherToast) {
            voucherToast = document.createElement("div");
            voucherToast.className = "voucher-toast";
            document.body.appendChild(voucherToast);
        }
        return voucherToast;
    }

    function showToast(message) {
        const toast = getToastElement();
        toast.textContent = message;
        toast.style.display = "block";

        if (toastTimer) clearTimeout(toastTimer);
        toastTimer = setTimeout(() => {
            toast.style.display = "none";
        }, 2800);
    }

    function formatStatusLabel(status) {
        switch (status) {
            case "ACTIVE":
                return "Active";
            case "INACTIVE":
                return "Inactive";
            case "EXPIRED":
                return "Expired";
            default:
                return status;
        }
    }

    function getStatusClass(status) {
        if (status === "EXPIRED") return "status-expired";
        if (status === "ACTIVE") return "status-active";
        return "status-inactive";
    }

    /* ================== VOUCHER STATUS PAGE ================== */
    function initVoucherStatusPage() {
        const searchInput = document.getElementById("voucherSearchInput");
        const voucherTable = document.getElementById("voucherTable");
        const tableBody = document.getElementById("voucherTableBody");
        const saveButton = document.getElementById("btnSaveVoucher");
        const emptyState = document.getElementById("voucherEmptyState");

        let vouchers = [];
        const pendingChanges = {};

        const refreshEmptyState = () => {
            if (!emptyState) return;
            const isEmpty = vouchers.length === 0;
            emptyState.hidden = !isEmpty;
            voucherTable.style.display = isEmpty ? "none" : "table";
        };

        const updateSaveButtonState = () => {
            const hasChanges = Object.keys(pendingChanges).length > 0;
            saveButton.disabled = !hasChanges;
        };

        const handleSearch = () => {
            const filter = searchInput.value.trim().toLowerCase();
            const rows = tableBody.querySelectorAll("tr");
            rows.forEach(row => {
                const name = row.dataset.name;
                const code = row.dataset.code;
                row.style.display = name.includes(filter) || code.includes(filter) ? "" : "none";
            });
        };

        const renderRows = () => {
            tableBody.innerHTML = "";
            vouchers.forEach(voucher => {
                const row = document.createElement("tr");
                row.dataset.name = voucher.name.toLowerCase();
                row.dataset.code = voucher.code.toLowerCase();

                const nameCell = document.createElement("td");
                nameCell.textContent = voucher.name;

                const codeCell = document.createElement("td");
                codeCell.textContent = voucher.code;

                const discountCell = document.createElement("td");
                discountCell.textContent = voucher.discountLabel;

                const startDateCell = document.createElement("td");
                startDateCell.textContent = voucher.startDate || "-";

                const endDateCell = document.createElement("td");
                endDateCell.textContent = voucher.endDate || "-";

                const statusCell = document.createElement("td");
                statusCell.classList.add("text-center");
                const statusButton = document.createElement("button");
                const status = voucher.status;
                statusButton.className = `status-badge ${getStatusClass(status)}`;
                statusButton.dataset.originalStatus = status;
                statusButton.dataset.status = status;
                statusButton.dataset.voucherId = voucher.voucherId;
                statusButton.textContent = formatStatusLabel(status);


                statusButton.addEventListener("click", () => {
                    if (statusButton.dataset.status === "EXPIRED") {
                        onDeleteExpired(voucher.voucherId, voucher.code);
                        return;
                    }
                    const nextStatus = statusButton.dataset.status === "ACTIVE" ? "INACTIVE" : "ACTIVE";
                    statusButton.dataset.status = nextStatus;
                    statusButton.textContent = formatStatusLabel(nextStatus);
                    statusButton.className = `status-badge ${getStatusClass(nextStatus)}`;

                    if (nextStatus === statusButton.dataset.originalStatus) {
                        delete pendingChanges[voucher.voucherId];
                        statusButton.classList.remove("status-dirty");
                    } else {
                        pendingChanges[voucher.voucherId] = nextStatus;
                        statusButton.classList.add("status-dirty");
                    }
                    updateSaveButtonState();
                });

                statusCell.appendChild(statusButton);

                [nameCell, codeCell, discountCell, startDateCell, endDateCell, statusCell].forEach(cell => row.appendChild(cell));
                tableBody.appendChild(row);
            });
        };

        const loadVouchers = async () => {
            tableBody.innerHTML = "";
            saveButton.disabled = true;
            vouchers = [];
            Object.keys(pendingChanges).forEach(key => delete pendingChanges[key]);
            try {
                const res = await fetch("/api/vouchers");
                if (!res.ok) throw new Error("Không thể tải danh sách voucher");
                vouchers = await res.json();
                renderRows();
                refreshEmptyState();
                if (searchInput) handleSearch();
                updateSaveButtonState();
            } catch (err) {
                showToast(err.message || "Lỗi tải voucher");
                refreshEmptyState();
            }
        };

        const onDeleteExpired = async (voucherId, code) => {
            const confirmed = confirm(`Voucher ${code} đã hết hạn. Xóa voucher này?`);
            if (!confirmed) return;
            try {
                const res = await fetch(`/api/vouchers/${voucherId}`, {method: "DELETE"});
                const body = await res.json().catch(() => ({}));
                if (!res.ok) throw new Error(body.message || "Không thể xóa voucher");
                showToast(body.message || "Đã xóa voucher");
                await loadVouchers();
            } catch (err) {
                showToast(err.message || "Không thể xóa voucher");
            }
        };

        const onSaveChanges = async () => {
            const updates = Object.entries(pendingChanges).map(([voucherId, status]) => ({ voucherId, status }));
            if (updates.length === 0) return;

            saveButton.disabled = true;
            saveButton.textContent = "Saving...";

            try {
                const res = await fetch("/api/vouchers/status", {
                    method: "PUT",
                    headers: {"Content-Type": "application/json"},
                    body: JSON.stringify(updates)
                });
                const body = await res.json().catch(() => ({}));
                if (!res.ok) throw new Error(body.message || "Không thể lưu thay đổi");
                showToast(body.message || "Đã cập nhật trạng thái");
                Object.keys(pendingChanges).forEach(key => delete pendingChanges[key]);
                await loadVouchers();
            } catch (err) {
                showToast(err.message || "Có lỗi xảy ra khi lưu");
            } finally {
                saveButton.textContent = "Save";
                updateSaveButtonState();
            }
        };

        if (searchInput) {
            searchInput.addEventListener("keyup", handleSearch);
        }
        if (saveButton) {
            saveButton.addEventListener("click", onSaveChanges);
        }

        loadVouchers();
    }

    /* ================== CREATE VOUCHER PAGE ================== */
function initVoucherCreatePage() {
    const scopeAllRadio = document.getElementById("scopeAll");
    const scopeCategoryRadio = document.getElementById("scopeCategory");
    const scopeBrandRadio = document.getElementById("scopeBrand");
    const scopeProductRadio = document.getElementById("scopeProduct");

    const categorySelect = document.getElementById("categorySelect");
    const brandSelect = document.getElementById("brandSelect");
    const productSelect = document.getElementById("productSelect");

    const discountInput = document.getElementById("discountValueInput");
    const minOrderInput = document.getElementById("minOrderValueInput");
    const startDateInput = document.getElementById("startDateInput");
    const endDateInput = document.getElementById("endDateInput");
    const nameInput = document.getElementById("voucherNameInput");
    const codeInput = document.getElementById("voucherCodeInput");
    const descriptionInput = document.getElementById("voucherDescriptionInput");
    const form = document.getElementById("voucherCreateForm");

    let metadata = {categories: [], brands: [], products: []};

    const populateSelect = (select, items, placeholder) => {
        if (!select) return;
        select.innerHTML = "";
        const defaultOption = document.createElement("option");
        defaultOption.value = "";
        defaultOption.textContent = placeholder;
        select.appendChild(defaultOption);

        items.forEach(item => {
            const option = document.createElement("option");
            option.value = item.id;
            option.textContent = item.name;
            option.dataset.parentId = item.parentId || "";
            option.dataset.categoryId = item.categoryId || "";
            select.appendChild(option);
        });
    };

    const filterBrandsByCategory = (categoryId) => {
        if (!brandSelect) return;
        const filtered = categoryId ? metadata.brands.filter(b => b.parentId === categoryId) : metadata.brands;
        populateSelect(brandSelect, filtered, "Name of Brand");
    };

    const filterProductsByBrand = (brandId, categoryId) => {
        if (!productSelect) return;
        const filtered = metadata.products.filter(product => {
            const matchesBrand = brandId ? product.parentId === brandId : true;
            const matchesCategory = categoryId ? product.categoryId === categoryId : true;
            return matchesBrand && matchesCategory;
        });
        populateSelect(productSelect, filtered, "Name of Product");
    };

    const filterProductsByCategory = (categoryId) => {
        if (!productSelect) return;
        if (!categoryId) {
            populateSelect(productSelect, metadata.products, "Name of Product");
            return;
        }
        const filtered = metadata.products.filter(product => product.categoryId === categoryId);
        populateSelect(productSelect, filtered, "Name of Product");
    };

    const updateDetailFields = () => {
        const scopeAll = scopeAllRadio && scopeAllRadio.checked;
        const scopeCategory = scopeCategoryRadio && scopeCategoryRadio.checked;
        const scopeBrand = scopeBrandRadio && scopeBrandRadio.checked;
        const scopeProduct = scopeProductRadio && scopeProductRadio.checked;
        const hasCategory = categorySelect && categorySelect.value;

        if (categorySelect) categorySelect.disabled = scopeAll;
        if (brandSelect) brandSelect.disabled = scopeAll || scopeCategory || ((scopeBrand || scopeProduct) && !hasCategory);
        if (productSelect) productSelect.disabled = !scopeProduct || !brandSelect.value;

        if (scopeAll) {
            categorySelect.value = "";
            brandSelect.value = "";
            productSelect.value = "";
            filterBrandsByCategory("");
            filterProductsByBrand("");
            return;
        }

        if (scopeCategory) {
            brandSelect.value = "";
            productSelect.value = "";
            filterBrandsByCategory("");
            filterProductsByBrand("");
            return;
        }

        if (scopeBrand) {
            productSelect.value = "";
            if (hasCategory) {
                if (!brandSelect.value){
                    filterBrandsByCategory(categorySelect.value);
                }
            } else {
                filterBrandsByCategory("");
            }
            filterProductsByBrand("");
            return;
        }

        if (scopeProduct) {
            if (hasCategory) {
                if (!brandSelect.value) {
                    filterBrandsByCategory(categorySelect.value);
                }
                if (brandSelect.value) {
                    filterProductsByBrand(brandSelect.value, categorySelect.value);
                } else {
                    filterProductsByCategory(categorySelect.value);
                }
            } else {
                filterBrandsByCategory("");
                filterProductsByBrand("");
            }
        }
    };

    const loadMetadata = async () => {
        try {
            const res = await fetch("/api/vouchers/metadata");
            if (!res.ok) throw new Error("Không thể tải dữ liệu danh mục/brand");
            metadata = await res.json();
            populateSelect(categorySelect, metadata.categories, "Name of Category");
            populateSelect(brandSelect, metadata.brands, "Name of Brand");
            populateSelect(productSelect, metadata.products, "Name of Product");
            updateDetailFields();
        } catch (err) {
            showToast(err.message || "Không thể tải dữ liệu");
        }
    };

    const validateForm = (payload) => {
        if (!payload.name || !payload.code) {
            showToast("Vui lòng nhập tên và mã voucher");
            return false;
        }
        if (!payload.startDate || !payload.endDate) {
            showToast("Vui lòng chọn ngày bắt đầu và kết thúc");
            return false;
        }
        if (!payload.discountValue || payload.discountValue <= 0) {
            showToast("Giá trị giảm phải lớn hơn 0");
            return false;
        }

        const start = new Date(payload.startDate);
        const end = new Date(payload.endDate);
        if (end < start) {
            showToast("End Date phải lớn hơn hoặc bằng Start Date");
            return false;
        }

        if (payload.scope === "CATEGORY" && !payload.categoryId) {
            showToast("Vui lòng chọn danh mục áp dụng");
            return false;
        }
        if (payload.scope === "BRAND" && (!payload.categoryId || !payload.brandId)) {
            showToast("Vui lòng chọn danh mục và thương hiệu");
            return false;
        }
        if (payload.scope === "PRODUCT" && !payload.productId) {
            showToast("Vui lòng chọn sản phẩm áp dụng");
            return false;
        }
        return true;
    };

    const handleSubmit = async (event) => {
        event.preventDefault();
        const scopeValue = document.querySelector('input[name="scopeVoucher"]:checked')?.value || "ALL";
        const payload = {
            name: nameInput.value.trim(),
            code: codeInput.value.trim(),
            description: descriptionInput.value.trim(),
            startDate: startDateInput.value,
            endDate: endDateInput.value,
            discountType: document.querySelector('input[name="discountType"]:checked')?.value || "PERCENTAGE",
            discountValue: Number(discountInput.value),
            minOrderValue: minOrderInput.value ? Number(minOrderInput.value) : 0,
            customerType: document.querySelector('input[name="customerType"]:checked')?.value || "all",
            status: document.querySelector('input[name="statusVoucher"]:checked')?.value || "active",
            scope: scopeValue,
            categoryId: categorySelect.value,
            brandId: brandSelect.value,
            productId: productSelect.value
        };

        if (!validateForm(payload)) return;

        const submitButton = document.getElementById("btnSubmitCreateVoucher");
        submitButton.disabled = true;
        submitButton.textContent = "Creating...";

        try {
            const res = await fetch("/api/vouchers", {
                method: "POST",
                headers: {"Content-Type": "application/json"},
                body: JSON.stringify(payload)
            });
            const body = await res.json().catch(() => ({}));
            if (!res.ok) throw new Error(body.message || "Không thể tạo voucher");
            showToast(body.message || "Tạo voucher thành công");
            setTimeout(() => window.location.href = "/admin/vouchers", 800);
        } catch (err) {
            showToast(err.message || "Có lỗi khi tạo voucher");
        } finally {
            submitButton.disabled = false;
            submitButton.textContent = "Create";
        }
    };

    [scopeAllRadio, scopeCategoryRadio, scopeBrandRadio, scopeProductRadio].forEach(radio => {
        if (radio) radio.addEventListener("change", () => {
            updateDetailFields();
        });
    });

    if (categorySelect) {
        categorySelect.addEventListener("change", (event) => {
            brandSelect.value = "";
            productSelect.value = "";
            filterBrandsByCategory(event.target.value);
            if (scopeBrandRadio && scopeBrandRadio.checked) {
                filterProductsByBrand("");
            } else if (scopeProductRadio && scopeProductRadio.checked) {
                filterProductsByCategory(event.target.value);
            } else {
                filterProductsByBrand("");
            }
            updateDetailFields();
        });
    }

    if (brandSelect) {
        brandSelect.addEventListener("change", (event) => {
            productSelect.value = "";
            if (scopeProductRadio && scopeProductRadio.checked) {
                filterProductsByBrand(event.target.value, categorySelect.value);
            }
            updateDetailFields();
        });
    }

    if (form) {
        form.addEventListener("submit", handleSubmit);
    }

    loadMetadata();
    updateDetailFields();
}