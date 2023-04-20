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
            tourModels.add(new TourModel(tour));
        return tourModels;
    }

    @Override
    public Optional<TourModel> getById(Integer id) {
        Optional<Tour> entity = tourRepository.findById(id);
        if(entity.isEmpty())
            return Optional.empty();
        Tour tour = entity.get();
        TourModel tourModel = new TourModel(tour);
        return Optional.of(tourModel);
    }

    @Override
    public void save(TourModel model) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'save'");
    }

    @Override
    public void delete(TourModel model) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'delete'");
    }

    @Override
    public void deleteById(Integer id) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'deleteById'");
    }
}
