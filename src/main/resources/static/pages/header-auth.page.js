import { fetchUserProfile } from "../api/profile.api.js";

async function loadHeaderAuth() {
    const authButtons = document.getElementById("authButtons");
    const userProfile = document.getElementById("userProfile");
    const usernameSpan = document.getElementById("username");
    const logoutBtn = document.getElementById("logoutBtn");

    if (!authButtons || !userProfile || !usernameSpan) return;

    try {
        const user = await fetchUserProfile();

        // ĐÃ đăng nhập
        authButtons.classList.add("d-none");
        userProfile.classList.remove("d-none");

        usernameSpan.textContent = user.name;
        usernameSpan.classList.remove("d-none");
        usernameSpan.classList.add("d-md-inline");
        console.log("User profile loaded:", user);

        // ✅ Thêm handler cho logout button khi user đã đăng nhập
        if (logoutBtn) {
            logoutBtn.addEventListener("click", handleLogout);
        }

    } catch (e) {
        // CHƯA đăng nhập
        authButtons.classList.remove("d-none");
        userProfile.classList.add("d-none");
        console.log("User not authenticated");
    }
}

/**
 * Xử lý sự kiện đăng xuất
 * - Gửi POST request tới /logout
 * - Spring Security xóa cookies và revoke refresh token
 * - Redirect về /home với trạng thái chưa đăng nhập
 */
async function handleLogout(e) {
    e.preventDefault();

    try {
        const response = await fetch("/logout", {
            method: "POST",
            headers: {
                "Content-Type": "application/x-www-form-urlencoded",
            },
            credentials: "include"
        });

        // ✅ Wait 100ms để đảm bảo cookies được set
        await new Promise(r => setTimeout(r, 100));

        // Spring tự động redirect, nhưng nếu không, redirect manual
        if (response.redirected) {
            window.location.href = response.url;
        } else {
            // ✅ Thêm timestamp để bust cache và force reload
            window.location.href = "/home?logout=" + Date.now();
        }
    } catch (error) {
        console.error("Logout error:", error);
        // Vẫn redirect về home ngay cả khi có lỗi
        window.location.href = "/home?logout=" + Date.now();
    }
}

document.addEventListener("DOMContentLoaded", loadHeaderAuth);
