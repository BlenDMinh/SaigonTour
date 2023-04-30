package com.tour.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import com.tour.entity.Customer;
import com.tour.entity.PaymentMethod;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class CustomerModel {
    private Integer userId;
    private String fullname;
    private Integer age;
    private String phoneNumber;
    private Set<PaymentMethod> paymentMethods;
    private List<TourDetailModel> tourDetails;

    private CustomerModel(Customer entity, boolean lazy) {
        this(entity.getUserId(), entity.getFullname(), entity.getAge(), entity.getPhoneNumber(), null, null);
        this.paymentMethods = entity.getPaymentMethods();
        if(lazy)
            this.tourDetails = new ArrayList<>();
        else
            if(entity.getTourDetails() != null)
                this.tourDetails = entity.getTourDetails().stream().map(e -> TourDetailModel.fromEntity(e, true)).toList();
    }

    public static CustomerModel fromEntity(Customer entity) {
        return new CustomerModel(entity, false);
    }

    public static CustomerModel fromEntity(Customer entity, boolean constructFromTourDetail) {
        return new CustomerModel(entity, constructFromTourDetail);
    }
}
