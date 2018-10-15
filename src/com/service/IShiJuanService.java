package com.service;

import com.domain.ShiJuanFile;

import java.util.List;

public interface IShiJuanService {
    void save(ShiJuanFile shiJuanFile);

    ShiJuanFile findById(String id);

    void delete(ShiJuanFile shiJuanFile);

    List<ShiJuanFile> findAll();
}
