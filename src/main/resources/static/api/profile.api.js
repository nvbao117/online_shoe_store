export async function fetchUserProfile() {
    const res = await fetch("/api/me");

    if (!res.ok) {
        throw new Error("Not authenticated");
    }

    return res.json();
}
