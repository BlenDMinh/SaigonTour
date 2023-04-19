package com.tour.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class TourDetail {
    @Id @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer tourDetailId;
    private Tour tour;
    private Customer tourUser;
    private String vehicle;

    @Enumerated(EnumType.ORDINAL)
    private UserType userType;
}
