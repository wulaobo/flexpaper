package com.service;

import com.domain.JiaoXueFile;

import java.util.List;

public interface IJiaoXueService {
    void save(JiaoXueFile jiaoXueFile);

    JiaoXueFile findById(String id);

    void delete(JiaoXueFile jiaoXueFile);

    List<JiaoXueFile> findAll();
}
