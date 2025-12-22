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
    // Thêm tuần tự từng item để tránh conflict
    const results = [];
    for (const item of items) {
        try {
            console.log("Đang thêm vào giỏ:", item);
            const response = await fetch('/api/cart/add', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    productId: item.productId,
                    size: item.size,
                    quantity: item.quantity || 1
                })
            });

            if (response.ok) {
                const data = await response.json();
                console.log("Thêm thành công:", data);
                results.push({ success: true, item, data });
            } else {
                console.error("Thêm thất bại:", await response.text());
                results.push({ success: false, item });
            }
        } catch (e) {
            console.error("Lỗi khi thêm item:", item, e);
            results.push({ success: false, item, error: e });
        }
    }

    // Đợi 500ms để backend xử lý xong
    await new Promise(resolve => setTimeout(resolve, 500));

    console.log("Kết quả thêm giỏ hàng:", results);
    return results;
}
