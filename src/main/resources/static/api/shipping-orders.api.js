export async function fetchShippingOrders() {
    try {
        const response = await fetch('/api/orders/my-orders');
        if (!response.ok) {
            throw new Error('Failed to fetch orders');
        }
        const orders = await response.json();
        // Include SHIPPED, IN_TRANSIT, OUT_FOR_DELIVERY and even CONFIRMED if that's how we map it currently
        const shippingStatuses = ['SHIPPED', 'IN_TRANSIT', 'OUT_FOR_DELIVERY', 'CONFIRMED'];
        return orders.filter(order => shippingStatuses.includes(order.status));
    } catch (error) {
        console.error("Error fetching shipping orders:", error);
        return [];
    }
}

export async function confirmReceivedOrder(orderId) {
    const response = await fetch(`/api/orders/${orderId}/received`, {
        method: 'POST'
    });
    if (!response.ok) {
        throw new Error('Action failed');
    }
    return await response.text();
}
