package com.traffic.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.traffic.dto.Execution;
import com.traffic.dto.LoginResult;
import com.traffic.enums.LoginEnum;
import com.traffic.model.Tag;
import com.traffic.service.TagService;
import org.apache.struts2.convention.annotation.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 标签的Action
 * Created by ZhanHeng on 2016/11/12.
 */
@Controller
@Scope("session")                  //支持多例
@ParentPackage("all")              //表示继承的父包
@Namespace(value="/")             //表示当前Action所在命名空间
public class TagAction extends ActionSupport {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private TagService tagService;
    private Tag tag;

    @Action( //表示请求的Action及处理方法
            value="addTag",  //表示action的请求名称
            results={  //表示结果跳转
                    @Result(name="success",location="/adminMainPage.jsp")
            },
            interceptorRefs={   //表示拦截器引用
                    @InterceptorRef("myStack")
            },
            exceptionMappings={  //映射映射声明
                    @ExceptionMapping(exception="java.lang.Exception",result="error")
            }
    )
    @ResponseBody
    public String addTag(){
        try {
            Execution execution = tagService.add(tag);
            if (execution.getState()>0){
                ActionContext.getContext().put("loginResult",new LoginResult<Execution>(true,execution));
                return SUCCESS;
            }else{
                ActionContext.getContext().put("loginResult",new LoginResult<Execution>(false,execution));
                return SUCCESS;
            }
        } catch (Exception e){
            logger.error(e.getMessage() , e );
            Execution execution = new Execution(LoginEnum.INNER_ERROR);
            ActionContext.getContext().put("loginResult",new LoginResult<Execution>(true,execution));
            return INPUT;
        }
    }


    public Tag getTag() {
        return tag;
    }

    public void setTag(Tag tag) {
        this.tag = tag;
    }
}
