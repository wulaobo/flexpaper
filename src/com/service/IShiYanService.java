package com.service;

import com.domain.ShiYanFile;

import java.util.List;

public interface IShiYanService {
    void save(ShiYanFile shiYanFile);

    ShiYanFile findById(String id);

    void delete(ShiYanFile shiYanFile);

    List<ShiYanFile> findAll();
}
