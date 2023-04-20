package com.tour.model;

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
    
    public TourModel(Tour entity) {
        this(
            entity.getTourId(), 
            entity.getName(), 
            entity.getDescription(),
            entity.getPrice(),
            entity.getStartTime(),
            entity.getTourPath(), 
            entity.getMaxCustomerNumber(), 
            entity.getTourDetails().stream().map(e -> new TourDetailModel(e)).toList()
        );
    }
}
