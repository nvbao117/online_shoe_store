/**
 * ==================================================
 * CHATBOT LOGIC - Bubble Edition
 * Handles view transitions between Welcome Card and Conversation
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

        // Icons
        this.iconClosed = this.toggle.querySelector('.icon-closed');
        this.iconOpen = this.toggle.querySelector('.icon-open');

        // State
        this.isOpen = false;
        this.activeView = 'welcome'; // 'welcome' or 'conversation'
        this.isTyping = false;
        this.sessionId = null;

        this.init();
    }

    init() {
        if (!this.widget) return;

        // Toggle Widget
        this.toggle.addEventListener('click', () => this.toggleWidget());

        // Navigation
        this.startChatBtn.addEventListener('click', () => this.switchToConversation());
        this.backBtn.addEventListener('click', () => this.switchToWelcome());

        // Chat Actions
        this.sendBtn.addEventListener('click', () => this.sendMessage());
        this.input.addEventListener('keypress', (e) => {
            if (e.key === 'Enter') this.sendMessage();
        });
    }

    toggleWidget() {
        this.isOpen = !this.isOpen;
        this.widget.classList.toggle('active', this.isOpen);

        // Toggle Icons
        if (this.isOpen) {
            this.iconClosed.classList.add('hidden');
            this.iconOpen.classList.remove('hidden');
        } else {
            this.iconClosed.classList.remove('hidden');
            this.iconOpen.classList.add('hidden');
        }
    }

    switchToConversation() {
        this.activeView = 'conversation';
        this.welcomeView.classList.add('hidden');
        this.conversationView.classList.remove('hidden');

        // Add initial greeting if empty
        if (this.messagesContainer.children.length === 0) {
            this.addMessage("Chào bạn! Shoe Store có thể giúp gì được cho bạn hôm nay? 👟", 'bot');
        }
    }

    switchToWelcome() {
        this.activeView = 'welcome';
        this.conversationView.classList.add('hidden');
        this.welcomeView.classList.remove('hidden');
    }

    sendMessage() {
        const text = this.input.value.trim();
        if (!text) return;
        this.addMessage(text, 'user');
        this.input.value = '';
        this.showTyping();
        // Call Backend API
        fetch('/api/chat/send', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                message: text,
                sessionId: this.sessionId  // ← GỬI sessionId
            })
        })
            .then(response => response.json())
            .then(data => {
                this.hideTyping();

                // Lưu sessionId từ response
                if (data.sessionId) {
                    this.sessionId = data.sessionId;  // ← LƯU sessionId
                }

                this.addMessage(data.response, 'bot');
            })
            .catch(error => {
                console.error('Error:', error);
                this.hideTyping();
                this.addMessage("Xin lỗi, mình đang gặp sự cố kết nối. Vui lòng thử lại sau! 😔", 'bot');
            });
    }
    addMessage(text, type) {
        const div = document.createElement('div');
        div.className = `message ${type}-message`;

        if (type === 'bot') {
            // Parse markdown-like formatting
            div.innerHTML = this.formatBotMessage(text);
        } else {
            div.textContent = text;
        }

        this.messagesContainer.appendChild(div);
        this.messagesContainer.scrollTop = this.messagesContainer.scrollHeight;
    }

    /**
     * Format bot message with rich formatting
     */
    formatBotMessage(text) {
        let formatted = text
            // Bold: **text** or __text__
            .replace(/\*\*(.*?)\*\*/g, '<strong>$1</strong>')
            .replace(/__(.*?)__/g, '<strong>$1</strong>')

            // Italic: *text* or _text_
            .replace(/\*(?!\*)(.*?)\*/g, '<em>$1</em>')
            .replace(/_(?!_)(.*?)_/g, '<em>$1</em>')

            // Bullet points: - text or • text
            .replace(/^[-•]\s+(.+)$/gm, '<li>$1</li>')

            // Numbered list: 1. text
            .replace(/^\d+\.\s+(.+)$/gm, '<li>$1</li>')

            // Price formatting: xxx,xxxđ or xxx.xxxđ
            .replace(/(\d{1,3}(?:[,.\s]?\d{3})*)\s*đ/g, '<span class="price">$1đ</span>')

            // Product name highlight: 【text】or [text]
            .replace(/【(.+?)】/g, '<span class="product-name">$1</span>')

            // Emoji spacing
            .replace(/(👟|💰|🏷️|📦|✨|⭐|🔥|💯|🎉)/g, '<span class="emoji">$1</span>')

            // Line breaks
            .replace(/\n/g, '<br>');

        // Wrap list items in ul
        if (formatted.includes('<li>')) {
            formatted = formatted.replace(/(<li>.*?<\/li>)+/g, '<ul class="bot-list">$&</ul>');
        }

        return formatted;
    }

    showTyping() {
        const div = document.createElement('div');
        div.className = 'message bot-message typing';
        div.id = 'typing';
        div.innerText = 'Đang nhập...';
        this.messagesContainer.appendChild(div);
        this.messagesContainer.scrollTop = this.messagesContainer.scrollHeight;
    }

    hideTyping() {
        const el = document.getElementById('typing');
        if (el) el.remove();
    }

}

document.addEventListener('DOMContentLoaded', () => new ShoeStoreChatbot());
