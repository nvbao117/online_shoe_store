import { fetchUserProfile } from "../api/profile.api.js";

async function loadHeaderAuth() {
    const authButtons = document.getElementById("authButtons");
    const userProfile = document.getElementById("userProfile");
    const usernameSpan = document.getElementById("username");

    if (!authButtons || !userProfile || !usernameSpan) return;

    try {
        const user = await fetchUserProfile();

        // ĐÃ đăng nhập
        authButtons.classList.add("d-none");
        userProfile.classList.remove("d-none");

        usernameSpan.textContent = user.name;
        usernameSpan.classList.remove("d-none");
        console.log("User profile loaded:", user);

    } catch (e) {
        // CHƯA đăng nhập
        authButtons.classList.remove("d-none");
        userProfile.classList.add("d-none");
        console.log("User not authenticated");
    }
}

document.addEventListener("DOMContentLoaded", loadHeaderAuth);
