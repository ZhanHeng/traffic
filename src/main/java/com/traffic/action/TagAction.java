package com.traffic.action;

import com.alibaba.fastjson.JSONArray;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.traffic.dto.Execution;
import com.traffic.dto.LoginResult;
import com.traffic.enums.LoginEnum;
import com.traffic.model.Tag;
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
@Results({@Result(name ="tagjson",type ="json"),
        @Result(name ="parentTagtagjson",type ="json"),
        @Result(name ="levelTagjson",type ="json"),
        @Result(name ="childTagjson",type ="json")}) //向前台传json数据必须要这句
@Scope("session")                  //支持多例
@ParentPackage("all")              //表示继承的父包
public class TagAction extends ActionSupport {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
    @Autowired
    private TagService tagService;
    private Tag tag;
    private String id;
    private List<String> tagList;
    private Tag editTag;
    private String levelId;
    private List<Tag> belongTagList;
    private List<Tag> levelTagList;
    private List<Tag> childTagList;
    private String currentId ;
    private String parentId ;

    private  void INITAL(){
        this.setTag(null);
        ActionContext.getContext().put("list",null);
    }
    @Action( //表示请求的Action及处理方法
            value="addTag",  //表示action的请求名称
            results={  //表示结果跳转
                    @Result(name="success", type = "chain",location="tagList")
            },
            interceptorRefs={   //表示拦截器引用
                    @InterceptorRef("myStack")
            },
            exceptionMappings={  //映射映射声明
                    @ExceptionMapping(exception="java.lang.Exception",result="error")
            }
    )
    public String addTag(){
        try {
            Execution execution = tagService.add(tag);
            if (execution.getState()>0){
                request.setAttribute("loginResult", new LoginResult<Execution>(true,execution));
                return SUCCESS;
            }else{
                request.setAttribute("loginResult", new LoginResult<Execution>(false,execution));
                return SUCCESS;
            }
        } catch (Exception e){
            logger.error(e.getMessage() , e );
            Execution execution = new Execution(LoginEnum.INNER_ERROR);
            request.setAttribute("loginResult", new LoginResult<Execution>(true,execution));
            return INPUT;
        }
    }
    @Action(
            value="tagList",
            results={
                    @Result(name="success",location="/tag/list.jsp")
            },
            interceptorRefs={
                    @InterceptorRef("myStack")
            },
            exceptionMappings={
                    @ExceptionMapping(exception="java.lang.Exception",result="error")
            }
    )
    public String listAll(){//TODO 加入Redis 缓存优化
        try {
            INITAL();
            List<Tag> list = tagService.findAll();
            ActionContext.getContext().put("list",list);
            ActionContext.getContext().put("loginResult",null);
            return SUCCESS;
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            return ERROR;
        }
    }
    @Action(
            value="searchTag",
            results={
                    @Result(name="success",location="/tag/list.jsp")
            },
            interceptorRefs={
                    @InterceptorRef("myStack")
            },
            exceptionMappings={
                    @ExceptionMapping(exception="java.lang.Exception",result="error")
            }
    )
    public String query(){
        try {
            List<Tag> list = tagService.findByTagProperty(tag);
            ActionContext.getContext().put("list",list);
            return SUCCESS;
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            return ERROR;
        }
    }

    @Action(
            value="batchDel",
            results={
                    @Result(name="success",location="/tag/list.jsp")
            },
            interceptorRefs={
                    @InterceptorRef("myStack")
            },
            exceptionMappings={
                    @ExceptionMapping(exception="java.lang.Exception",result="error")
            }
    )
    public String batchDelete(){
        try {
            tagService.bacthDeleteTag(tagList);
            List<Tag> list = tagService.findAll();
            ActionContext.getContext().put("list",list);
            return SUCCESS;
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            return ERROR;
        }
    }

    @Action(
            value="del",
            results={
                    @Result(name="success",type = "chain" ,location="tagList")
            },
            interceptorRefs={
                    @InterceptorRef("myStack")
            },
            exceptionMappings={
                    @ExceptionMapping(exception="java.lang.Exception",result="error")
            }
    )
    public String delete(){
        try {
            Tag tag = tagService.findById(Long.parseLong(id));
            tagService.delete(tag);
            List<Tag> list = tagService.findAll();
            ActionContext.getContext().put("list",list);
            Execution execution = new Execution(LoginEnum.DELETE_SUCCESS);
            // ActionContext.getContext().put("loginResult",new LoginResult<Execution>(true,execution));
            request.setAttribute("loginResult", new LoginResult<Execution>(true,execution));
            return SUCCESS;
        }catch (Exception e){
            logger.error(e.getMessage());
            Execution execution = new Execution(LoginEnum.DELETE_ERROR);
            request.setAttribute("loginResult", new LoginResult<Execution>(true,execution));
            return SUCCESS;
        }
    }

    @Action(
            value="update",
            results={
                    @Result(name="success",location="/tag/list.jsp")
            },
            interceptorRefs={
                    @InterceptorRef("myStack")
            },
            exceptionMappings={
                    @ExceptionMapping(exception="java.lang.Exception",result="error")
            }
    )
    public String update(){
        try {
            editTag.setParentTag(tagService.findById(editTag.getParentTag().getTagId()));//把实体先SET进去再更新
            Execution execution = tagService.update(editTag);
            if (execution.getState()>0){
                List<Tag> list = tagService.findAll();
                ActionContext.getContext().put("list",list);
                this.setTag(null);
                return SUCCESS;
            }else{
                request.setAttribute("loginResult", new LoginResult<Execution>(false,execution));
                List<Tag> list = tagService.findAll();
                ActionContext.getContext().put("list",list);
                this.setTag(null);
                return SUCCESS;
            }
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            return ERROR;
        }
    }


    @Action(value="getTag", results={@Result(type="json", params={"root","editTag"})})
    public String get() {
        editTag = tagService.findById(Long.parseLong(id));
        return "tagjson";
    }

    @Action(value="loadParentTag", results={@Result(type="json", params={"root","belongTagList"})})
    public String loadParentTag(){
        belongTagList = tagService.findByLevel(Integer.parseInt(levelId)-1);
        return "parentTagtagjson";
    }
    @Action(value="loadLevelTag", results={@Result(type="json", params={"root","levelTagList"})})
    public String findTagByLevel(){
        levelTagList = tagService.findByLevel(Integer.parseInt(levelId));
        return "levelTagjson";
    }

    @Action(value="loadChildTag", results={@Result(type="json", params={"root","childTagList"})})
    public String findChildTagList(){
        childTagList = tagService.findChildTagByparentIdAndLevel(Integer.parseInt(currentId),Long.parseLong(parentId));
        return  "childTagjson";
    }
    public Tag getTag() {
        return tag;
    }

    public void setTag(Tag tag) {
        this.tag = tag;
    }

    public List<String> getTagList() {
        return tagList;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setTagList(List<String> tagList) {
        this.tagList = tagList;
    }

    public Tag getEditTag() {
        return editTag;
    }

    public void setEditTag(Tag editTag) {
        this.editTag = editTag;
    }

    public String getLevelId() {
        return levelId;
    }

    public void setLevelId(String levelId) {
        this.levelId = levelId;
    }

    public List<Tag> getBelongTagList() {
        return belongTagList;
    }

    public void setBelongTagList(List<Tag> belongTagList) {
        this.belongTagList = belongTagList;
    }

    public List<Tag> getLevelTagList() {
        return levelTagList;
    }

    public void setLevelTagList(List<Tag> levelTagList) {
        this.levelTagList = levelTagList;
    }

    public List<Tag> getChildTagList() {
        return childTagList;
    }

    public void setChildTagList(List<Tag> childTagList) {
        this.childTagList = childTagList;
    }

    public String getCurrentId() {
        return currentId;
    }

    public void setCurrentId(String currentId) {
        this.currentId = currentId;
    }

    public String getParentId() {
        return parentId;
    }

    public void setParentId(String parentId) {
        this.parentId = parentId;
    }
}
