package com.service;

import com.dao.IXiaoGuoDao;
import com.domain.XiaoGuoFile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class XiaoGuoServiceImpl implements IXiaoGuoService{

    @Autowired
    private IXiaoGuoDao xiaoGuoDao ;


    @Override
    public void save(XiaoGuoFile shouKeFile) {
        xiaoGuoDao.save(shouKeFile);
    }

    @Override
    public XiaoGuoFile findById(String id) {
        XiaoGuoFile shiJuanFile = xiaoGuoDao.findById(id);
        return shiJuanFile;
    }

    @Override
    public void delete(XiaoGuoFile shouKeFile) {
        xiaoGuoDao.delete(shouKeFile);
    }

    @Override
    public List<XiaoGuoFile> findAll() {
        List<XiaoGuoFile> list = xiaoGuoDao.findAll();
        return list;
    }

}
