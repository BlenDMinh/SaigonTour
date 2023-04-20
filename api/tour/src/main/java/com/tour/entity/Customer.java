package com.tour.entity;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.tour.model.CustomerModel;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Customer {
    @Id @GeneratedValue(strategy = GenerationType.AUTO)
    protected Integer userId;
    protected String fullname;
    protected Integer age;
    protected String phoneNumber;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(referencedColumnName = "_loginDetailId")
    private LoginDetail loginDetail;
    
    @Enumerated(EnumType.ORDINAL)
    private Set<PaymentMethod> paymentMethods;
    @OneToMany(mappedBy = "tourUser", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<TourDetail> tourDetails;

    public Customer(CustomerModel model) {
        this(
            model.getUserId() == null || model.getUserId() == -1 ? -1 : model.getUserId(),
            model.getFullname(),
            model.getAge(),
            model.getPhoneNumber(),
            new LoginDetail(-1, model.getUserId(), "", Permission.CUSTOMER),
            new HashSet<>(),
            new ArrayList<>()
        );
    }
}