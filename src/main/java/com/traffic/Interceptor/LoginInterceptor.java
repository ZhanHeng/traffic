package com.traffic.Interceptor;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;
import com.traffic.model.UserInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Session失效后的操作拦截
 * Created by ZhanHeng on 2016/11/12.
 */
public class LoginInterceptor implements Interceptor {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    public void destroy() {}

    public void init() {}

    public String intercept(ActionInvocation invocation) throws Exception {
        UserInfo admin= (UserInfo) ActionContext.getContext().getSession().get("userInfo");
        if(admin==null){
            logger.warn("没有登陆，返回到登陆页面");
            return "expire";
        }
        return invocation.invoke();
    }
}
