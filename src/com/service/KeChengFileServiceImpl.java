package com.service;

import com.dao.IKeChengFileDao;
import com.domain.KeChengFile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class KeChengFileServiceImpl implements IKeChengFileService{

    @Autowired
    private IKeChengFileDao keChengFileDao;

    @Override
    public void save(KeChengFile keChengFile) {
        keChengFileDao.save(keChengFile);
    }

    @Override
    public List<KeChengFile> findAllKeChengFile() {
        List<KeChengFile> list = keChengFileDao.findAllKeChengFile();
        return list;
    }

    @Override
    public KeChengFile findKeChengFileById(String id) {
        KeChengFile keChengFile = keChengFileDao.findKeChengFileById(id);
        return keChengFile;
    }

    @Override
    public void deleteKeChengFile(KeChengFile keChengFile) {
        keChengFileDao.deleteKeChengFile(keChengFile);
    }
}
