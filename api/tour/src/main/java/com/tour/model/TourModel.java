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
    
    private TourModel(Tour entity, int lazy) {
        this(
            entity.getTourId(), 
            entity.getName(), 
            entity.getDescription(),
            entity.getPrice(),
            entity.getStartTime(),
            entity.getTourPath(), 
            entity.getMaxCustomerNumber(), 
            lazy > 1 ? new ArrayList<>() : entity.getTourDetails() == null ? new ArrayList<>() : entity.getTourDetails().stream().map(e -> TourDetailModel.fromEntity(e, lazy + 1)).toList()
        );
    }

    public static TourModel fromEntity(Tour entity) {
        return new TourModel(entity, 0);
    }

    public static TourModel fromEntity(Tour entity, int lazy) {
        return new TourModel(entity, 2);
    }
}
