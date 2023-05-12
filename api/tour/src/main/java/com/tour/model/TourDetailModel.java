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
    
    private TourDetailModel(TourDetail entity, int lazy) {
        this(
            entity.getTourDetailId(),
            lazy > 1 ? Optional.empty() : Optional.of(TourModel.fromEntity(entity.getTour(), lazy + 1)),
            lazy > 1 ? Optional.empty() : Optional.of(CustomerModel.fromEntity(entity.getTourUser(), lazy + 1)),
            entity.getVehicle(),
            entity.getUserType()
        );
    }

    public static TourDetailModel fromEntity(TourDetail entity) {
        return new TourDetailModel(entity, 0);
    }

    public static TourDetailModel fromEntity(TourDetail entity, int lazy) {
        return new TourDetailModel(entity, lazy);
    }
}
