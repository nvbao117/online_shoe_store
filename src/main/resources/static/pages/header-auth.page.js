import {fetchUserProfile} from "../api/profile.api.js";

async function loadHeaderAuth() {
    const authButtons = document.getElementById("authButtons");
    const userProfile = document.getElementById("userProfile");
    const usernameSpan = document.getElementById("username");

    // Không có header (page không dùng fragment)
    if (!authButtons || !userProfile || !usernameSpan) return;

    try {
        const user = await fetchUserProfile();

        // Đã đăng nhập
        authButtons.classList.add("d-none");
        userProfile.classList.remove("d-none");

        usernameSpan.innerText = user.name;
        usernameSpan.classList.remove("d-none");

    } catch (e) {
        // Chưa đăng nhập
        authButtons.classList.remove("d-none");
        userProfile.classList.add("d-none");
    }
}

document.addEventListener("DOMContentLoaded", loadHeaderAuth);
console.log("Loading header auth status...");
