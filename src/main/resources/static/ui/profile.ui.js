
document.addEventListener("DOMContentLoaded", () => {
    const tabButtons = document.querySelectorAll(".tab-btn");
    const tabContents = document.querySelectorAll(".tab-content");

    tabButtons.forEach((btn) => {
    btn.addEventListener("click", () => {
    const targetTab = btn.getAttribute("data-tab");

    // 1. Cập nhật trạng thái nút Sidebar
    tabButtons.forEach((b) => {
    b.classList.remove(
    "text-blue-600",
    "bg-blue-50",
    "border-blue-600"
    );
    b.classList.add("text-gray-600", "border-transparent");
});
    btn.classList.add("text-blue-600", "bg-blue-50", "border-blue-600");
    btn.classList.remove("text-gray-600", "border-transparent");

    // 2. Ẩn/Hiện nội dung Content
    tabContents.forEach((content) => {
    content.classList.add("hidden");
    if (content.id === `content-${targetTab}`) {
    content.classList.remove("hidden");
}
});
});
});

    // Code xử lý sub-tab trong phần Đơn Mua
    const subTabs = document.querySelectorAll(".order-subtab");
    subTabs.forEach((stb) => {
    stb.addEventListener("click", () => {
    subTabs.forEach((s) => {
    s.classList.remove("text-blue-600", "border-blue-600");
    s.classList.add("text-gray-500");
});
    stb.classList.add("text-blue-600", "border-blue-600");
    stb.classList.remove("text-gray-500");
});
});
});

    function togglePasswordView(show) {
    const profileView = document.getElementById("profile-main-view");
    const passwordView = document.getElementById("password-change-view");

    if (show) {
    profileView.classList.add("hidden");
    passwordView.classList.remove("hidden");
} else {
    profileView.classList.remove("hidden");
    passwordView.classList.add("hidden");
}
}

    // xu li chuyen tab don hang
    const tabs = document.querySelectorAll(".order-subtab");
    const contents = document.querySelectorAll(".order-tab-content");

    tabs.forEach((tab) => {
    tab.addEventListener("click", () => {
        // reset tab UI
        tabs.forEach((t) => {
            t.classList.remove(
                "text-blue-600",
                "border-b-2",
                "border-blue-600",
                "active"
            );
            t.classList.add("text-gray-500");
        });

        // active tab
        tab.classList.add(
            "text-blue-600",
            "border-b-2",
            "border-blue-600",
            "active"
        );
        tab.classList.remove("text-gray-500");

        const tabName = tab.dataset.tab;

        // show đúng content
        contents.forEach((c) => {
            if (c.dataset.content === tabName) {
                c.classList.remove("hidden");
            } else {
                c.classList.add("hidden");
            }
        });
    });
});

    //   dánh giá
    function openReviewModal(name, variant, img) {
    const modal = document.getElementById("reviewModal");

    // Gán thông tin sản phẩm vào modal
    document.getElementById("modalProductName").innerText = name;
    document.getElementById("modalProductVariant").innerText =
    "Phân loại: " + variant;
    document.getElementById("modalProductImg").src = img;

    // Hiện modal
    modal.classList.remove("hidden");
    document.body.style.overflow = "hidden"; // Khóa cuộn trang chính
}

    function closeReviewModal() {
    const modal = document.getElementById("reviewModal");
    modal.classList.add("hidden");
    document.body.style.overflow = "auto"; // Mở lại cuộn trang
}

    // Xử lý xem trước ảnh khi upload
    document
    .getElementById("imageInput")
    .addEventListener("change", function (e) {
    const preview = document.getElementById("imagePreview");
    preview.innerHTML = "";
    [...this.files].forEach((file) => {
    const reader = new FileReader();
    reader.onload = function (e) {
    const img = document.createElement("img");
    img.src = e.target.result;
    img.className = "w-16 h-16 object-cover rounded-lg border";
    preview.appendChild(img);
};
    reader.readAsDataURL(file);
});
});

    // Đóng modal khi click ra ngoài vùng trắng
    window.onclick = function (event) {
    const modal = document.getElementById("reviewModal");
    if (event.target == modal) {
    closeReviewModal();
}
};
