/**
 * Header Logout Handler
 * - Xử lý sự kiện click nút "Đăng xuất"
 * - Gửi request POST tới /logout
 * - Spring Security sẽ xóa session/cookie và redirect về /home
 */

function initLogoutHandler() {
    const logoutBtn = document.getElementById("logoutBtn");

    if (!logoutBtn) {
        console.warn("Logout button not found in DOM");
        return;
    }

    logoutBtn.addEventListener("click", async (e) => {
        e.preventDefault();

        try {
            // Gửi POST request tới /logout
            // Spring Security sẽ xử lý trong AppLogoutSuccessHandler
            const response = await fetch("/logout", {
                method: "POST",
                headers: {
                    "Content-Type": "application/x-www-form-urlencoded",
                },
                credentials: "include" // Gửi kèm cookies
            });

            // Spring sẽ tự động redirect, nhưng để chắc chắn:
            if (response.redirected) {
                window.location.href = response.url;
            } else {
                // Redirect manual về home
                window.location.href = "/home";
            }
        } catch (error) {
            console.error("Logout error:", error);
            // Nếu có lỗi, vẫn redirect về home để xóa state
            window.location.href = "/home";
        }
    });
}

// Khởi tạo khi DOM sẵn sàng
document.addEventListener("DOMContentLoaded", initLogoutHandler);

