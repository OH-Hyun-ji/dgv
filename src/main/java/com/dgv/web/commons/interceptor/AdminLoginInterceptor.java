package com.dgv.web.commons.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.HandlerInterceptor;

public class AdminLoginInterceptor implements HandlerInterceptor{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)throws Exception{
		HttpSession session = request.getSession();
		Object loginStatus = session.getAttribute("adminId");
		if(loginStatus == null) {
			response.sendRedirect("/login.mdo");
			return false;
		}
		return true;
	}
}
