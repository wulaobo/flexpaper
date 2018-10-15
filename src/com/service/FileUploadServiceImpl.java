package com.service;

import com.dao.FileUploadDao;
import com.domain.Video;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class FileUploadServiceImpl implements FileUploadService {
    @Autowired
    private FileUploadDao fld;

    public void upload(Video video) {
             fld.save(video);
    }

    @Override
    public List<Video> findAll() {
        List<Video> list = fld.findAll();
        return list;

    }

    @Override
    public Video findById(String id) {
        Video video = fld.findById(id);
        return video;
    }

    @Override
    public void delete(Video video) {
        fld.delete(video);
    }
}
