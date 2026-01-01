export async function fetchCancelledOrders() {
    try {
        const response = await fetch('/api/orders/my-orders');
        if (!response.ok) {
            throw new Error('Failed to fetch orders');
        }
        const orders = await response.json();
        return orders.filter(order => order.status === 'CANCELLED');
    } catch (error) {
        console.error("Error fetching cancelled orders:", error);
        return [];
    }
}
