package com.dgv.web.commons.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)throws Exception{
		
		HttpSession httpSession = request.getSession();
		
		if(httpSession.getAttribute("login") == null) {
			response.sendRedirect("/login/user_loginForm");
			return false;
		}
		return true;
	}
}
