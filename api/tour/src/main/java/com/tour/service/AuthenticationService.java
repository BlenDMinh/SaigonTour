package com.tour.service;

import com.tour.model.CustomerModel;
import com.tour.model.LoginRequest;
import com.tour.model.LoginResponse;

public interface AuthenticationService {
    void registerCustomer(CustomerModel customer, String password);
    LoginResponse login(LoginRequest request);
    void logout(Integer userId);
    void changePassword(String phoneNumber, String password);
}