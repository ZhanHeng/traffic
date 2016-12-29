package com.traffic.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.traffic.dto.Page;
import com.traffic.model.NewsAndNotice;
import com.traffic.model.Tag;
import com.traffic.service.NewsAndNoticeService;
import com.traffic.service.PageService;
import com.traffic.service.TagService;
import freemarker.template.Configuration;
import freemarker.template.Template;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import com.alibaba.fastjson.JSONArray;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.traffic.dto.Execution;
import com.traffic.dto.LoginResult;
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
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by ZhanHeng on 2016/11/28.
 */
@Controller
@Namespace(value="/")             //表示当前Action所在命名空间

@Scope("session")                  //支持多例
@ParentPackage("all")              //表示继承的父包

public class NewsForUserAction extends ActionSupport {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
    @Autowired
    private TagService tagService;
    @Autowired
    private NewsAndNoticeService newsAndNoticeService;
    private Tag tag;
    private String tid;
    @Autowired
    private PageService pageService;
    private Page page;
    private String chainnewId;
    private List<Tag> aboveTagList;
    private List<Tag> leftTagList;
    private List<Tag> rightTagList;
    private String searchword;
    private List<NewsAndNotice> searchList;


    @Action(
            value="getTagNews",
            results={
                    @Result(name="success",location="/user/showNewsList.jsp"),
                    @Result(name="toone",type = "chain" ,location="showOneNews")
            },
            interceptorRefs={
                    @InterceptorRef("defaultStack")
            }
    )
    public String getTagNew(){
        Tag tagtemp = tagService.findById(Long.parseLong(tid));
        List<NewsAndNotice> list = null;//当前页新闻列表
        List<NewsAndNotice> firstList = null;//第一页新闻列表
        List<Tag> aboveList =null;
        List<Tag> leftList =null;
        Tag labelTag1  = null;
        Tag labelTag2  = null;
        String tagPath = tid;
        ActionContext.getContext().put("tagId",tid);

        if(tagtemp.getParentTag() !=null){
            tagPath = tagtemp.getParentTag().getTagId()+"/" +tagPath;
            if(tagtemp.getParentTag().getParentTag() !=null){
                tagPath = tagtemp.getParentTag().getParentTag().getTagId()+"/" +tagPath;
            }
        }

        int level = tagtemp.getTagLevel() ;
        switch (level){
            case 1:
                leftList = tagService.findChildTagByparentIdAndLevelForShowMenu(2,tagtemp.getTagId());
                if(leftList!=null && leftList.size()>0) {
                    aboveList = tagService.findChildTagByparentIdAndLevelForShowMenu(3,leftList.get(0).getTagId());
                }
                break;
            case 2:
                leftList = tagService.findChildTagByparentIdAndLevelForShowMenu(2,tagtemp.getParentTag().getTagId());
                if(leftList!=null && leftList.size()>0) {
                    aboveList = tagService.findChildTagByparentIdAndLevelForShowMenu(3,tagtemp.getTagId());
                }
                break;
            case 3:
                leftList = tagService.findChildTagByparentIdAndLevelForShowMenu(2,tagtemp.getParentTag().getParentTag().getTagId());
                if(leftList!=null && leftList.size()>0) {
                    aboveList = tagService.findChildTagByparentIdAndLevelForShowMenu(3,tagtemp.getParentTag().getTagId());
                }
                break;
            default:break;
        }
        ActionContext.getContext().put("aboveList",aboveList);
        ActionContext.getContext().put("leftList",leftList);



        if(page==null){
            page = new Page();
            int tempCurPage = page.getCurPage();
            page.setCurPage(1);
            firstList = pageService.findNewsListFront(page,tagPath);
            page.setCurPage(tempCurPage);
            list = pageService.findNewsListFront(page,tagPath);
        }else{
            int tempCurPage = page.getCurPage();
            page.setCurPage(1);
            firstList = pageService.findNewsListFront(page,tagPath);
            page.setCurPage(tempCurPage);
            list = pageService.findNewsListFront(page,tagPath);

        }

        if((list.size()>1)||(list.size()==1&&firstList.size()!=0&&page.getCurPage()>1)) {
            ActionContext.getContext().put("list",list);
            aboveTagList = tagService.frontFindByPosition(1);
            ActionContext.getContext().put("aboveTagList",aboveTagList);
            if(tagtemp.getTagLevel()==1){
                labelTag1 = tagtemp;
                labelTag2 = tagtemp;
            }else if(tagtemp.getTagLevel()==2){
                labelTag1 = tagtemp.getParentTag();
                labelTag2 = tagtemp;
            }else{
                labelTag1 = tagtemp.getParentTag().getParentTag();
                labelTag2 = tagtemp.getParentTag();
            }

            ActionContext.getContext().put("labelTag1",labelTag1);
            ActionContext.getContext().put("labelTag2",labelTag2);
            return SUCCESS;
        }
        else if(list.size()==1) {
            chainnewId = list.get(0).getId();
            ActionContext.getContext().put("chainnewId",chainnewId);
            if(tagtemp.getTagLevel()==1){
                labelTag1 = tagtemp;
                labelTag2 = tagtemp;
            }else if(tagtemp.getTagLevel()==2){
                labelTag1 = tagtemp.getParentTag();
                labelTag2 = tagtemp;
            }else{
                labelTag1 = tagtemp.getParentTag().getParentTag();
                labelTag2 = tagtemp.getParentTag();
            }

            ActionContext.getContext().put("labelTag1",labelTag1);
            ActionContext.getContext().put("labelTag2",labelTag2);
            return "toone";
        }else{
            if(tagtemp.getTagLevel()==1){
                if(leftList.size()!=0){
                    page = new Page();
                    list = pageService.findNewsListFront(page,tagtemp.getTagId()+"/"+leftList.get(0).getTagId());
                    if(list.size()>1) {
                        ActionContext.getContext().put("list",list);
                        aboveTagList = tagService.frontFindByPosition(1);
                        ActionContext.getContext().put("aboveTagList",aboveTagList);
                        labelTag1 = tagtemp;
                        labelTag2 = leftList.get(0);
                        ActionContext.getContext().put("labelTag1",labelTag1);
                        ActionContext.getContext().put("labelTag2",labelTag2);
                        return SUCCESS;
                    }else if(list.size()==1){
                        chainnewId = list.get(0).getId();
                        ActionContext.getContext().put("chainnewId",chainnewId);
                        labelTag1 = tagtemp;
                        labelTag2 = leftList.get(0);
                        ActionContext.getContext().put("labelTag1",labelTag1);
                        ActionContext.getContext().put("labelTag2",labelTag2);
                        return "toone";
                    }else{
                        if(aboveList.size()!=0){
                            page = new Page();
                            list = pageService.findNewsListFront(page,tagtemp.getTagId()+"/"+leftList.get(0).getTagId()+"/"+aboveList.get(0).getTagId());
                            if(list.size()>1) {
                                ActionContext.getContext().put("list",list);
                                aboveTagList = tagService.frontFindByPosition(1);
                                ActionContext.getContext().put("aboveTagList",aboveTagList);
                                labelTag1 = tagtemp;
                                labelTag2 = leftList.get(0);
                                ActionContext.getContext().put("labelTag1",labelTag1);
                                ActionContext.getContext().put("labelTag2",labelTag2);
                                return SUCCESS;
                            }else if(list.size()==1){
                                chainnewId = list.get(0).getId();
                                labelTag1 = tagtemp;
                                labelTag2 = leftList.get(0);
                                ActionContext.getContext().put("chainnewId",chainnewId);
                                ActionContext.getContext().put("labelTag1",labelTag1);
                                ActionContext.getContext().put("labelTag2",labelTag2);
                                return "toone";
                            }else{
                                ActionContext.getContext().put("chainnewId",null);
                                labelTag1 = tagtemp;
                                labelTag2 = leftList.get(0);
                                ActionContext.getContext().put("labelTag1",labelTag1);
                                ActionContext.getContext().put("labelTag2",labelTag2);
                                return "toone";
                            }
                        }
                        ActionContext.getContext().put("chainnewId",null);
                        labelTag1 = tagtemp;
                        labelTag2 = leftList.get(0);
                        ActionContext.getContext().put("labelTag1",labelTag1);
                        ActionContext.getContext().put("labelTag2",labelTag2);
                        return "toone";
                    }

                }
                ActionContext.getContext().put("chainnewId",null);
                labelTag1 = tagtemp;
                labelTag2 = tagtemp;
                ActionContext.getContext().put("labelTag1",labelTag1);
                ActionContext.getContext().put("labelTag2",labelTag2);
                return "toone";
            }

            else if(tagtemp.getTagLevel()==2){
                labelTag1 = tagtemp.getParentTag();
                labelTag2 = tagtemp;
                ActionContext.getContext().put("labelTag1",labelTag1);
                ActionContext.getContext().put("labelTag2",labelTag2);
                if(aboveList.size()!=0){
                    page = new Page();
                    list = pageService.findNewsListFront(page,tagtemp.getParentTag().getTagId()+"/"+tagtemp.getTagId()+"/"+aboveList.get(0).getTagId());
                    if(list.size()>1) {
                        ActionContext.getContext().put("list",list);
                        aboveTagList = tagService.frontFindByPosition(1);
                        ActionContext.getContext().put("aboveTagList",aboveTagList);
                        return SUCCESS;
                    }else if(list.size()==1){
                        chainnewId = list.get(0).getId();
                        ActionContext.getContext().put("chainnewId",chainnewId);
                        return "toone";
                    }else{
                        ActionContext.getContext().put("chainnewId",null);
                        return "toone";
                    }
                }
                ActionContext.getContext().put("chainnewId",null);
                return "toone";
            }
            else{
                labelTag1 = tagtemp.getParentTag().getParentTag();
                labelTag2 = tagtemp.getParentTag();
                ActionContext.getContext().put("labelTag1",labelTag1);
                ActionContext.getContext().put("labelTag2",labelTag2);
                page = new Page();
                list = pageService.findNewsListFront(page,tagtemp.getParentTag().getParentTag().getTagId()+"/"+tagtemp.getParentTag().getTagId()+"/"+tagtemp.getTagId());
                if(list.size()>1) {
                    ActionContext.getContext().put("list",list);
                    aboveTagList = tagService.frontFindByPosition(1);
                    ActionContext.getContext().put("aboveTagList",aboveTagList);
                    return SUCCESS;
                }else if(list.size()==1){
                    chainnewId = list.get(0).getId();
                    ActionContext.getContext().put("chainnewId",chainnewId);
                    return "toone";
                }else{
                    ActionContext.getContext().put("chainnewId",null);
                    return "toone";
                }
            }

        }

    }
/*
    @Action(value="loadAboveTags", results={@Result(type="json", params={"root","aboveTagList"})}, interceptorRefs={
            @InterceptorRef("defaultStack")
    })
    public String loadAboveTags(){

        aboveTagList = tagService.frontFindByPosition(1);
        return "aboveTagsjson";
    }
*/

    @Action(
            value="home",
            results={
                    @Result(name="success",location="/index.html")

            },
            interceptorRefs={
                    @InterceptorRef("defaultStack")
            }
    )
    public String loadFrontTags(){
        // 将得到数据 添加到静态的页面中
        Configuration cf = new Configuration();
        cf.setEncoding(Locale.CHINA, "UTF-8");
        cf.setServletContextForTemplateLoading(request.getSession().getServletContext(), "WEB-INF/templates/");
        Map<String, Object> map = new HashMap<String, Object>();
        // 获取当前应用的路径
        String path = request.getSession().getServletContext().getRealPath("");
        // 获取当前工程
        FileOutputStream os = null;
        OutputStreamWriter osw = null;
        Writer out = null;
        try {
            //生成静态html
            Template template= cf.getTemplate("showIndex.html","UTF-8");
            /*********************************************************************/
            List<NewsAndNotice> focusPictureList = newsAndNoticeService.showFocusPicture();
            map.put("focusPictureList",focusPictureList);
            //上部列表加载
            aboveTagList = tagService.frontFindByPosition(1);
            map.put("aboveTagList",aboveTagList);
            //通知公告位置新闻列表加载
            List <NewsAndNotice> noticeList = newsAndNoticeService.findNewsByTag("39");
            if(noticeList!=null&&!noticeList.isEmpty()){
                if(noticeList.size()>7){
                    noticeList = noticeList.subList(0,7);
                }
            }
           map.put("noticeList",noticeList);
            //左下位置列表加载
            leftTagList = tagService.frontFindByPosition(2);
            map.put("leftTagList",leftTagList);
            List<List<NewsAndNotice>> leftNewsList= new ArrayList<List<NewsAndNotice>>();
            if(leftTagList.size()!=0){
                for(int i=0;i<leftTagList.size();i++){
                    Tag tagtemp = leftTagList.get(i);
                    String pathtemp = String.valueOf(tagtemp.getTagId());
                    if(tagtemp.getParentTag() !=null){
                        pathtemp = tagtemp.getParentTag().getTagId()+"/" +pathtemp;
                        if(tagtemp.getParentTag().getParentTag() !=null){
                            pathtemp = tagtemp.getParentTag().getParentTag().getTagId()+"/" +pathtemp;
                        }
                    }
                    List temp = newsAndNoticeService.findNewsByTag(pathtemp);
                    if(temp!=null&&!temp.isEmpty()){
                        if(temp.size()>8)
                            temp = temp.subList(0,8);
                    }
                    leftNewsList.add(temp);
                }
            }
            map.put("leftNewsList",leftNewsList);

            //右下位置列表加载
            rightTagList = tagService.frontFindByPosition(3);
            map.put("rightTagList",rightTagList);
            List<List<NewsAndNotice>> rightNewsList= new ArrayList<List<NewsAndNotice>>();
            if(rightTagList!=null && rightTagList.size()!=0){
                for(int i=0;i<rightTagList.size();i++){
                    Tag tagtemp = rightTagList.get(i);
                    String pathtemp = String.valueOf(tagtemp.getTagId());
                    if(tagtemp.getParentTag() !=null)
                    {
                        pathtemp = tagtemp.getParentTag().getTagId()+"/" +pathtemp;
                        if(tagtemp.getParentTag().getParentTag() !=null)
                        {
                            pathtemp = tagtemp.getParentTag().getParentTag().getTagId()+"/" +pathtemp;
                        }
                    }
                    List temp = newsAndNoticeService.findNewsByTag(pathtemp);
                    if(temp!=null&&!temp.isEmpty()){
                        if(temp.size()>8)
                            temp = temp.subList(0,8);
                    }
                    rightNewsList.add(temp);
                }
            }
            map.put("rightNewsList",rightNewsList);
        /*********************************************************************/
            //开始生成
            File f=new File(path+"/index.html");
            os=new FileOutputStream(f);
            osw=new OutputStreamWriter(os,"UTF-8");
            out = new BufferedWriter(osw);
            template.process(map, out);
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            try {
                os.close();
                osw.close();
                out.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return SUCCESS;
    }



    @Action(
            value="frontSearchNews",
            results={
                    @Result(name="success",location="/user/searchNews.jsp")

            },
            interceptorRefs={
                    @InterceptorRef("defaultStack")
            }
    )
    public String frontSearchNews(){
//上部列表加载
        aboveTagList = tagService.frontFindByPosition(1);
        ActionContext.getContext().put("aboveTagList",aboveTagList);
        if(page==null) {
            page = new Page();
            searchList = pageService.frontSearchNews(searchword,page);
        }else{
            searchList = pageService.frontSearchNews(searchword,page);
        }

        ActionContext.getContext().put("searchList",searchList);
        if(searchword!=null){
            ActionContext.getContext().put("presearchword",searchword.trim());
        }



        return "success";
    }


    public Tag getTag() {
        return tag;
    }

    public void setTag(Tag tag) {
        this.tag = tag;
    }

    public String getTid() {
        return tid;
    }

    public void setTid(String tid) {
        this.tid = tid;
    }

    public Page getPage() {
        return page;
    }

    public void setPage(Page page) {
        this.page = page;
    }

    public String getChainnewId() {
        return chainnewId;
    }

    public void setChainnewId(String chainnewId) {
        this.chainnewId = chainnewId;
    }
    public List<Tag> getAboveTagList() {
        return aboveTagList;
    }

    public void setAboveTagList(List<Tag> aboveTagList) {
        this.aboveTagList = aboveTagList;
    }

    public List<Tag> getLeftTagList() {
        return leftTagList;
    }

    public void setLeftTagList(List<Tag> leftTagList) {
        this.leftTagList = leftTagList;
    }

    public List<Tag> getRightTagList() {
        return rightTagList;
    }

    public void setRightTagList(List<Tag> rightTagList) {
        this.rightTagList = rightTagList;
    }
    public String getSearchword() {
        return searchword;
    }

    public void setSearchword(String searchword) {
        this.searchword = searchword;
    }
    public List<NewsAndNotice> getSearchList() {
        return searchList;
    }

    public void setSearchList(List<NewsAndNotice> searchList) {
        this.searchList = searchList;
    }

}
