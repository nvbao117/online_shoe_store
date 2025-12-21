export async function fetchPendingOrder() {
    const response = await fetch(`/api/pending-order`);
    if (!response.ok) {
        throw new Error(`Error confirming profile: ${response.statusText}`);
    }

    return await response.json();
}