export async function fetchUserProfile() {
    const res = await fetch("/api/me");
    return res.json();
}

