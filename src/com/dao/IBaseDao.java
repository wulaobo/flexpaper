package com.dao;

import java.io.Serializable;
import java.util.List;

public interface IBaseDao<T> {

    void save(T entity);
    void delete(T entity);
    T findById(Serializable id);
    List<T> findAll();

}
