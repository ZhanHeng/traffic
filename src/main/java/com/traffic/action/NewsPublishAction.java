package com.traffic.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.traffic.dto.Execution;
import com.traffic.dto.LoginResult;
import com.traffic.dto.NewsUtil;
import com.traffic.dto.Page;
import com.traffic.enums.LoginEnum;
import com.traffic.model.NewsAndNotice;
import com.traffic.model.Tag;
import com.traffic.service.NewsAndNoticeService;
import com.traffic.service.PageService;
import com.traffic.service.TagService;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

/**
 * 新闻类发布Action
 * Created by ZhanHeng on 2016/11/12.
 */
@Scope("session")                  //支持多例
@ParentPackage("all")              //表示继承的父包
@Namespace(value="/")              //表示当前Action所在命名空间
public class NewsPublishAction extends ActionSupport {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    public final String UPLOAD_PATH = ServletActionContext.getServletContext().getRealPath("/uploadNewsFies/focusPic");
    @Autowired
    private NewsAndNoticeService newsAndNoticeService;
    @Autowired
    private PageService pageService;
    @Autowired
    private TagService tagService;
    private NewsAndNotice newsAndNotice;
    private File myfile;                    //上传的焦点新闻展示图片
    private String myfileFileName;          //图片名字
    private String myfileContentType;;      //图片文件类型
    private List<String> tagLevelList;      //记录文件的菜单路径
    private List<String> newsList;          //批量删除
    private NewsAndNotice searchNewsNotice;
    private NewsAndNotice editNewsNotice;
    private String newsContent;
    private Page page;
    private String newId;
    private String shownewId;
    private NewsAndNotice showNewsNotice;
    private List<Tag> aboveTagList;



    @Action(
            value="addNews",
            results={@Result(name="success",location="/admin/adminAddNews.jsp")},
            interceptorRefs={ @InterceptorRef("myStack")},
            exceptionMappings={ @ExceptionMapping(exception="java.lang.Exception",result="error")}
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
                this.newsAndNotice.setContent(newsContent.getBytes());
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
            this.newsAndNotice.setContent(newsContent.getBytes());
            this.newsAndNoticeService.save(this.newsAndNotice);
            Execution execution = new Execution(LoginEnum.INSERT_SUCCESS);
            ActionContext.getContext().put("loginResult",new LoginResult<Execution>(true,execution));
            //生成静态页，并更新首页
            //buildHTML(newsAndNotice);
            //refreshHomePage();
            return SUCCESS;
        }

    }

    @Action(
            value="searchNews",
            results={@Result(name="success",location="/admin/adminManageNews.jsp") },
            interceptorRefs={ @InterceptorRef("myStack")},
            exceptionMappings={ @ExceptionMapping(exception="java.lang.Exception",result="error")}
    )
    public String searchNews(){
         try {
             List<NewsAndNotice> list = null;
             String tagPath = getTagPath(tagLevelList);
            if(page==null){
                 page = new Page();
                 list = pageService.findNewsList(searchNewsNotice,page,tagPath);
             }else{
                 list = pageService.findNewsList(searchNewsNotice,page,tagPath);
             }
             ActionContext.getContext().put("list",getTagInfoList(list));
             ActionContext.getContext().put("tagPath",tagPath);
             return SUCCESS;
          }catch (Exception e){
             logger.error(e.getMessage(),e);
             return ERROR;
          }
    }
    private List<NewsUtil> getTagInfoList(List<NewsAndNotice> newsList){
        List<NewsUtil> list = new ArrayList<NewsUtil>();
        if (newsList!=null && !newsList.isEmpty()){
            for (NewsAndNotice news : newsList){
                NewsUtil util = new NewsUtil();
                util.setNews(news);
                util.setTagList(pathToTagList(news.getTagPath()));
                list.add(util);
            }
        }
        return list;
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
    //获取菜单路径的公共方法
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
    //将tag路径转化成tag列表
    private List<Tag> pathToTagList(String path){
        List<Tag> tagList = new ArrayList<Tag>();
        if(path!=null){
            if(path.contains("/")){
                String[] arr = path.split("/");
                for (int i = 0; i <arr.length ; i++) {
                    Tag tag = tagService.findById(Long.parseLong(arr[i]));
                    tagList.add(tag);
                }
            }else{
                Tag tag = tagService.findById(Long.parseLong(path));
                tagList.add(tag);
            }
        }
        return tagList;
    }
    @Action(value="beforeUpdate",results={@Result(name="success",location="/admin/adminEditNews.jsp")})
    public  String beforeUpdateNews(){
        this.setEditNewsNotice(newsAndNoticeService.findById(newId));
        ActionContext.getContext().put("editNewsNotice",editNewsNotice);
        return SUCCESS;
    }

    @Action(value="showNewsDetail",results={@Result(name="success",location="/user/showContent.jsp")},
            interceptorRefs={ @InterceptorRef("defaultStack")})
    public  String showNewsDetail(){
        this.setShowNewsNotice(newsAndNoticeService.findById(shownewId));
        ActionContext.getContext().put("showDetailInfo",showNewsNotice);
        aboveTagList = tagService.frontFindByPosition(1);
        ActionContext.getContext().put("aboveTagList",aboveTagList);
        return SUCCESS;
    }

    @Action(value="showOneNews",results={@Result(name="success",location="/user/showOneNews.jsp")},
            interceptorRefs={ @InterceptorRef("defaultStack")})
    public  String showOneNews(){
        shownewId=(String) ActionContext.getContext().get("chainnewId");
        if(shownewId!=null) {
            this.setShowNewsNotice(newsAndNoticeService.findById(shownewId));
            ActionContext.getContext().put("showOneInfo",showNewsNotice);
            aboveTagList = tagService.frontFindByPosition(1);
            ActionContext.getContext().put("aboveTagList",aboveTagList);
        }else{
            aboveTagList = tagService.frontFindByPosition(1);
            ActionContext.getContext().put("aboveTagList",aboveTagList);
            ActionContext.getContext().put("showOneInfo",null);
        }

        return SUCCESS;
    }

    @Action(value="updateNews",results={@Result(name="success",location="/admin/adminManageNews.jsp")})
    public  String updateNews() throws IOException{
        if("".equals(this.editNewsNotice.getPath())){
            if("YES".equals(this.editNewsNotice.getFocusFlag())){
                int sum=this.newsAndNoticeService.getCountNumber();
                if(sum<7){
                    uploadFile(getMyfile(),UPLOAD_PATH);
                    File toFile = new File(UPLOAD_PATH + "\\" + getMyfileFileName());
                    this.editNewsNotice.setPath(getPicRelativePath(toFile));
                    this.editNewsNotice.setTagPath(getTagPath(tagLevelList));
                    this.editNewsNotice.setContent(newsContent.getBytes());
                    this.newsAndNoticeService.update(editNewsNotice);
                    Execution execution = new Execution(LoginEnum.UPDATE_SUCCESS);
                    ActionContext.getContext().put("loginResult",new LoginResult<Execution>(true,execution));
                    this.setTagLevelList(null);
                    searchNews();
                    //生成静态页，并更新首页
                    //buildHTML(updateNewsAndNotice);
                    //refreshHomePage();
                    return SUCCESS;
                }else{
                    Execution execution = new Execution(LoginEnum.TOP_NUMBER);
                    ActionContext.getContext().put("loginResult",new LoginResult<Execution>(false,execution));
                    return SUCCESS;
                }
            }else{
                this.editNewsNotice.setPath("");
                this.editNewsNotice.setTagPath(getTagPath(tagLevelList));
                this.editNewsNotice.setContent(newsContent.getBytes());
                this.newsAndNoticeService.update(this.editNewsNotice);
                this.setTagLevelList(null);
                searchNews();
                Execution execution = new Execution(LoginEnum.UPDATE_SUCCESS);
                ActionContext.getContext().put("loginResult",new LoginResult<Execution>(true,execution));
                //生成静态页，并更新首页
                //buildHTML(updateNewsAndNotice);
                //refreshHomePage();
                return SUCCESS;
            }
        }else{
            String tpath=ServletActionContext.getServletContext().getRealPath("/")+this.editNewsNotice.getPath();
            File tempFlie=new File(tpath);
            if(tempFlie.exists()){
                tempFlie.delete();
            }
            if("YES".equals(this.editNewsNotice.getFocusFlag())){
                int sum=this.newsAndNoticeService.getCountNumber();
                if(sum<7){
                    uploadFile(getMyfile(),UPLOAD_PATH);
                    File toFile = new File(UPLOAD_PATH + "\\" + getMyfileFileName());
                    this.editNewsNotice.setPath(getPicRelativePath(toFile));
                    this.editNewsNotice.setTagPath(getTagPath(tagLevelList));
                    this.editNewsNotice.setContent(newsContent.getBytes());
                    this.setTagLevelList(null);
                    this.newsAndNoticeService.update(this.editNewsNotice);
                    searchNews();
                    Execution execution = new Execution(LoginEnum.UPDATE_SUCCESS);
                    ActionContext.getContext().put("loginResult",new LoginResult<Execution>(true,execution));
                    //生成静态页，并更新首页
                    //buildHTML(updateNewsAndNotice);
                    //refreshHomePage();
                    return SUCCESS;
                }else{
                    Execution execution = new Execution(LoginEnum.TOP_NUMBER);
                    ActionContext.getContext().put("loginResult",new LoginResult<Execution>(false,execution));
                    return SUCCESS;
                }
            }else{
                this.editNewsNotice.setPath("");
                this.editNewsNotice.setTagPath(getTagPath(tagLevelList));
                this.editNewsNotice.setContent(newsContent.getBytes());
                this.newsAndNoticeService.update(this.editNewsNotice);
                ActionContext.getContext().put("updateSuccess", "YES");
                this.setTagLevelList(null);
                searchNews();
                Execution execution = new Execution(LoginEnum.UPDATE_SUCCESS);
                ActionContext.getContext().put("loginResult",new LoginResult<Execution>(true,execution));
                //生成静态页，并更新首页
                //buildHTML(updateNewsAndNotice);
                //refreshHomePage();
                return SUCCESS;
            }
        }
    }
    @Action(value="deleteNews",results={@Result(name="success",location="/admin/adminManageNews.jsp")})
    public  String deleteNews(){
        NewsAndNotice newsAndNoticeTemp = this.newsAndNoticeService.findById(newId);
        //删除对应的静态页，并更新首页
        String staticPath=ServletActionContext.getServletContext().getRealPath("/")+newsAndNoticeTemp.getHtmlPath();
        File staticFlie=new File(staticPath);
        if(staticFlie.exists()){
            staticFlie.delete();
        }
        //如果是焦点图，删除焦点图片
        if("YES".equals(newsAndNoticeTemp.getFocusFlag())){
            String tpath=ServletActionContext.getServletContext().getRealPath("/")+newsAndNoticeTemp.getPath();
            File tempFlie=new File(tpath);
            if(tempFlie.exists()){
                tempFlie.delete();
            }
        }
        this.newsAndNoticeService.delete(newsAndNoticeTemp);
        Execution execution = new Execution(LoginEnum.DELETE_SUCCESS);
        ActionContext.getContext().put("loginResult",new LoginResult<Execution>(true,execution));
        searchNews();
        //refreshHomePage();//更新首页
        return SUCCESS;
    }
    @Action(value="bacthDelete",results={@Result(name="success",location="/admin/adminManageNews.jsp")})
    public String  bacthDelete(){
        for (int i = 0; i < newsList.size(); i++) {
            String tempId = newsList.get(i);
            NewsAndNotice newsAndNoticeTemp = this.newsAndNoticeService.findById(tempId);
            //删除对应的静态页，并更新首页
            String staticPath=ServletActionContext.getServletContext().getRealPath("/")+newsAndNoticeTemp.getHtmlPath();
            File staticFlie=new File(staticPath);
            if(staticFlie.exists()){
                staticFlie.delete();
            }
            if ("YES".equals(newsAndNoticeTemp.getFocusFlag())) {
                String tpath = ServletActionContext.getServletContext().getRealPath("/") + newsAndNoticeTemp.getPath();
                File tempFlie = new File(tpath);
                if (tempFlie.exists()) {
                    tempFlie.delete();
                }
                this.newsAndNoticeService.delete(newsAndNoticeTemp);
            } else {
                this.newsAndNoticeService.delete(newsAndNoticeTemp);
            }
        }
        //refreshHomePage();
        Execution execution = new Execution(LoginEnum.DELETE_SUCCESS);
        ActionContext.getContext().put("loginResult",new LoginResult<Execution>(true,execution));
        searchNews();
        return SUCCESS;
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

    public NewsAndNotice getSearchNewsNotice() {
        return searchNewsNotice;
    }

    public void setSearchNewsNotice(NewsAndNotice searchNewsNotice) {
        this.searchNewsNotice = searchNewsNotice;
    }

    public NewsAndNotice getEditNewsNotice() {
        return editNewsNotice;
    }

    public void setEditNewsNotice(NewsAndNotice editNewsNotice) {
        this.editNewsNotice = editNewsNotice;
    }

    public Page getPage() {
        return page;
    }

    public void setPage(Page page) {
        this.page = page;
    }

    public String getNewId() {
        return newId;
    }

    public void setNewId(String newId) {
        this.newId = newId;
    }

    public List<String> getNewsList() {
        return newsList;
    }

    public void setNewsList(List<String> newsList) {
        this.newsList = newsList;
    }

    public String getNewsContent() {
        return newsContent;
    }

    public void setNewsContent(String newsContent) {
        this.newsContent = newsContent;
    }
    public String getShownewId() {
        return shownewId;
    }

    public void setShownewId(String shownewId) {
        this.shownewId = shownewId;
    }

    public NewsAndNotice getShowNewsNotice() {
        return showNewsNotice;
    }

    public void setShowNewsNotice(NewsAndNotice showNewsNotice) {
        this.showNewsNotice = showNewsNotice;
    }

    public List<Tag> getAboveTagList() {
        return aboveTagList;
    }

    public void setAboveTagList(List<Tag> aboveTagList) {
        this.aboveTagList = aboveTagList;
    }
}
