package com.service;

import com.dao.ICanKaoFileDao;
import com.domain.CanKaoFile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class CanKaoFileServiceImpl implements ICanKaoFileService{

    @Autowired
    private ICanKaoFileDao canKaoFileDao ;

    @Override
    public void save(CanKaoFile canKaoFile) {
        canKaoFileDao.save(canKaoFile);
    }

    @Override
    public CanKaoFile findCanKaoFileById(String id) {
        CanKaoFile canKaoFile = canKaoFileDao.findKeChengFileById(id);
        return canKaoFile;
    }

    @Override
    public void deleteCanKaoFile(CanKaoFile canKaoFile) {
        canKaoFileDao.deleteCanKaoFile(canKaoFile);
    }

    @Override
    public List<CanKaoFile> findAllCanKaoFile() {
        List<CanKaoFile> list = canKaoFileDao.findAllCanKaoFile();
        return list;
    }


}
