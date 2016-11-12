package com.traffic.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.sun.tools.internal.xjc.reader.xmlschema.bindinfo.BIConversion;
import com.traffic.dto.Execution;
import com.traffic.dto.LoginResult;
import com.traffic.enums.LoginEnum;
import com.traffic.model.UserInfo;
import com.traffic.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

/**
 * 登录Action
 * Created by lenovo on 2016/11/11.
 */
@Controller
public class LoginAction extends ActionSupport {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private UserService userInfoService;

    private UserInfo userInfo;
    /**
     * 用户注销登录
     * @return
     */
    public String logout() {
        ActionContext.getContext().getSession().clear();
        return "logout";
    }

    /**
     * 用户登录
     * @return
     */
    public String login(){
        try {
            if (userInfo==null){
                Execution execution = new Execution(LoginEnum.INNER_ERROR);
                ActionContext.getContext().put("loginResult",new LoginResult<Execution>(false,execution));
                return INPUT;
            }else{
                Execution execution = userInfoService.validateUser(userInfo);
                if (execution.getState()>0){
                    ActionContext.getContext().put("loginResult",new LoginResult<Execution>(true,execution));
                    return INPUT;
                }else{
                    ActionContext.getContext().put("loginResult",new LoginResult<Execution>(false,execution));
                    return INPUT;
                }
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
}
