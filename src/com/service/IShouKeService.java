package com.service;

import com.domain.ShouKeFile;

import java.util.List;

public interface IShouKeService {
    void save(ShouKeFile shouKeFile);

    ShouKeFile findById(String id);

    void delete(ShouKeFile shouKeFile);

    List<ShouKeFile> findAll();
}
