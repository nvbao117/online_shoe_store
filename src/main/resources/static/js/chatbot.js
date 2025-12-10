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
        div.innerHTML = text;
        this.messagesContainer.appendChild(div);
        this.messagesContainer.scrollTop = this.messagesContainer.scrollHeight;
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
