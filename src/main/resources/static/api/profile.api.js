export async function fetchUserProfile() {
    const res = await fetch("/api/me", {
        credentials: "include"
    });

    if (!res.ok) {
        throw new Error("Not authenticated");
    }

    return res.json();
}
