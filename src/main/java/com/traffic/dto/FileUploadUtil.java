package com.traffic.dto;

import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.util.Streams;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.Date;

/**
 * 文件上传工具类，使用commons.fileupload工具类
 * Created by ZhanHeng on 2016/11/15.
 */
public class FileUploadUtil {
    public static String upload(HttpServletRequest request, HttpServletResponse response){
        InputStream stream = null;
        BufferedInputStream bis = null;
        BufferedOutputStream bos = null;
        String fullLocalPath = "";
        try{
            ServletFileUpload upload = new ServletFileUpload();
            FileItemIterator iter = upload.getItemIterator(request);
            while(iter.hasNext()){
                FileItemStream item = (FileItemStream)iter.next();
                stream = item.openStream();
                if(!item.isFormField()){
                    if(item.getName() != null && !item.getName().trim().equals("")){
                        String upLoadName = item.getName();
                        //上传在服务器上的文件路径,此处在使用过程中应该用日期和随机数组成文件名，以防止文件名一致被覆盖
                        Date date = new Date();
                        fullLocalPath = "d:/picTemp/" +date.getTime()+".jpg";
                        bis = new BufferedInputStream(stream);
                        bos = new BufferedOutputStream(new FileOutputStream(fullLocalPath));
                        Streams.copy(bis, bos, true);
                        return fullLocalPath;
                    }

                }
            }
        }catch(Exception e){
            e.printStackTrace();
            String errorMsg = "对不起，文件上传失败！" + e.toString();
            request.setAttribute("PicInfoUpload.error", errorMsg);
        }finally{
            if (stream != null){
                try{
                    stream.close();
                }catch(IOException e){
                    stream = null;
                }
            }
            if (bis != null){
                try{
                    bis.close();
                }catch(IOException e){
                    bis = null;
                }
            }
            if (bos != null){
                try{
                    bos.close();
                }catch(IOException e){
                    bos = null;
                }
            }
        }
        return fullLocalPath;
    }
}
