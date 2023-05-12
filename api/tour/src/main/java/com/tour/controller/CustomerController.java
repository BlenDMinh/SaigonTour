package com.tour.controller;

import java.util.Collection;
import java.util.Optional;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.tour.model.CustomerModel;
import com.tour.service.CustomerService;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping("/api/customer")
public class CustomerController {
    private final CustomerService service;

    public CustomerController(CustomerService service) {
        this.service = service;
    }

    @GetMapping
    public ResponseEntity<Collection<CustomerModel>> getAll() {
        return ResponseEntity.ok(service.getAll());
    }

    @GetMapping("/{id}")
    public ResponseEntity<CustomerModel> getById(@PathVariable("id") Integer id) {
        Optional<CustomerModel> customer = service.getById(id);
        if(customer.isEmpty())
            return ResponseEntity.notFound().build();
        return ResponseEntity.ok(customer.get());
    }

    @PostMapping
    public ResponseEntity<CustomerModel> insert(@RequestBody CustomerModel model) {
        return ResponseEntity.of(Optional.of(service.save(model)));
    }

    @PutMapping
    public ResponseEntity<CustomerModel> update(@RequestBody CustomerModel model) {
        return ResponseEntity.of(Optional.of(service.save(model)));
    }

    @DeleteMapping
    public String delete(@RequestBody CustomerModel model) {
        service.delete(model);
        return "DELETED";
    }

    @DeleteMapping("/{id}")
    public String deleteById(@PathVariable Integer id) {
        service.deleteById(id);
        return "DELETED";
    }
}
