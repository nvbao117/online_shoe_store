/**
 * CHECKOUT PAGE JAVASCRIPT
 */

document.addEventListener('DOMContentLoaded', function () {
    initMethodSelection();
    initFormValidation();
    initCouponTags();
});

function initMethodSelection() {
    const methodOptions = document.querySelectorAll('.method-option');

    methodOptions.forEach(option => {
        option.addEventListener('click', function () {
            const container = this.closest('.shipping-methods, .payment-methods');
            if (container) {
                container.querySelectorAll('.method-option').forEach(opt => {
                    opt.classList.remove('active');
                });
                this.classList.add('active');
                const radio = this.querySelector('input[type="radio"]');
                if (radio) radio.checked = true;
            }
        });
    });
}

function initFormValidation() {
    const form = document.getElementById('shippingForm');
    if (form) {
        form.addEventListener('submit', function (e) {
            const inputs = form.querySelectorAll('[required]');
            let isValid = true;

            inputs.forEach(input => {
                if (!input.value.trim()) {
                    isValid = false;
                    input.classList.add('is-invalid');
                } else {
                    input.classList.remove('is-invalid');
                }
            });

            if (!isValid) {
                e.preventDefault();
                alert('Vui lòng điền đầy đủ thông tin!');
            }
        });
    }
}

function initCouponTags() {
    const couponTags = document.querySelectorAll('.coupon-tag');
    const couponInput = document.querySelector('.coupon-input-group .form-control');

    couponTags.forEach(tag => {
        tag.addEventListener('click', function () {
            const code = this.textContent.replace('🎁 ', '').trim();
            if (couponInput) couponInput.value = code;
        });
    });
}

/**
 * VNPay Payment Loading Indicator
 * Hiển thị loading khi chuyển hướng đến VNPay
 */
function initVNPayLoading() {
    document.querySelector('form[action*="place-order"]')?.addEventListener('submit', function (e) {
        const paymentMethod = document.querySelector('input[name="paymentMethod"]:checked')?.value;

        if (paymentMethod === 'vnpay') {
            const btn = document.querySelector('.btn-continue');
            if (btn) {
                btn.innerHTML = '<span class="spinner-border spinner-border-sm me-2"></span>Đang chuyển hướng...';
                btn.disabled = true;
            }
        }
    });
}

// Gọi hàm init VNPay loading
document.addEventListener('DOMContentLoaded', function () {
    initVNPayLoading();
});
