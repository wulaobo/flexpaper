package com.service;

import com.domain.CanKaoFile;
import com.domain.KeChengFile;

import java.util.List;

public interface ICanKaoFileService {
    void save(CanKaoFile canKaoFile);

    CanKaoFile findCanKaoFileById(String id);

    void deleteCanKaoFile(CanKaoFile canKaoFile);

    List<CanKaoFile> findAllCanKaoFile();
}
