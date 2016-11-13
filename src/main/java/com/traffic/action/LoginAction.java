package com.traffic.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.sun.tools.internal.xjc.reader.xmlschema.bindinfo.BIConversion;
import com.traffic.dto.Execution;
import com.traffic.dto.LoginResult;
import com.traffic.enums.LoginEnum;
import com.traffic.model.UserInfo;
import com.traffic.service.UserService;
import org.apache.struts2.convention.annotation.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 登录Action
 * Created by lenovo on 2016/11/11.
 */

@Controller
@Scope("session")                  //支持多例
@ParentPackage("all")              //表示继承的父包
@Namespace(value="/")             //表示当前Action所在命名空间
public class LoginAction extends ActionSupport {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private UserService userInfoService;

    private UserInfo userInfo;

    private String id ;

    private String tagName;

    private String psw;
    /**
     * 用户注销登录
     * @return
     */
    @Action(value = "logout",
            results = { @Result(name="logout",location="/adminLogin.jsp")},
            interceptorRefs={   //表示拦截器引用
                    @InterceptorRef("defaultStack")
            }
    )
    public String logout() {
        ActionContext.getContext().getSession().clear();
        return "logout";
    }

    /**
     * 用户登录
     * @return
     */
    @Action( //表示请求的Action及处理方法
            value="login",  //表示action的请求名称
            results={  //表示结果跳转
                    @Result(name="success",location="/adminMainPage.jsp"),
                    @Result(name="input",location="/adminLogin.jsp"),
                    @Result(name="error",location="/error.jsp")
            },
            interceptorRefs={   //表示拦截器引用
                    @InterceptorRef("defaultStack")
            },
            exceptionMappings={  //映射映射声明
                    @ExceptionMapping(exception="java.lang.Exception",result="error")
            }
    )
    public String login(){
        try {
            if (userInfo!=null){
                Execution execution = userInfoService.validateUser(userInfo);
                if (execution.getState()>0){
                    ActionContext.getContext().getSession().put("sessionUser",	execution.getUserInfo());
                    ActionContext.getContext().put("loginResult",new LoginResult<Execution>(true,execution));
                    return SUCCESS;
                }else{
                    ActionContext.getContext().put("loginResult",new LoginResult<Execution>(false,execution));
                    return INPUT;
                }
            }else{
                Execution execution = new Execution(LoginEnum.INNER_ERROR);
                ActionContext.getContext().put("loginResult",new LoginResult<Execution>(false,execution));
                return INPUT;
            }
        } catch (Exception e){
            logger.error(e.getMessage() , e );
            Execution execution = new Execution(LoginEnum.INNER_ERROR);
            ActionContext.getContext().put("loginResult",new LoginResult<Execution>(true,execution));
            return INPUT;
        }
    }
    /**
     * 用户添加
     * @return
     */
    @Action( //表示请求的Action及处理方法
            value="addUser",  //表示action的请求名称
            results={  //表示结果跳转
                    @Result(name="success",location="/adminMainPage.jsp"),
                    @Result(name="input",location="/adminMainPage.jsp"),
                    @Result(name="error",location="/error.jsp")
            },
            interceptorRefs={   //表示拦截器引用
                    @InterceptorRef("defaultStack")
            },
            exceptionMappings={  //映射映射声明
                    @ExceptionMapping(exception="java.lang.Exception",result="error")
            }
    )
    public String addUser(){
        try {
            Execution execution = userInfoService.add(userInfo);
            ActionContext.getContext().put("loginResult",new LoginResult<Execution>(true,execution));
            return SUCCESS;
        } catch (Exception e){
            logger.error(e.getMessage() , e );
            Execution execution = new Execution(LoginEnum.INNER_ERROR);
            ActionContext.getContext().put("loginResult",new LoginResult<Execution>(true,execution));
            return INPUT;
        }
    }
    @Action(
            value="userList",
            results={
                    @Result(name="success",location="/user/list.jsp")
            },
            interceptorRefs={
                    @InterceptorRef("defaultStack")
            },
            exceptionMappings={
                    @ExceptionMapping(exception="java.lang.Exception",result="error")
            }
    )
    public String listAll(){
        try {
            List<UserInfo> list = userInfoService.findAll();
            ActionContext.getContext().put("list",list);
            return SUCCESS;
        } catch (Exception e){
            logger.error(e.getMessage() , e );
            return ERROR;
        }
    }

    @Action(
            value="delUser",
            results={
                    @Result(name="success",location="/user/list.jsp")
            },
            interceptorRefs={
                    @InterceptorRef("defaultStack")
            },
            exceptionMappings={
                    @ExceptionMapping(exception="java.lang.Exception",result="error")
            }
    )
    public String deleteUser(){
        try {
           UserInfo userInfo = userInfoService.findById(Long.parseLong(id));
            userInfoService.delete(userInfo);
            List<UserInfo> list = userInfoService.findAll();
            ActionContext.getContext().put("list",list);
            return SUCCESS;
        } catch (Exception e){
            logger.error(e.getMessage() , e );
            return ERROR;
        }
    }
    @Action(
            value="searchUser",
            results={
                    @Result(name="success",location="/user/list.jsp")
            },
            interceptorRefs={
                    @InterceptorRef("defaultStack")
            },
            exceptionMappings={
                    @ExceptionMapping(exception="java.lang.Exception",result="error")
            }
    )
    public String findByName(){
        try {
            List<UserInfo> list = userInfoService.findLikeName(tagName);
            ActionContext.getContext().put("list",list);
            return SUCCESS;
        } catch (Exception e){
            logger.error(e.getMessage() , e );
            return ERROR;
        }
    }
    @Action(
            value="alter",
            results={
                    @Result(name="success",location="/adminMainPage.jsp"),
                    @Result(name="input",location="/adminMainPage.jsp"),
                    @Result(name="error",location="/error.jsp")
            },
            interceptorRefs={
                    @InterceptorRef("defaultStack")
            },
            exceptionMappings={
                    @ExceptionMapping(exception="java.lang.Exception",result="error")
            }
    )
    public String alterPassWord(){
        try {
            UserInfo user = userInfoService.findById(Long.parseLong(id));
            if (user!=null){
                user.setPassWord(psw);
                Execution execution=userInfoService.update(user);
                ActionContext.getContext().put("loginResult",new LoginResult<Execution>(true,execution));
                return SUCCESS;
            }else{
                Execution execution = new Execution(LoginEnum.INNER_ERROR);
                ActionContext.getContext().put("loginResult",new LoginResult<Execution>(true,execution));
                return INPUT;
            }
        } catch (Exception e){
            logger.error(e.getMessage() , e );
            Execution execution = new Execution(LoginEnum.INNER_ERROR);
            ActionContext.getContext().put("loginResult",new LoginResult<Execution>(true,execution));
            return INPUT;
        }
    }
    public UserInfo getUserInfo() {
        return userInfo;
    }

    public void setUserInfo(UserInfo userInfo) {
        this.userInfo = userInfo;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTagName() {
        return tagName;
    }

    public void setTagName(String tagName) {
        this.tagName = tagName;
    }

    public String getPsw() {
        return psw;
    }

    public void setPsw(String psw) {
        this.psw = psw;
    }
}
