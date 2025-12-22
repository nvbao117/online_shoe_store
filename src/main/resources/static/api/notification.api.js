// Notification API Module
const NotificationApi = {
    async getNotifications() {
        const response = await fetch('/api/notifications');
        if (!response.ok) throw new Error('Failed to fetch notifications');
        return response.json();
    },

    async getUnreadCount() {
        const response = await fetch('/api/notifications/unread-count');
        if (!response.ok) throw new Error('Failed to fetch unread count');
        return response.json();
    },

    async markAsRead(id) {
        const response = await fetch(`/api/notifications/${id}/read`, {
            method: 'PUT'
        });
        if (!response.ok) throw new Error('Failed to mark as read');
        return true;
    },

    async markAllAsRead() {
        const response = await fetch('/api/notifications/read-all', {
            method: 'PUT'
        });
        if (!response.ok) throw new Error('Failed to mark all as read');
        return true;
    }
};

export default NotificationApi;
