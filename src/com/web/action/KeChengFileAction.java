package com.web.action;

import com.domain.KeChengFile;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.service.IKeChengFileService;
import com.util.DocConverter;
import com.util.PinYin4jUtils;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import javax.servlet.ServletContext;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@Scope("prototype")
public class KeChengFileAction extends ActionSupport {

    //接收上传文件
    private File upload;
    //接收上传文件名称
    private String uploadFileName;
    //接收上传文件类型
    private String uploadContentType;
    private String title;
    private String author;

    public void setAuthor(String author) {
        this.author = author;
    }

    public void setTitle(String title) {

        this.title = title;
    }
    KeChengFile keChengFile = new KeChengFile();

    @Autowired
    private IKeChengFileService keChengFileService;

    public String upload() throws IOException {

        // 获得文件名:
        System.out.println("文件名:"+uploadFileName);
        //String hanziFileName1 = uploadFileName.substring(0,uploadFileName.lastIndexOf("."));
        //文件名去掉空格
        uploadFileName = StringUtils.deleteWhitespace(uploadFileName);
        // 获得文件类型:
        System.out.println("文件类型:"+uploadContentType);

        //把中文文件名转成拼音
        String hanziFileName = uploadFileName.substring(0,uploadFileName.lastIndexOf("."));
        String pinyinFileName = PinYin4jUtils.hanziToPinyin(hanziFileName,"");

        String extName1 = uploadFileName.substring(uploadFileName.lastIndexOf("."));
        uploadFileName = pinyinFileName+extName1;

        // 将上传的文件写到服务器端的upload这个文件夹中.
        // 获得upload文件夹的磁盘绝对路径:ServletContext对象中getRealPath();
        // 获得ServletContext对象.
        ServletContext application = ServletActionContext.getServletContext();
        // 获得磁盘绝对路径
        String path = application.getRealPath("/upload");
        // 定义一个文件类型的对象.
        File diskFile = new File(path+"/"+uploadFileName);
        // 在commons-io包下有一个工具类:
        FileUtils.copyFile(upload, diskFile);

        //获取上传文件的扩展名
        String extName = uploadFileName.substring(uploadFileName.lastIndexOf(".") + 1);
        //文件全路径
        String lastFileName = path + "\\" + uploadFileName;
        //获取需要转换的文件名,将路径名中的'\'替换为'/'
        String converfilename = path.replaceAll("\\\\", "/") + "/" + uploadFileName;
        System.out.println(converfilename);

        //调用转换类DocConverter,并将需要转换的文件传递给该类的构造方法
        DocConverter d = new DocConverter(converfilename);
        //调用conver方法开始转换，先执行doc2pdf()将office文件转换为pdf;再执行pdf2swf()将pdf转换为swf;
        boolean f =  d.conver();
        if(f==false){
            return "error";
        }
//        ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");
//        ServletActionContext.getResponse().getWriter().print(aa);
        //将文件的名称和保存的路径保存到数据库中
        String simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        keChengFile.setTitle(title);
        keChengFile.setAuthor(author);
        keChengFile.setDate(simpleDateFormat);
        keChengFile.setFilePath(converfilename);
        keChengFile.setUploadFileName(uploadFileName);
        keChengFileService.save(keChengFile);

        //调用getswfPath()方法，打印转换后的swf文件路径
        System.out.println(d.getswfPath());
        //生成swf相对路径，以便传递给flexpaper播放器
        String swfpath = "upload" + d.getswfPath().substring(d.getswfPath().lastIndexOf("/"));
        System.out.println(swfpath);
        //将相对路径放入sessio中保存
        ActionContext.getContext().getSession().put("swfpath",swfpath);

        return "success";

    }

    //属性驱动
    private String id;
    public void setId(String id) {
        this.id = id;
    }

    //删除文件
    public String deleteKeChengFileById(){
       //先查询,再删除
       KeChengFile keChengFile = keChengFileService.findKeChengFileById(id);

       if(keChengFile!=null){
           //删除上传目录的doc文件
           String filePathdoc = keChengFile.getFilePath();
           if(filePathdoc!=null && !filePathdoc.equals("")) {
              // DocConverter.deleteFile(filePathdoc);
               File deleteFile = new File(filePathdoc);
               deleteFile.delete();
           }
           //删除上传目录的swf文件
           String filePathswf = filePathdoc.substring(0,filePathdoc.lastIndexOf("."));
           filePathswf = filePathswf+".swf";
           if(filePathdoc!=null && !filePathswf.equals("")){
               //DocConverter.deleteFile(filePathswf);
               File deleteFile = new File(filePathswf);
               deleteFile.delete();
           }
           //删除数据库中的数据记录
           keChengFileService.deleteKeChengFile(keChengFile);
           return "del";
       }
       return "error";
    }

    //属性驱动
    private String path;
    public void setPath(String path) {
        this.path = path;
    }
    //文件浏览功能
    public String preview() throws Exception {

        String id = path.substring(path.lastIndexOf("=")+1);
        //根据id查询KeChengFile
        KeChengFile file = keChengFileService.findKeChengFileById(id);
        List<KeChengFile> list = new ArrayList<KeChengFile>();
        list.add(file);
        ActionContext.getContext().getSession().put("listPreview",list);

        String fileName=path.substring(0,path.lastIndexOf("."));
        String swfFile = fileName + ".swf";
        ActionContext.getContext().getSession().put("swfpath",swfFile);
        return "preview";
    }

    //从后台查询文件列表
    public String findAllHou () {
        List<KeChengFile> listhou = keChengFileService.findAllKeChengFile();
        ActionContext.getContext().getSession().put("listhou",listhou);
        return "listhou";
    }

    //查询文件列表
    public String findAllKeChengFile () {
        List<KeChengFile> list = keChengFileService.findAllKeChengFile();
            ActionContext.getContext().getSession().put("list",list);
          return "list";
    }

    public void setUploadContentType(String uploadContentType) {
        this.uploadContentType = uploadContentType;
    }

    public void setUploadFileName(String uploadFileName) {
        this.uploadFileName = uploadFileName;
    }

    public void setUpload(File upload) {
        this.upload = upload;
    }


}
