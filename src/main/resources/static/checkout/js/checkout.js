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
