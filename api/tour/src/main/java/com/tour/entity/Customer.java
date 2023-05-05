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

    // Ham khoi tao tu Model
    public Customer(CustomerModel model) {
        this(
            model.getUserId() == null || model.getUserId() == -1 ? -1 : model.getUserId(),
            model.getFullname(),
            model.getAge(),
            model.getPhoneNumber(),
            new LoginDetail(-1, model.getUserId(), "", Permission.CUSTOMER),
            model.getPaymentMethods(),
            model.getTourDetails() == null ? new ArrayList<>() : model.getTourDetails().stream().map((e) -> new TourDetail(e)).toList()
        );
    }

    // Cap nhat du lieu cua Entity
    public Customer merge(Customer new_customer) {
        this.fullname = new_customer.fullname;
        this.age = new_customer.age;
        this.phoneNumber = new_customer.phoneNumber;
        if(this.paymentMethods == null)
            this.paymentMethods = new HashSet<>();
        this.paymentMethods.clear();
        if(new_customer.getPaymentMethods() != null)
            this.paymentMethods.addAll(new_customer.getPaymentMethods());
        if(this.tourDetails == null) 
            this.tourDetails = new ArrayList<>();
        this.tourDetails.clear();
        if(new_customer.getTourDetails() != null)
        this.tourDetails.addAll(new_customer.getTourDetails());
        return this;
    }
}