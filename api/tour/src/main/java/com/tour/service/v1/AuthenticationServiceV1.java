package com.tour.service.v1;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tour.entity.LoginDetail;
import com.tour.entity.LoginSession;
import com.tour.model.CustomerModel;
import com.tour.model.LoginRequest;
import com.tour.model.LoginResponse;
import com.tour.repository.LoginDetailRepository;
import com.tour.repository.LoginSessionRepository;
import com.tour.service.AuthenticationService;
import com.tour.service.CustomerService;
import com.tour.service.util.PasswordUtil;

@Service
public class AuthenticationServiceV1 implements AuthenticationService {

    private final PasswordUtil passwordUtil;
    private final LoginDetailRepository loginDetailRepository;
    private final LoginSessionRepository loginSessionRepository;
    private final CustomerService customerService;
    
    @Autowired
    public AuthenticationServiceV1(PasswordUtil passwordUtil, LoginDetailRepository loginDetailRepository, LoginSessionRepository loginSessionRepository, CustomerService customerService) {
        this.passwordUtil = passwordUtil;
        this.loginDetailRepository = loginDetailRepository;
        this.loginSessionRepository = loginSessionRepository;
        this.customerService = customerService;
    }

    @Override
    public LoginResponse login(LoginRequest request) {
        Optional<LoginDetail> detail = loginDetailRepository.findByPhoneNumber(request.getPhoneNumber());
        if(detail.isEmpty())
            return LoginResponse.empty();
        LoginDetail _detail = detail.get();
        if(!passwordUtil.checkPassword(request.getPassword(), _detail.getPassword()))
            return LoginResponse.empty();
        Optional<CustomerModel> customer = customerService.getById(_detail.getUserId());
        if(customer.isEmpty())
            return LoginResponse.empty();
        String token = passwordUtil.getToken(customer.get().getUserId() + customer.get().getFullname());
        
        LoginSession session = new LoginSession(-1, customer.get().getUserId(), token, _detail.getPermission());
        loginSessionRepository.save(session);

        return new LoginResponse(token, customer.get(), _detail.getPermission());
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
        customerService.save(customer);
    }
}
