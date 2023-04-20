package com.tour.repository;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import com.tour.entity.Customer;

public interface CustomerRepository extends CrudRepository<Customer, Integer> {
    Optional<Customer> findByPhoneNumber(String phoneNumber);
}