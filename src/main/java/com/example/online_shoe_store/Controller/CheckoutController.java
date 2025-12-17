package com.example.online_shoe_store.Controller;

import com.example.online_shoe_store.Entity.Order;
import com.example.online_shoe_store.Entity.Payment;
import com.example.online_shoe_store.Entity.User;
import com.example.online_shoe_store.Repository.OrderRepository;
import com.example.online_shoe_store.Repository.PaymentRepository;
import com.example.online_shoe_store.Repository.UserRepository;
import com.example.online_shoe_store.Service.CheckoutService;
import com.example.online_shoe_store.Service.PaymentService;
import com.example.online_shoe_store.Service.VNPayService;
import com.example.online_shoe_store.dto.request.PaymentCreateRequest;
import com.example.online_shoe_store.dto.request.CheckoutRequest;
import com.example.online_shoe_store.dto.response.PaymentResponse;
import com.example.online_shoe_store.exception.BusinessException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.text.NumberFormat;
import java.util.List;
import java.util.Locale;

@Controller
@RequestMapping("/checkout")
@RequiredArgsConstructor
@Slf4j
public class CheckoutController {

    private final CheckoutService checkoutService;
    private final PaymentService paymentService;
    private final PaymentRepository paymentRepository;
    private final OrderRepository orderRepository;
    private final UserRepository userRepository;
    private final VNPayService vnPayService;

    @GetMapping("/step1")
    public String step1(HttpSession session) {
        User user = getCurrentUser();
        if (user == null) {
            return "redirect:/login";
        }
        
        @SuppressWarnings("unchecked")
        List<String> selectedItems = (List<String>) session.getAttribute("selectedCartItems");
        if (selectedItems == null || selectedItems.isEmpty()) {
            return "redirect:/templates/cart";
        }
        
        // Data is now loaded via /api/checkout/data
        return "checkout/checkout-step1";
    }

    @GetMapping("/step2")
    public String step2(HttpSession session) {
        User user = getCurrentUser();
        if (user == null) {
            return "redirect:/login";
        }
        
        @SuppressWarnings("unchecked")
        List<String> selectedItems = (List<String>) session.getAttribute("selectedCartItems");
        if (selectedItems == null || selectedItems.isEmpty()) {
            return "redirect:/templates/cart";
        }
        
        // Data is now loaded via /api/checkout/data
        return "checkout/checkout-step2";
    }


    @PostMapping("/place-order")
    public String placeOrder(@ModelAttribute CheckoutRequest request,
                             HttpServletRequest httpRequest,
                             HttpSession session,
                             Model model) {
        User user = getCurrentUser();
        if (user == null) {
            return "redirect:/login";
        }

        try {
            // Merge shipping data from session (step1) with payment data from form (step2)
            CheckoutRequest savedRequest = (CheckoutRequest) session.getAttribute("checkoutRequest");
            if (savedRequest != null) {
                // Copy shipping info from step1
                request.setFullName(savedRequest.getFullName());
                request.setEmail(savedRequest.getEmail());
                request.setPhone(savedRequest.getPhone());
                request.setAddress(savedRequest.getAddress());
                request.setCity(savedRequest.getCity());
                request.setDistrict(savedRequest.getDistrict());
                request.setWard(savedRequest.getWard());
                request.setShippingType(savedRequest.getShippingType());
            }
            
            // Get selected cart items from session
            @SuppressWarnings("unchecked")
            List<String> selectedCartItems = (List<String>) session.getAttribute("selectedCartItems");
            
            // Tạo order (only for selected items)
            String orderId = checkoutService.placeOrder(user, request, selectedCartItems);

            // Tạo Payment qua PaymentService
            String paymentMethod = request.getPaymentMethod();
            if (paymentMethod == null || paymentMethod.isEmpty()) {
                paymentMethod = "COD";
            }

            PaymentCreateRequest paymentRequest = PaymentCreateRequest.builder()
                    .orderId(orderId)
                    .paymentMethod(paymentMethod.toUpperCase())
                    .language("vn")
                    .build();

            String ipAddress = getClientIp(httpRequest);
            PaymentResponse response = paymentService.createPayment(paymentRequest, ipAddress);

            if (!response.isSuccess()) {
                model.addAttribute("error", response.getMessage());
                model.addAttribute("user", user);
                return "checkout/checkout-step2";
            }

            // Nếu VNPay → redirect đến payment gateway
            if ("VNPAY".equalsIgnoreCase(paymentMethod)) {
                return "redirect:" + response.getPaymentUrl();
            }

            // Nếu COD → thanh toán thành công ngay → soft delete cart items
            checkoutService.softDeleteUserCartItems(user, selectedCartItems);
            
            // Redirect đến trang thành công với paymentId
            return "redirect:/checkout/success?paymentId=" + response.getPaymentId();

        } catch (BusinessException e) {
            log.error("Error placing order: {}", e.getMessage());
            model.addAttribute("error", e.getMessage());
            model.addAttribute("user", user);
            return "checkout/checkout-step2";
        }
    }

    @GetMapping("/success")
    public String checkoutSuccess(
            @RequestParam(required = false) String paymentId,
            @RequestParam(required = false) String orderId,
            Model model) {

        Order order = null;
        Payment payment = null;

        // Tìm order và payment dựa trên param
        if (paymentId != null && !paymentId.isEmpty()) {
            payment = paymentRepository.findById(paymentId).orElse(null);
            if (payment != null) {
                order = payment.getOrder();
            }
        } else if (orderId != null && !orderId.isEmpty()) {
            order = orderRepository.findById(orderId).orElse(null);
            if (order != null) {
                payment = order.getSuccessfulPayment();
            }
        }

        if (order == null) {
            log.warn("Order not found for paymentId={} or orderId={}", paymentId, orderId);
            return "redirect:/";
        }

        // Populate model với thông tin đơn hàng
        populateOrderSuccessModel(model, order, payment);

        return "checkout/checkout-step3";
    }

    /**
     * Legacy alias for the success page. Some flows still redirect to /checkout/step3,
     * so forward the request into the same success handler to avoid 404 static resource errors.
     */
    @GetMapping("/step3")
    public String step3(
            @RequestParam(required = false) String orderId,
            @RequestParam(required = false) String paymentId,
            Model model) {
        return checkoutSuccess(paymentId, orderId, model);
    }

    /**
     * Trang thất bại - hỗ trợ cả paymentId     và orderId (legacy)
     */
    @GetMapping("/failure")
    public String checkoutFailure(
            @RequestParam(required = false) String paymentId,
            @RequestParam(required = false) String orderId,
            @RequestParam(required = false) String code,
            @RequestParam(required = false) String error,
            Model model) {

        Order order = null;
        Payment payment = null;
        String errorMessage = null;

        // Tìm order và payment
        if (paymentId != null && !paymentId.isEmpty()) {
            payment = paymentRepository.findById(paymentId).orElse(null);
            if (payment != null) {
                order = payment.getOrder();
                errorMessage = payment.getFailureReason();
            }
        } else if (orderId != null && !orderId.isEmpty()) {
            order = orderRepository.findById(orderId).orElse(null);
        }

        // Lấy mô tả lỗi VNPay
        if (code != null && !code.isEmpty()) {
            errorMessage = vnPayService.getErrorDescription(code);
        }

        if (error != null && !error.isEmpty()) {
            errorMessage = "Đã xảy ra lỗi trong quá trình xử lý thanh toán";
        }

        model.addAttribute("orderId", order != null ? order.getOrderId() : orderId);
        model.addAttribute("paymentId", paymentId);
        model.addAttribute("errorCode", code);
        model.addAttribute("errorMessage", errorMessage);

        // Cho phép retry với order
        if (order != null) {
            model.addAttribute("canRetry", order.canBePaid());
        }

        return "checkout/checkout-failure";
    }

    /**
     * Retry payment cho đơn hàng thất bại
     */
    @GetMapping("/retry/{orderId}")
    public String retryPayment(@PathVariable String orderId,
                               @RequestParam(defaultValue = "VNPAY") String method,
                               HttpServletRequest httpRequest,
                               Model model) {
        User user = getCurrentUser();
        if (user == null) {
            return "redirect:/login";
        }

        try {
            PaymentCreateRequest paymentRequest = PaymentCreateRequest.builder()
                    .orderId(orderId)
                    .paymentMethod(method.toUpperCase())
                    .language("vn")
                    .build();

            String ipAddress = getClientIp(httpRequest);
            PaymentResponse response = paymentService.createPayment(paymentRequest, ipAddress);

            if (!response.isSuccess()) {
                model.addAttribute("error", response.getMessage());
                return "redirect:/checkout/failure?orderId=" + orderId + "&error=retry_failed";
            }

            if ("VNPAY".equalsIgnoreCase(method)) {
                return "redirect:" + response.getPaymentUrl();
            }

            return "redirect:/checkout/success?paymentId=" + response.getPaymentId();

        } catch (BusinessException e) {
            log.error("Error retrying payment for order {}: {}", orderId, e.getMessage());
            return "redirect:/checkout/failure?orderId=" + orderId + "&error=" + e.getErrorCode();
        }
    }

    /**
     * Populate model với thông tin đơn hàng thành công
     */
    private void populateOrderSuccessModel(Model model, Order order, Payment payment) {
        model.addAttribute("orderId", order.getOrderId());
        model.addAttribute("order", order);
        model.addAttribute("payment", payment);

        // Thông tin khách hàng
        User user = order.getUser();
        if (user != null) {
            model.addAttribute("customerName", user.getName());
            model.addAttribute("phone", user.getPhone());
            model.addAttribute("email", user.getEmail());
        }

        // Địa chỉ giao hàng
        if (order.getShipDetail() != null) {
            model.addAttribute("address", order.getShipDetail());
        }

        // Phương thức thanh toán
        if (payment != null && payment.getPaymentMethod() != null) {
            String methodName = payment.getPaymentMethod().getMethodName();
            String displayName = "COD".equals(methodName) ? "Thanh toán khi nhận hàng" :
                    "VNPAY".equals(methodName) ? "VNPay" : methodName;
            model.addAttribute("paymentMethod", displayName);
            model.addAttribute("transactionId", payment.getTransactionId());
        }

        // Tổng tiền
        NumberFormat formatter = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));
        model.addAttribute("totalAmount", formatter.format(order.getFinalAmount() != null ?
                order.getFinalAmount() : order.getTotalAmount()));
    }

    private User getCurrentUser() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null && auth.isAuthenticated() && !"anonymousUser".equals(auth.getPrincipal())) {
            String username = auth.getName();
            return userRepository.findByUsername(username).orElse(null);
        }
        return null;
    }

    private String getClientIp(HttpServletRequest request) {
        String xForwardedFor = request.getHeader("X-Forwarded-For");
        if (xForwardedFor != null && !xForwardedFor.isEmpty()) {
            return xForwardedFor.split(",")[0].trim();
        }
        String xRealIp = request.getHeader("X-Real-IP");
        if (xRealIp != null && !xRealIp.isEmpty()) {
            return xRealIp;
        }
        return request.getRemoteAddr();
    }
}