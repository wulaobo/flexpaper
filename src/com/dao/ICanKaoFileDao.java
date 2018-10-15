package com.dao;

import com.domain.CanKaoFile;


import java.util.List;

public interface ICanKaoFileDao {
    void save(CanKaoFile canKaoFile);


    List<CanKaoFile> findAllCanKaoFile();

    void deleteCanKaoFile(CanKaoFile canKaoFile);

    CanKaoFile findKeChengFileById(String id);
}
