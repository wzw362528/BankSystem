package com.Zwei.util;

import com.Zwei.domain.UserBean;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author: Zwei
 * @create: 2020-09-29 11:23
 **/
public class MyInterceptor extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        System.out.println("前置拦截");
        UserBean user = (UserBean) request.getSession().getAttribute("user");
        if(user==null){
            response.sendRedirect("/pages/welcome");
            return  false;
        }
        return  true;
    }
}