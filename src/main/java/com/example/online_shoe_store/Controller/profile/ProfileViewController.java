package com.example.online_shoe_store.Controller.profile;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ProfileViewController {
    @GetMapping("/profile")
    public String profile() {
        return "/user/profile";
    }
}
