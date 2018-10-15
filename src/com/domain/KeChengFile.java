package com.domain;

import java.io.Serializable;

public class KeChengFile implements Serializable {
    private String id;
    private String title; //上传文件的标题
    private String author; //上传文件的作者

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    private String uploadFileName;
    private String filePath;
    private String date;

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public String getUploadFileName() {

        return uploadFileName;
    }

    public void setUploadFileName(String uploadFileName) {
        this.uploadFileName = uploadFileName;
    }



    public String getId() {

        return id;
    }

    public void setId(String id) {
        this.id = id;
    }



}
