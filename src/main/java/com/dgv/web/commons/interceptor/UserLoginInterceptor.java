package com.dgv.web.commons.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.dgv.web.admin.config.RequestUtils;


public class UserLoginInterceptor implements HandlerInterceptor{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)throws Exception{
		if(RequestUtils.getUserId("userID") == null) {
			response.sendRedirect("/login/user_loginForm");
			return false;
		}
		return true;
	}
}
