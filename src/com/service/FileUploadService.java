package com.service;

import com.domain.Video;

import java.util.List;

public interface FileUploadService {
    void upload(Video video);

    List<Video> findAll();
    Video findById(String id);

    void delete(Video video);
}
