export async function fetchCompletedOrders() {
    try {
        const response = await fetch('/api/orders/my-orders');
        if (!response.ok) {
            throw new Error('Failed to fetch orders');
        }
        const orders = await response.json();
        return orders.filter(order => order.status === 'COMPLETED');
    } catch (error) {
        console.error("Error fetching completed orders:", error);
        return [];
    }
}

export async function addToCartBatch(items) {
    // items: [{productId, size, quantity}]
    const promises = items.map(item => {
        return fetch('/api/cart/add', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                productId: item.productId,
                size: item.size,
                quantity: item.quantity
            })
        });
    });

    return Promise.all(promises);
}
