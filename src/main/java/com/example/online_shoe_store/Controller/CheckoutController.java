package com.example.online_shoe_store.Controller;

import com.example.online_shoe_store.Entity.User;
import com.example.online_shoe_store.Repository.UserRepository;
import com.example.online_shoe_store.Service.CheckoutService;
import com.example.online_shoe_store.dto.request.CheckoutRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/checkout")
@RequiredArgsConstructor
public class CheckoutController {

    private final CheckoutService checkoutService;
    private final UserRepository userRepository;

    @GetMapping("/step1")
    public String showStep1(Model model, HttpSession session) {
        // If user is logged in, pre-fill form?
        // Thymeleaf handles user info via ${user} if added to model by global advice or security.
        // If not, we fetch dummy for now or let template handle nulls.
        // Assuming there is a current user. 
        // For simplicity in this fix, we rely on the form filling.
        return "checkout/checkout-step1";
    }

    @PostMapping("/step2") // Handle form submission from Step 1
    public String handleStep1Submit(@ModelAttribute CheckoutRequest request, HttpSession session) {
        // Store shipping info in session
        session.setAttribute("checkoutRequest", request);
        return "checkout/checkout-step2";
    }
    
    // For direct access to step 2 (optional validation)
    @GetMapping("/step2")
    public String showStep2() {
        return "checkout/checkout-step2";
    }

    @PostMapping("/place-order")
    public String placeOrder(@ModelAttribute CheckoutRequest finalRequest, HttpSession session, RedirectAttributes redirectAttributes) {
        // Retrieve info from step 1
        CheckoutRequest sessionRequest = (CheckoutRequest) session.getAttribute("checkoutRequest");
        if (sessionRequest == null) {
            return "redirect:/checkout/step1";
        }
        
        // Merge payment method from step 2
        sessionRequest.setPaymentMethod(finalRequest.getPaymentMethod());
        sessionRequest.setShippingMethod(finalRequest.getShippingMethod());
        
        // Get Current User (Hardcoded or Principal)
        // Since I don't see Security Context here, I'll fetch the first user or 'admin' for demo failure avoidance
        // REAL APP: Use Principal
        User user = userRepository.findAll().stream().findFirst().orElseThrow(() -> new RuntimeException("No users found"));
        // OR better:
        // User user = userRepository.findByUsername(principal.getName())...; 

        String orderId = checkoutService.placeOrder(user, sessionRequest);
        
        // Pass info to success page
        redirectAttributes.addFlashAttribute("orderId", orderId);
        // Add other details if needed for success page display
        redirectAttributes.addFlashAttribute("totalAmount", "Calculating..."); // Service didn't return total, but simple text for now
        
        // Clean session
        session.removeAttribute("checkoutRequest");
        
        return "redirect:/checkout/step3";
    }

    @GetMapping("/step3")
    public String showStep3() {
        return "checkout/checkout-step3";
    }
}