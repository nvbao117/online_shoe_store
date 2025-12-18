
const CartAPI = {

    // Cập nhật số lượng
    updateQuantity(itemId, quantity) {
        return fetch(`/api/cart/update-quantity?itemId=${itemId}&quantity=${quantity}`, {
            method: 'PUT'
        });
    },

    // Xóa sản phẩm
    remove(itemId) {
        return fetch(`/api/cart/remove/${itemId}`, {
            method: 'DELETE'
        });
    },

    // Lấy toàn bộ giỏ hàng
    getAll() {
        return fetch('/api/cart')
            .then(res => res.json());
    },

    // Lấy danh sách biến thể (Size/Color)
    getVariants(productId) {
        return fetch(`/api/cart/variants/${productId}`)
            .then(res => {
                if (!res.ok) throw new Error("Lỗi tải data");
                return res.json();
            });
    },

    // Đổi biến thể (Đổi size)
    updateVariant(itemId, variantId) {
        return fetch(`/api/cart/update-variant?itemId=${itemId}&variantId=${variantId}`, {
            method: 'PATCH'
        });
    }
};