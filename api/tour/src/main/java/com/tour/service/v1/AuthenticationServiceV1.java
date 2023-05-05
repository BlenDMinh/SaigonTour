package com.tour.service.v1;

import java.util.Optional;

import org.springframework.stereotype.Service;

import com.tour.entity.Customer;
import com.tour.entity.LoginDetail;
import com.tour.entity.LoginSession;
import com.tour.model.CustomerModel;
import com.tour.model.LoginRequest;
import com.tour.model.LoginResponse;
import com.tour.repository.CustomerRepository;
import com.tour.repository.LoginSessionRepository;
import com.tour.service.AuthenticationService;
import com.tour.service.util.PasswordUtil;

@Service
public class AuthenticationServiceV1 implements AuthenticationService {

    private final PasswordUtil passwordUtil;
    private final LoginSessionRepository loginSessionRepository;
    private final CustomerRepository customerRepository;
    
    public AuthenticationServiceV1(PasswordUtil passwordUtil, LoginSessionRepository loginSessionRepository, CustomerRepository customerRepository) {
        this.passwordUtil = passwordUtil;
        this.loginSessionRepository = loginSessionRepository;
        this.customerRepository = customerRepository;
    }

    @Override
    public LoginResponse login(LoginRequest request) {
        if(request.getToken() != null && !request.getToken().isBlank() && !request.getToken().isEmpty()) {
            Optional<LoginSession> session = loginSessionRepository.findByToken(request.getToken());
            if(session.isEmpty())
                return LoginResponse.empty();
            Optional<Customer> customer = customerRepository.findById(session.get().getUserId());
            if(customer.isEmpty())
                return LoginResponse.empty();
            return new LoginResponse(request.getToken(), CustomerModel.fromEntity(customer.get()), session.get().getPermission());
        }
        Optional<Customer> customer = customerRepository.findByPhoneNumber(request.getPhoneNumber());
        if(customer.isEmpty())
            return LoginResponse.empty();
        LoginDetail _detail = customer.get().getLoginDetail();
        if(!passwordUtil.checkPassword(request.getPassword(), _detail.getPassword()))
            return LoginResponse.empty();
        CustomerModel customerModel = CustomerModel.fromEntity(customer.get());
        String token = passwordUtil.getToken(customer.get().getUserId() + customer.get().getFullname());
        LoginSession session = new LoginSession(-1, customer.get().getUserId(), token, _detail.getPermission());
        loginSessionRepository.save(session);
        return new LoginResponse(token, customerModel, _detail.getPermission());
    }

    @Override
    public void logout(Integer userId) {
        Optional<LoginSession> session = loginSessionRepository.findByUserId(userId);
        if(session.isEmpty())
            return;
        loginSessionRepository.delete(session.get());
    }

    @Override
    public void registerCustomer(CustomerModel customer, String password) {
        Customer eCustomer = new Customer(customer);
        eCustomer.getLoginDetail().setPassword(passwordUtil.getHashedPassword(password));
        customerRepository.save(eCustomer);
    }

    @Override
    public void changePassword(Integer userId, String password) {
        Optional<Customer> customer = customerRepository.findById(userId);
        if(customer.isEmpty())
            return;
        Customer _customer = customer.get();
        _customer.getLoginDetail().setPassword(passwordUtil.getHashedPassword(password));
        customerRepository.save(_customer);
    }
}