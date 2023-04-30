package com.tour.entity;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

import com.tour.model.TourDetailModel;

import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class TourDetail {
    @Id @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer tourDetailId;
    @ManyToOne
    @Cascade(CascadeType.SAVE_UPDATE)
    @JoinColumn(name = "tour_id")
    private Tour tour;
    @ManyToOne
    @Cascade(CascadeType.SAVE_UPDATE)
    @JoinColumn(name = "user_id")
    private Customer tourUser;
    private String vehicle;

    @Enumerated(EnumType.ORDINAL)
    private UserType userType;

    public TourDetail(TourDetailModel model) {
        this(
            model.getTourDetailId(),
            model.getTour() != null ? new Tour(model.getTour().get()) : new Tour(),
            model.getTourUser() != null ? new Customer(model.getTourUser().get()) : new Customer(),
            model.getVehicle(),
            model.getUserType()
        );
    }
}
