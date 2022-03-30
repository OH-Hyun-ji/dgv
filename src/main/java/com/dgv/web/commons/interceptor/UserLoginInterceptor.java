package com.dgv.web.commons.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.dgv.web.admin.config.RequestUtils;


public class UserLoginInterceptor implements HandlerInterceptor{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)throws Exception{
		HttpSession session = request.getSession();
		Object loginStatus = session.getAttribute("userID");
		if(loginStatus == null) {
			response.sendRedirect("loginForm.do");
			return false;
		}
		return true;
	}
}
