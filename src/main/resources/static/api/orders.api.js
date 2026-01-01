export async function fetchMyOrders() {
  const response = await fetch('/api/orders/my-orders', {
    credentials: 'include'
  });

  if (!response.ok) {
    if (response.status === 401) {
      throw new Error('UNAUTHORIZED');
    }
    throw new Error(`Failed to load orders: ${response.status} ${response.statusText}`);
  }

  return response.json();
}

export async function cancelOrder(orderId, reason) {
  const response = await fetch(`/api/orders/${orderId}/cancel`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(reason || 'Khách hàng hủy')
  });

  if (!response.ok) {
    if (response.status === 401) {
      throw new Error('UNAUTHORIZED');
    }
    const errorText = await response.text();
    throw new Error(errorText || `Failed to cancel order: ${response.status}`);
  }

  return response.text();
}
