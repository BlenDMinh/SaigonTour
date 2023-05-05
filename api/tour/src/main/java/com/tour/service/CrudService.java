package com.tour.service;

import java.util.Collection;
import java.util.Optional;

interface CrudService<TModel, TPrimary> {
    Collection<TModel> getAll();
    Optional<TModel> getById(TPrimary id);
    TModel save(TModel model);
    void delete(TModel model);
    void deleteById(TPrimary id);
}
