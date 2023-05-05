package com.tour.service.v1;

import java.util.Collection;
import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.tour.entity.Customer;
import com.tour.model.CustomerModel;
import com.tour.repository.CustomerRepository;
import com.tour.service.CustomerService;

@Service
public class CustomerServiceV1 implements CustomerService {

    private final CustomerRepository customerRepository;

    public CustomerServiceV1(CustomerRepository customerRepository) {
        this.customerRepository = customerRepository;
    }

    @Override
    public Collection<CustomerModel> getAll() {
        return ((List<Customer>) customerRepository.findAll()).stream().map((e) -> CustomerModel.fromEntity(e)).toList();
    }

    @Override
    public Optional<CustomerModel> getById(Integer id) {
        Optional<Customer> customer = customerRepository.findById(id);
        if(customer.isEmpty())
            return Optional.empty();
        return Optional.of(CustomerModel.fromEntity(customer.get()));
    }

    @Override
    public CustomerModel save(CustomerModel model) {
        Optional<Customer> entity = customerRepository.findById(model.getUserId());
        if(entity.isEmpty()) {
            // INSERT
            Customer customer = new Customer(model);
            customer = customerRepository.save(customer);
            return CustomerModel.fromEntity(customer);
        }
        Customer eCustomer = entity.get();
        eCustomer.merge(new Customer(model));
        customerRepository.save(eCustomer);
        return CustomerModel.fromEntity(eCustomer);
    }

    @Override
    public void delete(CustomerModel model) {
        customerRepository.deleteById(model.getUserId());
    }

    @Override
    public void deleteById(Integer id) {
        customerRepository.deleteById(id);
    }
}
