package com.traffic.action;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by ZhanHeng on 2016/11/15.
 */
@Controller
@Scope("session")                  //支持多例
@ParentPackage("all")              //表示继承的父包
@Namespace(value="/")             //表示当前Action所在命名空间
public class CkeditorUpload extends ActionSupport{
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    private static final List<String> IMAGE_TYPE= Arrays.asList("image/pjpeg", "image/jpeg",
            "image/png","image/x-png","image/gif","image/bmp");
    private File upload;
    private String uploadContentType;
    private String uploadFileName;
    private String CKEditorFuncNum;
    @Action("upload")
    public String execute() throws Exception {
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setCharacterEncoding("UTF-8");
        String CONTENT_TYPE = "text/html; charset=UTF-8";
        response.setContentType(CONTENT_TYPE);
        PrintWriter out = response.getWriter();

        // CKEditor提交的很重要的一个参数
        String callback = this.CKEditorFuncNum;   //后台传过来的参数 ，用get/setter方法接受了
        String expandedName = "";  //文件扩展名

        //System.out.println("@@@@@@@@@@"+uploadContentType);
        if (uploadContentType.equals("image/pjpeg") || uploadContentType.equals("image/jpeg")) {
            //IE6上传jpg图片的headimageContentType是image/pjpeg，而IE9以及火狐上传的jpg图片是image/jpeg
            expandedName = ".jpg";
        }else if(uploadContentType.equals("image/png") || uploadContentType.equals("image/x-png")){
            //IE6上传的png图片的headimageContentType是"image/x-png"
            expandedName = ".png";
        }else if(uploadContentType.equals("image/gif")){
            expandedName = ".gif";
        }else if(uploadContentType.equals("image/bmp")){
            expandedName = ".bmp";
        }else if(uploadContentType.equals("text/plain")){
            expandedName = ".txt";
        }else if(uploadContentType.equals("application/msword")){
            expandedName = ".doc";
        }else if(uploadContentType.equals("application/vnd.openxmlformats-officedocument.wordprocessingml.document")){
            expandedName = ".docx";
        }else if(uploadContentType.equals("application/pdf")){
            expandedName = ".pdf";
        }else if(uploadContentType.equals("application/zip")){
            expandedName = ".zip";
        }else if(uploadContentType.equals("application/vnd.ms-excel")){
            expandedName = ".xls";
        }else if(uploadContentType.equals("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet")){
            expandedName = ".xlsx";
        }else{
            out.println("<script type=\"text/javascript\">");
            out.println("window.parent.CKEDITOR.tools.callFunction(" + callback + ",''," + "'文件格式不支持 (必须为txt,doc,docx,pdf,zip,xls,xlsx或者图片文件');");
            out.println("</script>");
            return null;
        }

        if(upload.length() > 10*1024*1024){  // 10M  的大小限制
            out.println("<script type=\"text/javascript\">");
            out.println("window.parent.CKEDITOR.tools.callFunction(" + callback + ",''," + "'文件大小不得大于10M');");
            out.println("</script>");
            return null;
        }


        InputStream is = new FileInputStream(upload);
        String uploadPath = "";
        if(IMAGE_TYPE.contains(uploadContentType)){ //对上传的文件进行分类存放
            uploadPath = ServletActionContext.getServletContext().getRealPath("/uploadNewsFies/postImg");
        }else{
            uploadPath = ServletActionContext.getServletContext().getRealPath("/uploadNewsFies/postFile");
        }
        String date=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
        String fileName = date.replaceAll("-","")+getUUID();   //采用时间+UUID的方式随机命名
        fileName += expandedName;
        File file = new File(uploadPath);  //如果路径不存在则创建,很重要必须判断
        if(!file.exists()){
            file.mkdirs();
        }
        File toFile = new File(uploadPath, fileName);
        OutputStream os = new FileOutputStream(toFile); //开始写入文件到服务器
        byte[] buffer = new byte[1024];
        int length = 0;
        while ((length = is.read(buffer)) > 0) {
            os.write(buffer, 0, length);
        }
        is.close();
        os.close();
        // 返回“图像”选项卡并显示图片，这段很关键实现预览功能
        logger.info(callback);
        out.println("<script type=\"text/javascript\">");
        if(IMAGE_TYPE.contains(uploadContentType)){ //对上传的文件进行分类存放,注意这里的路径!!! 我把添加新闻的页面放到admin目录下了，所有要返回一级目录
            out.println("window.parent.CKEDITOR.tools.callFunction(" + callback + ",'" + "../uploadNewsFies/postImg/" + fileName + "','')");
        }else{
            out.println("window.parent.CKEDITOR.tools.callFunction(" + callback + ",'" + "../uploadNewsFies/postFile/" + fileName + "','')");
        }
        out.println("</script>");
        return null;
    }

    public static String getUUID(){
        String s = UUID.randomUUID().toString(); //Java自带的Util类生产UUID，然后去掉“-”
        return s.substring(0,8)+s.substring(9,13)+s.substring(14,18)+s.substring(19,23)+s.substring(24);
    }
    public File getUpload() {
        return upload;
    }

    public void setUpload(File upload) {

        this.upload = upload;
    }

    public String getUploadContentType() {
        return uploadContentType;
    }

    public void setUploadContentType(String uploadContentType) {
        this.uploadContentType = uploadContentType;
    }

    public String getUploadFileName() {
        return uploadFileName;
    }

    public void setUploadFileName(String uploadFileName) {
        this.uploadFileName = uploadFileName;
    }


    public String getCKEditorFuncNum() {
        return CKEditorFuncNum;
    }


    public void setCKEditorFuncNum(String cKEditorFuncNum) {
        CKEditorFuncNum = cKEditorFuncNum;
    }
}
