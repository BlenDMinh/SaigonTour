package com.tour.service;

import java.util.Collection;
import java.util.Optional;

interface CrudService<TModel, TPrimary> {
    /*
     * Lay tat ca cac Entity co o trong Database va chuyen ve Model
     */
    Collection<TModel> getAll();

    /*
     * Lay Entity co id = id truyen vao o trong Database va chuyen ve Model
     */
    Optional<TModel> getById(TPrimary id);

    /*
     * Chuyen Model thanh Entity, neu Entity chua ton tai trong Database thi chen vao
     * Neu da ton tai thi cap nhat Entity
     */
    TModel save(TModel model);

    /*
     * Chuyen Model thanh Entity, neu Entity ton tai trong Database thi xoa Entity do
     */
    void delete(TModel model);

    /*
     * Xoa Entity co id = id truyen vao
     */
    void deleteById(TPrimary id);
}
