 export async function fetchDashboardStats(from, to) {
    const res = await fetch(`/api/dashboard/summary?from=${from}&to=${to}`);
    if (!res.ok) throw new Error("Failed to fetch dashboard stats");
    return res.json();
}
export async function fetchFilteredStatistics(payload) {
    const res = await fetch("/api/dashboard/details", {
        method: "POST",
        headers: {"Content-Type": "application/json"},
        body: JSON.stringify(payload)
    });
    return res.json();
}