const ProfilePage = {
    API_URL: '/api/me',
    CHANGE_PASSWORD_URL: '/api/me/password',

    // Elements
    usernameEl: document.getElementById('profile-username'),
    nameInput: document.getElementById('profile-name'),
    nameDisplay: document.getElementById('user-name'),
    emailDisplay: document.getElementById('profile-email-display'),
    emailInput: document.getElementById('profile-email-input'),
    emailEditBtn: document.getElementById('btn-edit-email'),
    phoneDisplay: document.getElementById('profile-phone-display'),
    phoneInput: document.getElementById('profile-phone-input'),
    phoneEditBtn: document.getElementById('btn-edit-phone'),
    saveBtn: document.getElementById('btn-save-profile'),

    // Password Elements
    pwdCurrent: document.getElementById('password-current'),
    pwdNew: document.getElementById('password-new'),
    pwdConfirm: document.getElementById('password-confirm'),
    pwdConfirmBtn: document.getElementById('btn-confirm-change-password'),

    // State
    originalData: {},

    init() {
        if (!this.usernameEl) return; // Guard clause if elements missing
        this.loadProfile();
        this.bindEvents();
    },

    async loadProfile() {
        try {
            const res = await fetch(this.API_URL);
            if (res.ok) {
                const data = await res.json();
                this.originalData = data;
                this.render(data);
            }
        } catch (e) {
            console.error("Load profile error", e);
        }
    },

    render(data) {
        if (this.usernameEl) this.usernameEl.innerText = data.username;
        if (this.nameInput)
        {
            this.nameInput.value = data.name;
            this.nameDisplay.innerText = data.name;
        }

        // Render masked email/phone initally
        this.renderEmail(data.email, false);
        this.renderPhone(data.phone, false);
    },

    renderEmail(email, isEditing) {
        if (isEditing) {
            this.emailDisplay.classList.add('hidden');
            this.emailInput.classList.remove('hidden');
            this.emailInput.value = email;
            this.emailEditBtn.innerText = 'Hủy';
        } else {
            this.emailDisplay.classList.remove('hidden');
            this.emailInput.classList.add('hidden');
            this.emailDisplay.innerText = this.maskEmail(email);
            this.emailEditBtn.innerText = 'Thay đổi';
        }
    },

    renderPhone(phone, isEditing) {
        if (isEditing) {
            this.phoneDisplay.classList.add('hidden');
            this.phoneInput.classList.remove('hidden');
            this.phoneInput.value = phone;
            this.phoneEditBtn.innerText = 'Hủy';
        } else {
            this.phoneDisplay.classList.remove('hidden');
            this.phoneInput.classList.add('hidden');
            this.phoneDisplay.innerText = this.maskPhone(phone);
            this.phoneEditBtn.innerText = 'Thay đổi';
        }
    },

    maskEmail(email) {
        if (!email) return '';
        const [name, domain] = email.split('@');
        if (name.length <= 3) return email;
        return name.substring(0, 3) + '***@' + domain;
    },

    maskPhone(phone) {
        if (!phone || phone.length < 4) return phone;
        return '*******' + phone.substring(phone.length - 3);
    },

    bindEvents() {
        // Toggle Edit Email
        this.emailEditBtn?.addEventListener('click', () => {
            const isHidden = this.emailInput.classList.contains('hidden');
            this.renderEmail(this.originalData.email, isHidden);
        });

        // Toggle Edit Phone
        this.phoneEditBtn?.addEventListener('click', () => {
            const isHidden = this.phoneInput.classList.contains('hidden');
            this.renderPhone(this.originalData.phone, isHidden);
        });

        // Save Profile
        this.saveBtn?.addEventListener('click', () => this.updateProfile());

        // Change Password
        this.pwdConfirmBtn?.addEventListener('click', () => this.changePassword());
    },

    async updateProfile() {
        // Use input values if editing, else use original data (or unmasked if available in input)
        // Actually, we should take values from inputs if they are visible, or keep original if not?
        // Simpler: Always take from inputs if valid, but inputs might be hidden and empty if never toggled?
        // Wait, loadProfile sets input values? No, loadProfile only set nameInput.
        // Let's ensure inputs are populated when entering edit mode, or just user current visible value.

        // Correct logic:
        // Name is always input.
        // Email: if input visible, use input value. Else use originalData.email.
        // Phone: if input visible, use input value. Else use originalData.phone.

        const isEmailEditing = !this.emailInput.classList.contains('hidden');
        const isPhoneEditing = !this.phoneInput.classList.contains('hidden');

        const payload = {
            name: this.nameInput.value,
            email: isEmailEditing ? this.emailInput.value : this.originalData.email,
            phone: isPhoneEditing ? this.phoneInput.value : this.originalData.phone
        };

        try {
            const res = await fetch(this.API_URL, {
                method: 'PUT',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(payload)
            });
            const text = await res.text();

            if (res.ok) {
                alert(text);
                this.loadProfile(); // Reload to refresh data and masking
            } else {
                alert('Lỗi: ' + text);
            }
        } catch (e) {
            alert('Có lỗi xảy ra khi cập nhật hồ sơ');
        }
    },

    async changePassword() {
        const payload = {
            currentPassword: this.pwdCurrent.value,
            newPassword: this.pwdNew.value,
            confirmPassword: this.pwdConfirm.value
        };

        if (payload.newPassword !== payload.confirmPassword) {
            alert('Mật khẩu xác nhận không khớp');
            return;
        }

        try {
            const res = await fetch(this.CHANGE_PASSWORD_URL, {
                method: 'PUT',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(payload)
            });
            const text = await res.text();

            if (res.ok) {
                alert(text);
                // Reset fields
                this.pwdCurrent.value = '';
                this.pwdNew.value = '';
                this.pwdConfirm.value = '';
                // Close view (optional, reuse global function if needed or just leave open)
                if (window.togglePasswordView) window.togglePasswordView(false);
            } else {
                alert('Lỗi: ' + text);
            }
        } catch (e) {
            alert('Có lỗi xảy ra khi đổi mật khẩu');
        }
    }
};

document.addEventListener('DOMContentLoaded', () => {
    ProfilePage.init();
});
