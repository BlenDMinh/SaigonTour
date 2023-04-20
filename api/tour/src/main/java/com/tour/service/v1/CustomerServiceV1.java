package com.tour.service.v1;

import java.util.Collection;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tour.entity.Customer;
import com.tour.model.CustomerModel;
import com.tour.repository.CustomerRepository;
import com.tour.service.CustomerService;

@Service
public class CustomerServiceV1 implements CustomerService {

    private final CustomerRepository customerRepository;

    @Autowired
    public CustomerServiceV1(CustomerRepository customerRepository) {
        this.customerRepository = customerRepository;
    }

    @Override
    public Collection<CustomerModel> getAll() {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'getAll'");
    }

    @Override
    public Optional<CustomerModel> getById(Integer id) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'getById'");
    }

    @Override
    public void save(CustomerModel model) {
        Optional<Customer> entity = customerRepository.findById(model.getUserId());
        if(entity.isEmpty()) {
            // INSERT
            // Customer customer = new Customer(model);
            // customerRepository.save(customer);
        }
    }

    @Override
    public void delete(CustomerModel model) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'delete'");
    }

    @Override
    public void deleteById(Integer id) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'deleteById'");
    }
}
