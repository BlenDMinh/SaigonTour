package com.tour.repository;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import com.tour.entity.LoginDetail;

public interface LoginDetailRepository extends CrudRepository<LoginDetail, Integer>{
    Optional<LoginDetail> findByPhoneNumber(String phoneNumber);
}