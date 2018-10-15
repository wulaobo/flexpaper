package com.service;

import com.dao.IXiTiDao;
import com.domain.XiTiFile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class XiTiServiceImpl implements IXiTiService {

    @Autowired
    private IXiTiDao xiTiDao;

    @Override
    public void save(XiTiFile xiTiFile) {
        xiTiDao.save(xiTiFile);
    }

    @Override
    public XiTiFile findById(String id) {
        XiTiFile xiTiFile = xiTiDao.findById(id);
        return xiTiFile;
    }

    @Override
    public void delete(XiTiFile xiTiFile) {
       xiTiDao.delete(xiTiFile);
    }

    @Override
    public List<XiTiFile> findAll() {
        List<XiTiFile> list = xiTiDao.findAll();
        return list;
    }
}
