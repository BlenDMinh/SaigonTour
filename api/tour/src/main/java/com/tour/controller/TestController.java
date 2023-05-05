package com.tour.controller;

import java.util.ArrayList;
import java.util.HashSet;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.tour.entity.Customer;
import com.tour.entity.LoginDetail;
import com.tour.repository.CustomerRepository;

@RestController
@RequestMapping("/api")
public class TestController {

    private final CustomerRepository repository;

    public TestController(CustomerRepository repository) {
        this.repository = repository;
    }

    @GetMapping("/test")
    public String f() {
        try {
            Customer customer = new Customer(-1, "A", 18, "1", new LoginDetail(), new HashSet<>(), new ArrayList<>());
            repository.save(customer);
        } catch(Exception e) {
            e.printStackTrace();
            return "No";
        }
        return "OK";
    }
}