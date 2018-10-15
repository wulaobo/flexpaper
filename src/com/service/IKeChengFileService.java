package com.service;

import com.domain.KeChengFile;

import java.util.List;

public interface IKeChengFileService {
    void save(KeChengFile keChengFile);

    List<KeChengFile> findAllKeChengFile();

    KeChengFile findKeChengFileById(String id);

    void deleteKeChengFile(KeChengFile keChengFile);
}
