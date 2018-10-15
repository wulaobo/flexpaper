package com.service;

import com.dao.ICanKaoFileDao;
import com.dao.IJiaoXueDao;
import com.domain.CanKaoFile;
import com.domain.JiaoXueFile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class JiaoXueServiceImpl implements IJiaoXueService{

    @Autowired
    private IJiaoXueDao jiaoXueDao ;

    @Override
    public void save(JiaoXueFile jiaoXueFile) {
        jiaoXueDao.save(jiaoXueFile);
    }

    @Override
    public JiaoXueFile findById(String id) {
        JiaoXueFile jiaoXueFile = jiaoXueDao.findById(id);
        return jiaoXueFile;
    }

    @Override
    public void delete(JiaoXueFile jiaoXueFile) {
        jiaoXueDao.delete(jiaoXueFile);
    }

    @Override
    public List<JiaoXueFile> findAll() {
        List<JiaoXueFile> list = jiaoXueDao.findAll();
        return list;
    }

}
