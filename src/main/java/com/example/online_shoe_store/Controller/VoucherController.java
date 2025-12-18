package com.example.online_shoe_store.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class VoucherController {
    @GetMapping({"/voucher-status", "/admin/voucher", "/admin/vouchers"})
    public String showAdminVoucherStatus() {
        return "/admin/voucher-status";
    }

    @GetMapping({"/admin/voucher-create", "/admin/vouchers/create"})
    public String showAdminVoucherCreate() {
        return "/admin/voucher-create";
    }
}
