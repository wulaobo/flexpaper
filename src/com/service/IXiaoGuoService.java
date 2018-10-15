package com.service;

import com.domain.XiaoGuoFile;

import java.util.List;

public interface IXiaoGuoService {
    void save(XiaoGuoFile xiaoGuoFile);

    XiaoGuoFile findById(String id);

    void delete(XiaoGuoFile xiaoGuoFile);

    List<XiaoGuoFile> findAll();
}
