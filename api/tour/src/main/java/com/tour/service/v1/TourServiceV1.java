package com.tour.service.v1;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.tour.entity.Tour;
import com.tour.model.TourModel;
import com.tour.repository.TourRepository;
import com.tour.service.TourService;

@Service
public class TourServiceV1 implements TourService {

    private final TourRepository tourRepository;

    public TourServiceV1(TourRepository tourRepository) {
        this.tourRepository = tourRepository;
    }

    @Override
    public Collection<TourModel> getAll() {
        Iterable<Tour> tours = tourRepository.findAll();
        ArrayList<TourModel> tourModels = new ArrayList<>();
        for(Tour tour : tours)
            tourModels.add(TourModel.fromEntity(tour));
        return tourModels;
    }

    @Override
    public Optional<TourModel> getById(Integer id) {
        Optional<Tour> entity = tourRepository.findById(id);
        if(entity.isEmpty())
            return Optional.empty();
        Tour tour = entity.get();
        TourModel tourModel = TourModel.fromEntity(tour);
        return Optional.of(tourModel);
    }

    @Override
    public TourModel save(TourModel model) {
        Optional<Tour> eTour = tourRepository.findById(model.getTourId());
        if(eTour.isEmpty()) {
            Tour nTour = new Tour();
            nTour = tourRepository.save(nTour);
            return TourModel.fromEntity(nTour);
        }
        Tour _eTour = eTour.get();
        Tour _nTour = new Tour(model);
        _eTour.merge(_nTour);
        tourRepository.save(_eTour);
        return TourModel.fromEntity(_eTour);
    }

    @Override
    public void delete(TourModel model) {
        deleteById(model.getTourId());
    }

    @Override
    public void deleteById(Integer id) {
        tourRepository.deleteById(id);
    }
}
