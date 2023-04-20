package com.tour.model;

import java.util.Optional;

import com.tour.entity.TourDetail;
import com.tour.entity.UserType;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class TourDetailModel {
    private Integer tourDetailId;
    private Optional<TourModel> tour;
    private Optional<CustomerModel> tourUser;
    private String vehicle;
    private UserType userType;
    
    public TourDetailModel(TourDetail entity) {
        this(
            entity.getTourDetailId(),
            Optional.of(new TourModel(entity.getTour())),
            Optional.of(new CustomerModel(entity.getTourUser())),
            entity.getVehicle(),
            entity.getUserType()
        );
    }

    public TourDetailModel(TourDetail entity, Boolean constructFromAnother) {
        this(
            entity.getTourDetailId(),
            constructFromAnother ? Optional.empty() : Optional.of(new TourModel(entity.getTour())),
            constructFromAnother ? Optional.empty() : Optional.of(new CustomerModel(entity.getTourUser())),
            entity.getVehicle(),
            entity.getUserType()
        );
    }
}
