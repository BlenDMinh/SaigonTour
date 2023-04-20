package com.tour.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.tour.model.LoginRequest;
import com.tour.model.LoginResponse;
import com.tour.model.RegisterInfo;
import com.tour.service.AuthenticationService;

@RestController
@RequestMapping("/api/authen")
public class AuthenticationController {

    private final AuthenticationService authenticationService;

    public AuthenticationController(AuthenticationService authenticationService) {
        this.authenticationService = authenticationService;
    }

    @PostMapping("/register")
    public String register(@RequestBody RegisterInfo registerInfo) {
        authenticationService.registerCustomer(registerInfo.getCustomer(), registerInfo.getPassword());
        return "OK";
    }

    @PostMapping("/login")
    public ResponseEntity<LoginResponse> login(@RequestBody LoginRequest request) {
        LoginResponse response = authenticationService.login(request);
        if(response.isEmpty())
            return ResponseEntity.badRequest().body(response);
        return ResponseEntity.ok(response);
    }

    @PostMapping("/logout")
    public String logout(@RequestBody Integer userId) {
        authenticationService.logout(userId);
        return "OK";
    }
}
