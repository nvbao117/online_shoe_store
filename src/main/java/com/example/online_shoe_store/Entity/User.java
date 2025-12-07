package com.example.online_shoe_store.Entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Entity
@Table(name = "users")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long user_id;
    private String username;
    private String password;
    private String email;
    private String phone;
    private String name;
    private LocalDate created_at;
    private Boolean is_active;
    private String user_rank;
    public enum Role{
        USER, ADMIN
    }




}
