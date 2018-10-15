package com.service;

import com.dao.IJiaoXueDao;
import com.dao.IShiJuanDao;
import com.domain.JiaoXueFile;
import com.domain.ShiJuanFile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class ShiJuanServiceImpl implements IShiJuanService{

    @Autowired
    private IShiJuanDao shiJuanDao ;


    @Override
    public void save(ShiJuanFile shiJuanFile) {
        shiJuanDao.save(shiJuanFile);
    }

    @Override
    public ShiJuanFile findById(String id) {
        ShiJuanFile shiJuanFile = shiJuanDao.findById(id);
        return shiJuanFile;
    }


    @Override
    public void delete(ShiJuanFile shiJuanFile) {
        shiJuanDao.delete(shiJuanFile);
    }


    @Override
    public List<ShiJuanFile> findAll() {
        List<ShiJuanFile> list = shiJuanDao.findAll();
        return list;
    }

}
