package com.tour.controller;

import java.util.Collection;
import java.util.Optional;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.tour.model.TourModel;
import com.tour.service.TourService;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping("/api/tour")
public class TourController {
    private final TourService service;
    public TourController(TourService service) {
        this.service = service;
    }

    @GetMapping
    public ResponseEntity<Collection<TourModel>> getAll() {
        return ResponseEntity.ok(service.getAll());
    }

    @GetMapping("/{id}")
    public ResponseEntity<TourModel> getById(@PathVariable("id") Integer id) {
        Optional<TourModel> customer = service.getById(id);
        if(customer.isEmpty())
            return ResponseEntity.notFound().build();
        return ResponseEntity.ok(customer.get());
    }

    @PostMapping
    public ResponseEntity<TourModel> insert(@RequestBody TourModel model) {
        return ResponseEntity.of(Optional.of(service.save(model)));
    }

    @DeleteMapping
    public String delete(@RequestBody TourModel model) {
        service.delete(model);
        return "DELETED";
    }

    @DeleteMapping("/{id}")
    public String deleteById(@PathVariable Integer id) {
        service.deleteById(id);
        return "DELETED";
    }
}