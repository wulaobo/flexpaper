package com.dao;

import com.domain.KeChengFile;

import java.util.List;

public interface IKeChengFileDao {
    void save(KeChengFile keChengFile);

    List<KeChengFile> findAllKeChengFile();

    KeChengFile findKeChengFileById(String id);

    void deleteKeChengFile(KeChengFile keChengFile);
}
