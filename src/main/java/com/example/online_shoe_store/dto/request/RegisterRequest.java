package com.example.online_shoe_store.dto.request;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RegisterRequest {
    private String fullName; //Map sang User.name
    private String dateOfBirth;
    private String email;
    private String mobileNumber;
    private String otp;
    private String gender;
    private String username;
    private String password;
    private String confirmPassword;
}
