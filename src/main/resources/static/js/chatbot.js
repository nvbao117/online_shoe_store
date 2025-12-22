/**
 * ==================================================
 * CHATBOT LOGIC - Bubble Edition with Image Support
 * Handles view transitions and image upload/search
 * ==================================================
 */

class ShoeStoreChatbot {
    constructor() {
        // Elements
        this.widget = document.getElementById('chatbotWidget');
        this.toggle = document.getElementById('chatbotToggle');
        this.welcomeView = document.getElementById('welcomeView');
        this.conversationView = document.getElementById('conversationView');
        this.startChatBtn = document.getElementById('startChatBtn');
        this.backBtn = document.getElementById('chatbotBack');

        // Chat elements
        this.messagesContainer = document.getElementById('chatbotMessages');
        this.input = document.getElementById('chatbotInput');
        this.sendBtn = document.getElementById('chatbotSend');

        // Image elements
        this.imageInput = document.getElementById('chatImageInput');
        this.imageBtn = document.getElementById('chatImageBtn');
        this.imagePreviewContainer = document.getElementById('imagePreviewContainer');
        this.imagePreviewImg = document.getElementById('imagePreviewImg');
        this.imageRemoveBtn = document.getElementById('imageRemoveBtn');

        // Icons
        this.iconClosed = this.toggle ? this.toggle.querySelector('.icon-closed') : null;
        this.iconOpen = this.toggle ? this.toggle.querySelector('.icon-open') : null;

        // State
        this.isOpen = false;
        this.activeView = 'welcome';
        this.isTyping = false;
        this.sessionId = null;
        this.selectedImage = null; // File object

        this.init();
    }

    setHidden(el, hidden) {
        if (!el) return;
        el.classList.toggle('cb-hidden', hidden);
        el.classList.toggle('hidden', hidden);
        if (el.hasAttribute('hidden')) {
            if (hidden) el.setAttribute('hidden', '');
            else el.removeAttribute('hidden');
        }
    }

    init() {
        if (!this.widget || !this.toggle) return;

        // Toggle Widget
        this.toggle.addEventListener('click', () => this.toggleWidget());

        // Navigation
        if (this.startChatBtn) {
            this.startChatBtn.addEventListener('click', () => this.switchToConversation());
        }
        if (this.backBtn) {
            this.backBtn.addEventListener('click', () => this.switchToWelcome());
        }

        // Chat Actions
        if (this.sendBtn) {
            this.sendBtn.addEventListener('click', () => this.sendMessage());
        }
        if (this.input) {
            this.input.addEventListener('keypress', (e) => {
                if (e.key === 'Enter') this.sendMessage();
            });
        }

        // Image Actions
        if (this.imageBtn) {
            this.imageBtn.addEventListener('click', () => this.imageInput?.click());
        }
        if (this.imageInput) {
            this.imageInput.addEventListener('change', (e) => this.handleImageSelect(e));
        }
        if (this.imageRemoveBtn) {
            this.imageRemoveBtn.addEventListener('click', () => this.removeSelectedImage());
        }
    }

    toggleWidget() {
        this.isOpen = !this.isOpen;
        this.widget.classList.toggle('active', this.isOpen);
        this.setHidden(this.iconClosed, this.isOpen);
        this.setHidden(this.iconOpen, !this.isOpen);
    }

    switchToConversation() {
        this.activeView = 'conversation';
        this.setHidden(this.welcomeView, true);
        this.setHidden(this.conversationView, false);

        if (this.messagesContainer.children.length === 0) {
            this.addMessage("Xin chào! 👋 Chào mừng bạn đến với **5A Store**!\nMình là trợ lý ảo, sẵn sàng hỗ trợ bạn:\n- 🔍 Tìm kiếm giày phù hợp\n- 💰 Tư vấn giá cả\n- 📦 Tra cứu đơn hàng\n\nBạn cần hỗ trợ gì ạ?", 'bot');
        }
    }

    switchToWelcome() {
        this.activeView = 'welcome';
        this.setHidden(this.conversationView, true);
        this.setHidden(this.welcomeView, false);
    }

    // ==================== IMAGE HANDLING ====================

    handleImageSelect(event) {
        const file = event.target.files?.[0];
        if (!file) return;

        // Validate file type
        if (!file.type.startsWith('image/')) {
            this.addMessage("Vui lòng chọn file ảnh!", 'bot');
            return;
        }

        // Validate file size (max 5MB)
        if (file.size > 5 * 1024 * 1024) {
            this.addMessage("Ảnh quá lớn! Vui lòng chọn ảnh dưới 5MB.", 'bot');
            return;
        }

        this.selectedImage = file;

        // Show preview
        const reader = new FileReader();
        reader.onload = (e) => {
            if (this.imagePreviewImg) {
                this.imagePreviewImg.src = e.target.result;
            }
            if (this.imagePreviewContainer) {
                this.imagePreviewContainer.removeAttribute('hidden');
                this.setHidden(this.imagePreviewContainer, false);
            }
        };
        reader.readAsDataURL(file);
    }

    removeSelectedImage() {
        this.selectedImage = null;
        if (this.imageInput) this.imageInput.value = '';
        if (this.imagePreviewImg) this.imagePreviewImg.src = '';
        if (this.imagePreviewContainer) {
            this.imagePreviewContainer.setAttribute('hidden', '');
            this.setHidden(this.imagePreviewContainer, true);
        }
    }

    // ==================== SEND MESSAGE ====================

    sendMessage() {
        const text = this.input?.value.trim() || '';

        // If image is selected, send image
        if (this.selectedImage) {
            this.sendImageMessage(text);
            return;
        }

        // Text only
        if (!text) return;

        this.addMessage(text, 'user');
        this.input.value = '';
        this.showTyping();

        fetch('/api/chat/send', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({
                message: text,
                sessionId: this.sessionId
            })
        })
            .then(response => response.json())
            .then(data => {
                this.hideTyping();
                if (data.sessionId) this.sessionId = data.sessionId;
                this.addMessage(data.response, 'bot');
            })
            .catch(error => {
                console.error('Error:', error);
                this.hideTyping();
                this.addMessage("Xin lỗi, mình đang gặp sự cố kết nối. Vui lòng thử lại sau!", 'bot');
            });
    }

    sendImageMessage(text) {
        // Show user's image in chat
        this.addImageMessage(this.imagePreviewImg.src, 'user');
        if (text) {
            this.addMessage(text, 'user');
        }

        this.showTyping();

        // Prepare form data
        const formData = new FormData();
        formData.append('image', this.selectedImage);
        if (text) formData.append('message', text);
        if (this.sessionId) formData.append('sessionId', this.sessionId);

        // Clear image after sending
        this.removeSelectedImage();
        if (this.input) this.input.value = '';

        fetch('/api/chat/send-image', {
            method: 'POST',
            body: formData
        })
            .then(response => response.json())
            .then(data => {
                this.hideTyping();
                if (data.sessionId) this.sessionId = data.sessionId;

                // Show text response
                this.addMessage(data.response, 'bot');

                // Show product images if available
                if (data.imageUrls && data.imageUrls.length > 0) {
                    this.addProductImages(data.imageUrls);
                }
            })
            .catch(error => {
                console.error('Error:', error);
                this.hideTyping();
                this.addMessage("Xin lỗi, không thể xử lý ảnh. Vui lòng thử lại! 😔", 'bot');
            });
    }

    // ==================== MESSAGE DISPLAY ====================

    addMessage(text, type) {
        const div = document.createElement('div');
        div.className = `message ${type}-message`;

        if (type === 'bot') {
            div.innerHTML = this.formatBotMessage(text);
            this.maybeRenderEscalationQuickReplies(text);
        } else {
            div.textContent = text;
        }

        this.messagesContainer.appendChild(div);
        this.messagesContainer.scrollTop = this.messagesContainer.scrollHeight;
    }

    addImageMessage(imageSrc, type) {
        const div = document.createElement('div');
        div.className = `message ${type}-message image-message`;

        const img = document.createElement('img');
        img.src = imageSrc;
        img.alt = 'Sent image';
        img.onclick = () => window.open(imageSrc, '_blank');

        div.appendChild(img);
        this.messagesContainer.appendChild(div);
        this.messagesContainer.scrollTop = this.messagesContainer.scrollHeight;
    }

    addProductImages(imageUrls) {
        const div = document.createElement('div');
        div.className = 'message bot-message';

        let html = '<div class="product-result-grid">';
        imageUrls.forEach(url => {
            html += `<div class="product-result-item">
                <img src="${url}" alt="Product" onerror="this.style.display='none'">
            </div>`;
        });
        html += '</div>';

        div.innerHTML = html;
        this.messagesContainer.appendChild(div);
        this.messagesContainer.scrollTop = this.messagesContainer.scrollHeight;
    }

    formatBotMessage(text) {
        if (!text) return '';

        let formatted = text
            // Bold: **text** or __text__
            .replace(/\*\*(.*?)\*\*/g, '<strong>$1</strong>')
            .replace(/__(.*?)__/g, '<strong>$1</strong>')

            // Italic: *text* or _text_
            .replace(/\*(?!\*)(.*?)\*/g, '<em>$1</em>')
            .replace(/_(?!_)(.*?)_/g, '<em>$1</em>')

            // Bullet points: - text or • text or ✅ text
            .replace(/^[-•]\s+(.+)$/gm, '<li>$1</li>')
            .replace(/^[✅☑️✓]\s*(.+)$/gm, '<li class="checked">✅ $1</li>')

            // Numbered list: 1. text
            .replace(/^\d+\.\s+(.+)$/gm, '<li>$1</li>')

            // Price formatting - handle various formats
            .replace(/(\d{1,3}(?:[,.\s]?\d{3})*)\s*đ(?:ồng)?/gi, '<span class="price">$1đ</span>')
            .replace(/(\d{1,3}(?:[,.\s]?\d{3})*)\s*VND/gi, '<span class="price">$1đ</span>')

            // Product name highlight: 【text】
            .replace(/【(.+?)】/g, '<span class="product-name">$1</span>')

            // Normalize DB-style image paths (no leading slash) so later rules can render thumbnails
            // e.g. "Ảnh: src/data/images/products/main_x.jpg" -> "/src/data/images/products/main_x.jpg"
            .replace(/Ảnh:\s*(src\/data\/images\/products\/[^\s<>\n]+(?:\.jpg|\.jpeg|\.png|\.gif|\.webp))/gi,
                'Ảnh: /$1')

            // Image URLs: "Ảnh: ..." -> display as thumbnail (supports /images/... and http(s) links)
            .replace(/Ảnh:\s*((?:https?:\/\/|\/)[^\s<>\n]+(?:\.jpg|\.jpeg|\.png|\.gif|\.webp))(?:\s|$)/gi,
                '<div class="product-thumbnail"><img src="$1" alt="Sản phẩm" onerror="this.parentElement.style.display=\'none\'"></div>')

            // Product detail links: accept various formats and make them clickable
            // Handles: "Xem chi tiết:", "Chi tiết:", "🔗 Xem & Mua:", etc.
            .replace(/(?:🔗\s*)?(?:Xem\s*[&và]\s*Mua|Xem\s+chi\s+tiết|Chi\s+tiết):\s*(\/product-detail\/[^\s<>\n]+)/gi,
                '<a href="$1" class="product-link" target="_self">🔗 Xem & Mua ngay</a>')

            // Also handle standalone product-detail links that aren't already wrapped
            .replace(/(?<![href="])(\/product-detail\/[a-zA-Z0-9_-]+)(?![^<]*>)/gi,
                '<a href="$1" class="product-link" target="_self">$1</a>')

            // Handle common emojis with proper spacing
            .replace(/(👟|💰|🏷️|📦|✨|⭐|🔥|💯|🎉|📷|💡|🔍|👆|💬|📊|😔|✅|❌|☑️|⚡|🛒|❤️|👍)/g, '<span class="emoji">$1</span>')

            // Clean up multiple line breaks
            .replace(/\n{3,}/g, '\n\n')

            // Line breaks
            .replace(/\n/g, '<br>');

        // Wrap list items in ul
        if (formatted.includes('<li>')) {
            formatted = formatted.replace(/(<li[^>]*>.*?<\/li>)+/g, '<ul class="bot-list">$&</ul>');
        }

        return formatted;
    }

    maybeRenderEscalationQuickReplies(text) {
        if (!text) return;
        const marker = /bạn có muốn kết nối với nhân viên không\?/i;
        if (!marker.test(text)) return;

        const container = document.createElement('div');
        container.className = 'quick-replies';

        const createBtn = (label) => {
            const btn = document.createElement('button');
            btn.className = 'quick-reply-btn';
            btn.textContent = label;
            btn.addEventListener('click', () => {
                this.input.value = label;
                this.sendMessage();
                container.remove();
            });
            return btn;
        };

        container.appendChild(createBtn('Có'));
        container.appendChild(createBtn('Không'));

        this.messagesContainer.appendChild(container);
        this.messagesContainer.scrollTop = this.messagesContainer.scrollHeight;
    }

    showTyping() {
        const div = document.createElement('div');
        div.className = 'message bot-message typing';
        div.id = 'typing';
        div.innerText = 'Đang xử lý...';
        this.messagesContainer.appendChild(div);
        this.messagesContainer.scrollTop = this.messagesContainer.scrollHeight;
    }

    hideTyping() {
        const el = document.getElementById('typing');
        if (el) el.remove();
    }
}

document.addEventListener('DOMContentLoaded', () => new ShoeStoreChatbot());
