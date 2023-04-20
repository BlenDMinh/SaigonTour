package com.tour.repository;

import org.springframework.data.repository.CrudRepository;

import com.tour.entity.Customer;

public interface CustomerRepository extends CrudRepository<Customer, Integer> {}