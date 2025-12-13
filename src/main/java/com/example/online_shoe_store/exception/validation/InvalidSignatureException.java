package com.example.online_shoe_store.exception.validation;

public class InvalidSignatureException extends RuntimeException {
    public InvalidSignatureException(String message) {
        super(message);
    }
}
