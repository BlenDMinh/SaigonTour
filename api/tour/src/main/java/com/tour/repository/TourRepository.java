package com.tour.repository;

import org.springframework.data.repository.CrudRepository;

import com.tour.entity.Tour;

public interface TourRepository extends CrudRepository<Tour, Integer> {}
