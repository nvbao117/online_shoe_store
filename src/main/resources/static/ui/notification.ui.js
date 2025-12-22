// Notification UI Module
const NotificationUI = {
    formatTimeAgo(dateString) {
        const date = new Date(dateString);
        const now = new Date();
        const diffMs = now - date;
        const diffMins = Math.floor(diffMs / 60000);
        const diffHours = Math.floor(diffMs / 3600000);
        const diffDays = Math.floor(diffMs / 86400000);

        if (diffMins < 1) return 'Vừa xong';
        if (diffMins < 60) return `${diffMins} phút trước`;
        if (diffHours < 24) return `${diffHours} giờ trước`;
        if (diffDays < 7) return `${diffDays} ngày trước`;

        return date.toLocaleDateString('vi-VN', {
            day: '2-digit',
            month: '2-digit',
            year: 'numeric',
            hour: '2-digit',
            minute: '2-digit'
        });
    },

    getTypeLabel(type) {
        const labels = {
            'ORDER_UPDATE': 'Cập nhật đơn hàng',
            'PROMOTION': 'Khuyến mãi',
            'SYSTEM': 'Thông báo hệ thống'
        };
        return labels[type] || 'Thông báo';
    },

    getIconBackground(type) {
        const colors = {
            'ORDER_UPDATE': 'bg-blue-100',
            'PROMOTION': 'bg-orange-100',
            'SYSTEM': 'bg-gray-100'
        };
        return colors[type] || 'bg-gray-100';
    },

    renderNotificationItem(notification) {
        const isUnreadClass = notification.isRead ? '' : 'bg-blue-50/30';
        const iconBg = this.getIconBackground(notification.type);
        const timeAgo = this.formatTimeAgo(notification.createdAt);

        return `
            <div class="notification-item p-4 flex gap-4 hover:bg-blue-50/50 transition ${isUnreadClass}" 
                 data-id="${notification.id}">
                <div class="w-12 h-12 ${iconBg} rounded-lg flex items-center justify-center flex-shrink-0 text-xl">
                    ${notification.icon}
                </div>
                <div class="flex-1 min-w-0">
                    <h4 class="font-bold text-gray-800">${notification.title}</h4>
                    <p class="text-sm text-gray-600 line-clamp-2">${notification.message}</p>
                    <span class="text-xs text-gray-400 mt-1 block">${timeAgo}</span>
                </div>
                ${!notification.isRead ? '<div class="w-2 h-2 bg-blue-600 rounded-full flex-shrink-0 mt-2"></div>' : ''}
            </div>
        `;
    },

    renderNotifications(notifications) {
        if (!notifications || notifications.length === 0) {
            return this.renderEmptyState();
        }

        return `
            <div class="divide-y divide-gray-100">
                ${notifications.map(n => this.renderNotificationItem(n)).join('')}
            </div>
        `;
    },

    renderEmptyState() {
        return `
            <div class="text-center py-16">
                <div class="text-5xl mb-4">🔔</div>
                <h4 class="font-bold text-gray-700 mb-2">Không có thông báo nào</h4>
                <p class="text-sm text-gray-500">Bạn sẽ nhận được thông báo khi có cập nhật mới</p>
            </div>
        `;
    },

    renderLoadingState() {
        return `
            <div class="flex items-center justify-center py-16">
                <div class="animate-spin rounded-full h-8 w-8 border-b-2 border-blue-600"></div>
                <span class="ml-3 text-gray-500">Đang tải thông báo...</span>
            </div>
        `;
    },

    renderError() {
        return `
            <div class="text-center py-16">
                <div class="text-5xl mb-4">❌</div>
                <h4 class="font-bold text-gray-700 mb-2">Không thể tải thông báo</h4>
                <p class="text-sm text-gray-500">Vui lòng thử lại sau</p>
            </div>
        `;
    }
};

export default NotificationUI;
