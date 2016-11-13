package com.traffic.Interceptor;

import com.traffic.model.UserInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * 验证非法进入URL的登录拦截器
 * Created by ZhanHeng on 2016/11/12.
 */
public class Loginfilter extends HttpServlet implements Filter {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    public void init(FilterConfig filterConfig) throws ServletException {

    }
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse respon = (HttpServletResponse)response;
        HttpSession session = req.getSession(true);

        String url = req.getRequestURI();
        UserInfo admin= (UserInfo)session.getAttribute("sessionUser");
        if (admin == null&&url.startsWith("/adminMainPage")) {
            //request.getRequestDispatcher("adminLogin.jsp").forward(request, response);
            HttpServletResponse resp = (HttpServletResponse)response;
            resp.sendRedirect("adminLogin.jsp");
            logger.warn("有外星人非法闯入网站 : "+ url);
            respon.setHeader("Cache-Control", "no-store");
            respon.setDateHeader("Expires", 0);
            respon.setHeader("Pragma", "no-cache");
        }
        chain.doFilter(request, response);
    }
}
