package com.traffic.action;

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

/**
 * 菜单的Action
 * Created by ZhanHeng on 2016/11/12.
 */
@Controller
@Namespace(value="/")             //表示当前Action所在命名空间
@Results({@Result(name ="listFocusjson",type ="json")}) //向前台传json数据必须要这句
@Scope("session")                  //支持多例
@ParentPackage("all")              //表示继承的父包
public class ShowFocusAction extends ActionSupport {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);

    @Autowired
    private NewsAndNoticeService newsAndNoticeService;

    private List<NewsAndNotice> focusPictureList;


    @Action(value="listFocusPicture", results={@Result(type="json", params={"root","focusPictureList"})},  interceptorRefs={
            @InterceptorRef("defaultStack")
    })
    public String listFocusPicture(){
        focusPictureList = newsAndNoticeService.showFocusPicture();
        return "listFocusjson";
    }

    public List<NewsAndNotice> getFocusPictureList() {
        return focusPictureList;
    }

    public void setFocusPictureList(List<NewsAndNotice> focusPictureList) {
        this.focusPictureList = focusPictureList;
    }
}
