package com.tour.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.tour.model.TourModel;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Tour {
    @Id @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer tourId;
    private String name;
    private String description;
    private float price;

    @Temporal(TemporalType.DATE)
    private Date startTime;
    private List<String> tourPath;
    private Integer maxCustomerNumber;

    @OneToMany(mappedBy = "tour", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<TourDetail> tourDetails;

    // Ham khoi tao tu Model
    public Tour(TourModel model) {
        this(
            model.getTourId(),
            model.getName(),
            model.getDescription(),
            model.getPrice(),
            model.getStartTime(),
            model.getTourPath(),
            model.getMaxCustomerNumber(),
            model.getTourDetails() == null ? new ArrayList<>() : model.getTourDetails().stream().map((e) -> new TourDetail(e)).toList()
        );
    }

    // Cap nhat du lieu cua Entity
    public Tour merge(Tour newTour) {
        this.name = newTour.name;
        this.description = newTour.description;
        this.price = newTour.price;
        this.startTime = newTour.startTime;
        this.tourPath.clear();
        this.tourPath.addAll(newTour.tourPath);
        this.maxCustomerNumber = newTour.maxCustomerNumber;
        this.tourDetails.clear();
        this.tourDetails.addAll(newTour.tourDetails);
        return this;
    }
}
