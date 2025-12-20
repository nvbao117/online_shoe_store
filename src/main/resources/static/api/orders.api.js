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
