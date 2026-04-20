package com.smartclinic.backend.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;
import java.util.Map;

@RestController
@RequestMapping("/api")
public class HealthController {

    @GetMapping("/health")
    public ResponseEntity<Map<String, Object>> health() {
        Map<String, Object> response = Map.of(
                "status",    "UP",
                "service",   "SmartClinic Pro API",
                "version",   "1.0.0",
                "timestamp", LocalDateTime.now().toString()
        );
        return ResponseEntity.ok(response);
    }

    @GetMapping("/hello")
    public ResponseEntity<Map<String, String>> hello() {
        return ResponseEntity.ok(Map.of(
                "message", "Hello from SmartClinic Pro!",
                "author",  "Manavkumar Patel",
                "step",    "3 - First Spring Boot API"
        ));
    }
}