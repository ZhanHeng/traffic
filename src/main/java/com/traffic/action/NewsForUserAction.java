package com.traffic.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.traffic.dto.Page;
import com.traffic.model.NewsAndNotice;
import com.traffic.model.Tag;
import com.traffic.service.NewsAndNoticeService;
import com.traffic.service.PageService;
import com.traffic.service.TagService;
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
import java.util.ArrayList;
import java.util.List;
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
        List<NewsAndNotice> list = null;
        List<Tag> aboveList =null;
        List<Tag> leftList =null;
        String tagPath = tid;

        if(tagtemp.getParentTag() !=null)
        {
            tagPath = tagtemp.getParentTag().getTagId()+"/" +tagPath;
            if(tagtemp.getParentTag().getParentTag() !=null)
            {
                tagPath = tagtemp.getParentTag().getParentTag().getTagId()+"/" +tagPath;
            }
        }


        if(tagtemp.getTagLevel()==1)
        {
            String hql ="";
            hql="from Tag where passFlag = 1 and  parentTag.tagId ="+tagtemp.getTagId()+"order by weight desc";
            leftList = tagService.queryByHql(hql);
            if(leftList.size()>0)
            {
                hql="from Tag where passFlag = 1 and  parentTag.tagId ="+leftList.get(0).getTagId()+"order by weight desc";
                aboveList = tagService.queryByHql(hql);
            }
        }
        if(tagtemp.getTagLevel()==2)
        {
            String hql ="";
            hql="from Tag where passFlag = 1 and  parentTag.tagId ="+tagtemp.getParentTag().getTagId()+"order by weight desc";
            leftList = tagService.queryByHql(hql);
            if(leftList.size()>0)
            {
                hql="from Tag where passFlag = 1 and  parentTag.tagId ="+tagtemp.getTagId()+"order by weight desc";
                aboveList = tagService.queryByHql(hql);
            }
        }
        if(tagtemp.getTagLevel()==3)
        {
            String hql ="";
            hql="from Tag where passFlag = 1 and  parentTag.tagId ="+tagtemp.getParentTag().getParentTag().getTagId()+"order by weight desc";
            leftList = tagService.queryByHql(hql);
            if(leftList.size()>0)
            {
                hql="from Tag where passFlag = 1 and  parentTag.tagId ="+tagtemp.getParentTag().getTagId()+"order by weight desc";
                aboveList = tagService.queryByHql(hql);
            }
        }
        ActionContext.getContext().put("aboveList",aboveList);
        ActionContext.getContext().put("leftList",leftList);



        if(page==null){
            page = new Page();

            list = pageService.findNewsListFront(page,tagPath);
        }else{
            list = pageService.findNewsListFront(page,tagPath);
        }

        if(list.size()>1) {
            ActionContext.getContext().put("list",list);
            return SUCCESS;
        }
        else if(list.size()==1) {
            chainnewId = list.get(0).getId();
            ActionContext.getContext().put("chainnewId",chainnewId);
            return "toone";
        }else{
            if(tagtemp.getTagLevel()==1){
                if(leftList.size()!=0){
                    page = new Page();
                    list = pageService.findNewsListFront(page,tagtemp.getTagId()+"/"+leftList.get(0).getTagId());
                    if(list.size()>1) {
                        ActionContext.getContext().put("list",list);
                        return SUCCESS;
                    }else if(list.size()==1){
                        chainnewId = list.get(0).getId();
                        ActionContext.getContext().put("chainnewId",chainnewId);
                        return "toone";
                    }else{
                        if(aboveList.size()!=0){
                            page = new Page();
                            list = pageService.findNewsListFront(page,tagtemp.getTagId()+"/"+leftList.get(0).getTagId()+"/"+aboveList.get(0).getTagId());
                            if(list.size()>1) {
                                ActionContext.getContext().put("list",list);
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

                }
                ActionContext.getContext().put("chainnewId",null);
                return "toone";
            }

            if(tagtemp.getTagLevel()==2){
                if(aboveList.size()!=0){
                    page = new Page();
                    list = pageService.findNewsListFront(page,tagtemp.getParentTag().getTagId()+"/"+tagtemp.getTagId()+"/"+aboveList.get(0).getTagId());
                    if(list.size()>1) {
                        ActionContext.getContext().put("list",list);
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
            if(tagtemp.getTagLevel()==3){
                page = new Page();
                list = pageService.findNewsListFront(page,tagtemp.getParentTag().getParentTag().getTagId()+"/"+tagtemp.getParentTag().getTagId()+"/"+tagtemp.getTagId());
                if(list.size()>1) {
                    ActionContext.getContext().put("list",list);
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
}
