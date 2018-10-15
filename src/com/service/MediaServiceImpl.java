package com.service;

import com.dao.MediaDao;

public class MediaServiceImpl implements MediaService {

    private MediaDao mediaDao;

    public MediaDao getMediaDao() {
        return mediaDao;
    }

    public void setMediaDao(MediaDao mediaDao) {
        this.mediaDao = mediaDao;
    }

    public boolean executeCodecs(String srcFilePath, String codcFilePath,
                                 String mediaPicPath) {
        return mediaDao.executeCodecs(srcFilePath, codcFilePath, mediaPicPath);
    }

}
