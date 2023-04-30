package com.tour.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.tour.entity.Tour;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class TourModel {
    private Integer tourId;
    private String name;
    private String description;
    private float price;
    private Date startTime;
    private List<String> tourPath;
    private Integer maxCustomerNumber;
    private List<TourDetailModel> tourDetails;
    
    private TourModel(Tour entity, boolean lazy) {
        this(
            entity.getTourId(), 
            entity.getName(), 
            entity.getDescription(),
            entity.getPrice(),
            entity.getStartTime(),
            entity.getTourPath(), 
            entity.getMaxCustomerNumber(), 
            lazy ? new ArrayList<>() :entity.getTourDetails().stream().map(e -> TourDetailModel.fromEntity(e, true)).toList()
        );
    }

    public static TourModel fromEntity(Tour entity) {
        return new TourModel(entity, false);
    }

    public static TourModel fromEntity(Tour entity, boolean constructFromTourDetail) {
        return new TourModel(entity, constructFromTourDetail);
    }
}
