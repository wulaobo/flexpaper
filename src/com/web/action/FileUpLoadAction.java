package com.web.action;

import com.dao.MediaDao;
import com.dao.MediaDaoImpl;
import com.domain.Video;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.service.FileUploadService;
import com.service.MediaServiceImpl;
import com.util.PinYin4jUtils;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.servlet.ServletContext;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Administrator
 * 文件上传
 * 具体步骤：
 * 1）获得磁盘文件条目工厂 DiskFileItemFactory 要导包
 * 2） 利用 request 获取 真实路径 ，供临时文件存储，和 最终文件存储 ，这两个存储位置可不同，也可相同
 * 3）对 DiskFileItemFactory 对象设置一些 属性
 * 4）上层API文件上传处理  ServletFileUpload upload = new ServletFileUpload(factory);
 * 目的是调用 parseRequest（request）方法  获得 FileItem 集合list ，
 *
 * 5）在 FileItem 对象中 获取信息，   遍历， 判断 表单提交过来的信息 是否是 普通文本信息  另做处理WOCA
 * 6）
 *    第一种. 用第三方 提供的  item.write( new File(path,filename) ); 直接写到磁盘上
 *    第二种. 手动处理
 *
 */
@Controller
@Scope("prototype")
//上传视频
public class FileUpLoadAction extends ActionSupport {

    //接收上传文件
    private File upload;

    public void setUpload(File upload) {
        this.upload = upload;
    }

    public void setUploadFileName(String uploadFileName) {
        this.uploadFileName = uploadFileName;
    }

    public void setUploadContentType(String uploadContentType) {
        this.uploadContentType = uploadContentType;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    //接收上传文件名称
    private String uploadFileName;
    //接收上传文件类型
    private String uploadContentType;
    private String title;
    private String author;

    private Video video=new Video();
    private static final long serialVersionUID = 1L;

    @Autowired
    private FileUploadService fls;


    public String upload() throws Exception {
        System.out.println("文件名:"+uploadFileName);
        //文件名去掉空格
        uploadFileName = StringUtils.deleteWhitespace(uploadFileName);
        // 获得文件类型:
        System.out.println("文件类型:"+uploadContentType);
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
        String Filename=uploadFileName.substring(0,uploadFileName.lastIndexOf("."));

//        下面为将视频转换成flv的格式
            String srcFilePath =path.replaceAll("\\\\", "/") + "/"+ uploadFileName;
            String codcFilePath = path.replaceAll("\\\\", "/") + "/" + pinyinFileName + ".flv";
            String mediaPicPath = path.replaceAll("\\\\", "/") + "/" + pinyinFileName + ".jpg";
            MediaDao mediaDao = new MediaDaoImpl();
            MediaServiceImpl mediaService = new MediaServiceImpl();
            mediaService.setMediaDao(mediaDao);
            boolean f = mediaService.executeCodecs(srcFilePath, codcFilePath, mediaPicPath);
            if(f==false){
                return "error";
            }

        //将文件的名称和保存的路径保存到数据库中
        String simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        video.setAuthor(author);
        video.setDate(simpleDateFormat);
            video.setFilePath(codcFilePath);
        video.setTitle(title);
        fls.upload(video);


        return "upload";
    }

    public String findAll() throws Exception {
        List<Video> list =fls.findAll();
        ActionContext.getContext().getSession().put("list",list);
             return "list";
    }
    private String filePath;

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public String preview() throws Exception {
//        C:/Users/daidai/IdeaProjects/school/out/artifacts/FlexPaper_war_exploded/upload/18.10_jihekuangjia(HashMapjihejianshiStringzhishiStudentdeanli).flv
        String s1 = filePath.substring(filePath.lastIndexOf("/")+1);
        String s2 = s1.substring(0, s1.lastIndexOf("."));
        ActionContext.getContext().put("path",s2);
        return "preview";

    }

    public String findAllHou() throws Exception {
        List<Video> listhou = fls.findAll();
        ActionContext.getContext().getSession().put("listhou",listhou);
        return "listhou";
    }
    private String id;

    public void setId(String id) {
        this.id = id;
    }

    public String deleteById() throws Exception {
        Video video = fls.findById(id);
        if(video!=null){
            //删除上传视频的flv文件
            String filePathdoc = video.getFilePath();
            if(filePathdoc!=null && !filePathdoc.equals("")) {
                File deleteFile = new File(filePathdoc);
                deleteFile.delete();
            }
            //删除上传目录的jpg文件
            String filePathjpg = filePathdoc.substring(0,filePathdoc.lastIndexOf("."));
            filePathjpg = filePathjpg+".jpg";
            if(filePathjpg!=null && !filePathjpg.equals("")){
                //DocConverter.deleteFile(filePathswf);
                File deleteFile = new File(filePathjpg);
                deleteFile.delete();
            }
            //删除上传视频的avi文件
            String filePathavi = filePathdoc.substring(0,filePathdoc.lastIndexOf("."));
            filePathavi = filePathavi+".avi";
            if(filePathavi!=null && !filePathavi.equals("")){
                //DocConverter.deleteFile(filePathswf);
                File deleteFile = new File(filePathavi);
                deleteFile.delete();
            }
            //删除上传视频的mp4文件
            String filePathmp4 = filePathdoc.substring(0,filePathdoc.lastIndexOf("."));
            filePathmp4 = filePathmp4+".mp4";
            if(filePathmp4!=null && !filePathmp4.equals("")){
                //DocConverter.deleteFile(filePathswf);
                File deleteFile = new File(filePathmp4);
                deleteFile.delete();
            }
            //删除数据库中的数据记录
            fls.delete(video);
            return "del";
        }
        return "error";
    }
}


