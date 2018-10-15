package com.service;

import com.domain.XiTiFile;

import java.util.List;

public interface IXiTiService {
    void save(XiTiFile xiTiFile);

    XiTiFile findById(String id);

    void delete(XiTiFile xiTiFile);

    List<XiTiFile> findAll();
}
