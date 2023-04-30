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
    
    private TourDetailModel(TourDetail entity, boolean lazy) {
        this(
            entity.getTourDetailId(),
            lazy ? Optional.empty() : Optional.of(TourModel.fromEntity(entity.getTour(), true)),
            lazy ? Optional.empty() : Optional.of(CustomerModel.fromEntity(entity.getTourUser(), true)),
            entity.getVehicle(),
            entity.getUserType()
        );
    }

    public static TourDetailModel fromEntity(TourDetail entity) {
        return new TourDetailModel(entity, false);
    }

    public static TourDetailModel fromEntity(TourDetail entity, boolean constructFromAnother) {
        return new TourDetailModel(entity, constructFromAnother);
    }
}
