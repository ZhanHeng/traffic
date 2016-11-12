package com.traffic.Interceptor;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * 过滤掉一些静态文件
 * Created by ZhanHeng on 2016/11/12.
 */
public class ReDispatcherFilter implements Filter {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    private List<String> includes = new ArrayList<String>();

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        String target = request.getRequestURI();
        target = target.lastIndexOf("?") > 0 ? target.substring(target.lastIndexOf("/") + 1,
                target.lastIndexOf("?") - target.lastIndexOf("/")) : target.substring(target.lastIndexOf("/") + 1);
        //System.out.println(target);
        if (this.includes.contains(target)) {
            RequestDispatcher rdsp = request.getRequestDispatcher(target);
            logger.info("go >>"+rdsp);
            rdsp.forward(req, resp);
        }
        else{
            chain.doFilter(req, resp);
        }
    }

    public void init(FilterConfig config) throws ServletException {
        this.includes.addAll(Arrays.asList(config.getInitParameter("includeServlets").split(",")));
    }

    public void destroy() {    }
}
