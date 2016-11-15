package com.traffic.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.traffic.dto.Execution;
import com.traffic.dto.FileUploadUtil;
import com.traffic.dto.LoginResult;
import com.traffic.enums.LoginEnum;
import com.traffic.model.NewsAndNotice;
import com.traffic.service.NewsAndNoticeService;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

/**
 * 新闻类发布后的结果Action
 * Created by ZhanHeng on 2016/11/12.
 */
@Controller
@Scope("session")                  //支持多例
@ParentPackage("all")              //表示继承的父包
@Namespace(value="/")             //表示当前Action所在命名空间
public class NewsPublishAction extends ActionSupport{
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    public final String UPLOAD_PATH = ServletActionContext.getServletContext().getRealPath("/uploadNewsFies/focusPic");
    @Autowired
    private NewsAndNoticeService newsAndNoticeService;
    private NewsAndNotice newsAndNotice;
    private File myfile;                    //上传的焦点新闻展示图片
    private String myfileFileName;          //图片名字
    private String myfileContentType;;      //图片文件类型
    private List<String> tagLevelList;      //记录文件的标签路径
    @Action(
            value="addNews",
            results={
                    @Result(name="success",location="/addNews.jsp")
            },
            interceptorRefs={
                    @InterceptorRef("myStack")
            },
            exceptionMappings={
                    @ExceptionMapping(exception="java.lang.Exception",result="error")
            }
    )
    public String saveNewsAndNotice() throws IOException {

        if("YES".equals(this.newsAndNotice.getFocusFlag())){
            int sum=this.newsAndNoticeService.getCountNumber();
            if(sum<7){
                uploadFile(getMyfile(),UPLOAD_PATH);
                File toFile = new File(UPLOAD_PATH + "\\" + getMyfileFileName());
                this.newsAndNotice.setOrderTime(formatNowTime());
                this.newsAndNotice.setPath(getPicRelativePath(toFile));
                this.newsAndNotice.setTagPath(getTagPath(tagLevelList));
                this.newsAndNoticeService.save(this.newsAndNotice);
                Execution execution = new Execution(LoginEnum.INSERT_SUCCESS);
                ActionContext.getContext().put("loginResult",new LoginResult<Execution>(true,execution));
                //生成静态页，并更新首页
                //buildHTML(newsAndNotice);
                //refreshHomePage();
                return SUCCESS;
            }else{
                Execution execution = new Execution(LoginEnum.INNER_ERROR);
                ActionContext.getContext().put("loginResult",new LoginResult<Execution>(true,execution));
                return SUCCESS;
            }
        }else{
            this.newsAndNotice.setPath("");
            this.newsAndNotice.setOrderTime(formatNowTime());
            this.newsAndNotice.setTagPath(getTagPath(tagLevelList));
            this.newsAndNoticeService.save(this.newsAndNotice);
            Execution execution = new Execution(LoginEnum.INSERT_SUCCESS);
            ActionContext.getContext().put("loginResult",new LoginResult<Execution>(true,execution));
            //生成静态页，并更新首页
            //buildHTML(newsAndNotice);
            //refreshHomePage();
            return SUCCESS;
        }

    }

    //上传文件的公共方法
    private void uploadFile(File file ,String uploadPath){
        InputStream is = null;
        OutputStream os = null ;
        try {
            is = new FileInputStream(file);
            File toFile = new File(uploadPath + "\\" + getMyfileFileName());
            if (!toFile.getParentFile().exists())
                toFile.getParentFile().mkdirs();
            os = new FileOutputStream(toFile);
            byte buffer[] = new byte[1024];
            int count = 0;
            try {
                while ((count = is.read(buffer)) > 0) {
                    os.write(buffer, 0, count);
                }
                os.flush();
                os.close();
                is.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
    }
    //格式化当前系统时间的公共方法
    private String formatNowTime(){
        SimpleDateFormat formatter =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String nowTime =formatter.format(Calendar.getInstance().getTime());
        return nowTime;
    }
    //获取图片的相对路径公共方法
    private String getPicRelativePath(File file){
        String path = file.getPath().substring(file.getPath().indexOf("uploadNewsFies\\"));
        return path;
    }
    //获取标签路径的公共方法
    private String getTagPath(List<String> tagLevelList){
        String path = "";
        if(tagLevelList!=null){
            StringBuffer buffer = new StringBuffer("");
            for (int i = 0; i < tagLevelList.size(); i++) {
                int tagId = Integer.parseInt(tagLevelList.get(i));
                if(tagId!=-1){
                    if(i==0){
                        buffer.append(tagLevelList.get(i));
                    }else{
                        buffer.append("/"+tagLevelList.get(i));
                    }
                }else{
                    break;
                }
            }
            path = buffer.toString();
            System.out.println("path = " + path);
        }
        return path;
    }
    public NewsAndNotice getNewsAndNotice() {
        return newsAndNotice;
    }

    public void setNewsAndNotice(NewsAndNotice newsAndNotice) {
        this.newsAndNotice = newsAndNotice;
    }

    public File getMyfile() {
        return myfile;
    }

    public void setMyfile(File myfile) {
        this.myfile = myfile;
    }

    public String getMyfileFileName() {
        return myfileFileName;
    }

    public void setMyfileFileName(String myfileFileName) {
        this.myfileFileName = myfileFileName;
    }

    public String getMyfileContentType() {
        return myfileContentType;
    }

    public void setMyfileContentType(String myfileContentType) {
        this.myfileContentType = myfileContentType;
    }

    public List<String> getTagLevelList() {
        return tagLevelList;
    }

    public void setTagLevelList(List<String> tagLevelList) {
        this.tagLevelList = tagLevelList;
    }
}
