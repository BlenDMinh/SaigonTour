package com.tour.repository;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import com.tour.entity.LoginSession;

public interface LoginSessionRepository extends CrudRepository<LoginSession, Integer> {
    Optional<LoginSession> findByUserId(Integer userId);
    Optional<LoginSession> findByToken(String token);
}
