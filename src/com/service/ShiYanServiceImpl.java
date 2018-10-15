package com.service;

import com.dao.IShiYanDao;
import com.domain.ShiYanFile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class ShiYanServiceImpl implements IShiYanService {

    @Autowired
    private IShiYanDao shiYanDao;

    @Override
    public void save(ShiYanFile shiYanFile) {
        shiYanDao.save(shiYanFile);
    }

    @Override
    public ShiYanFile findById(String id) {
        ShiYanFile shiYanFile = shiYanDao.findById(id);
        return shiYanFile;
    }

    @Override
    public void delete(ShiYanFile shiYanFile) {
        shiYanDao.delete(shiYanFile);
    }

    @Override
    public List<ShiYanFile> findAll() {
        List<ShiYanFile> list = shiYanDao.findAll();
        return list;
    }
}
