package com.tour.entity;

import java.util.List;
import java.util.Set;

import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.OneToMany;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Customer extends User {
    @Enumerated(EnumType.ORDINAL)
    private Set<PaymentMethod> paymentMethods;
    @OneToMany
    private List<TourDetail> tourDetails;
}