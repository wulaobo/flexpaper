package com.service;

import com.dao.IShiJuanDao;
import com.dao.IShouKeDao;
import com.domain.ShiJuanFile;
import com.domain.ShouKeFile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class ShouKeServiceImpl implements IShouKeService{

    @Autowired
    private IShouKeDao shouKeDao ;


    @Override
    public void save(ShouKeFile shouKeFile) {
        shouKeDao.save(shouKeFile);
    }

    @Override
    public ShouKeFile findById(String id) {
        ShouKeFile shiJuanFile = shouKeDao.findById(id);
        return shiJuanFile;
    }

    @Override
    public void delete(ShouKeFile shouKeFile) {
      shouKeDao.delete(shouKeFile);
    }

    @Override
    public List<ShouKeFile> findAll() {
        List<ShouKeFile> list = shouKeDao.findAll();
        return list;
    }

}
