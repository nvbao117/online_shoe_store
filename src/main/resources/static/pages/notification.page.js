// Notification Page Module
import NotificationApi from '/api/notification.api.js';
import NotificationUI from '/ui/notification.ui.js';

class NotificationPage {
    constructor() {
        this.container = document.getElementById('notifications-container');
        this.markAllBtn = document.getElementById('mark-all-read-btn');
        this.loaded = false;
    }

    init() {
        if (this.markAllBtn) {
            this.markAllBtn.addEventListener('click', () => this.handleMarkAllRead());
        }

        // Listen for tab switch to notifications
        document.querySelectorAll('.tab-btn').forEach(btn => {
            btn.addEventListener('click', () => {
                if (btn.dataset.tab === 'notifications' && !this.loaded) {
                    this.loadNotifications();
                }
            });
        });
    }

    async loadNotifications() {
        if (!this.container) return;

        this.container.innerHTML = NotificationUI.renderLoadingState();

        try {
            const notifications = await NotificationApi.getNotifications();
            this.container.innerHTML = NotificationUI.renderNotifications(notifications);
            this.loaded = true;

            // Add click handlers for marking as read
            this.container.querySelectorAll('.notification-item').forEach(item => {
                item.addEventListener('click', () => this.handleNotificationClick(item));
            });
        } catch (error) {
            console.error('Error loading notifications:', error);
            this.container.innerHTML = NotificationUI.renderError();
        }
    }

    async handleNotificationClick(item) {
        const id = item.dataset.id;
        const unreadDot = item.querySelector('.bg-blue-600.rounded-full');

        if (unreadDot) {
            try {
                await NotificationApi.markAsRead(id);
                unreadDot.remove();
                item.classList.remove('bg-blue-50/30');
            } catch (error) {
                console.error('Error marking notification as read:', error);
            }
        }
    }

    async handleMarkAllRead() {
        try {
            await NotificationApi.markAllAsRead();
            // Remove all unread indicators
            this.container.querySelectorAll('.notification-item').forEach(item => {
                item.classList.remove('bg-blue-50/30');
                const dot = item.querySelector('.bg-blue-600.rounded-full');
                if (dot) dot.remove();
            });
        } catch (error) {
            console.error('Error marking all as read:', error);
        }
    }
}

// Initialize when DOM is ready
document.addEventListener('DOMContentLoaded', () => {
    const notificationPage = new NotificationPage();
    notificationPage.init();
});

export default NotificationPage;
