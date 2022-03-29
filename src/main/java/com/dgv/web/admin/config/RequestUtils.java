package com.dgv.web.admin.config;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

public class RequestUtils {
	
	public static HttpServletRequest getRequest() {
		return ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
	}

	public static HttpSession getSession() {
	    return RequestUtils.getRequest().getSession(true);
	}
	
	public static <T> T getSessionObject(final String key, final Class<T> type) {
		return type.cast(RequestUtils.getSession().getAttribute(key));
	}
	
	public static String getUserId(final String userId) {
		return (String) RequestUtils.getSession().getAttribute("userID");
	}
	
	public static String getUserEmail(final String userEmail) {
		return (String) RequestUtils.getSession().getAttribute("userEmail");	
	}
	
	public static String getUserImg(final String userImg) {
		return (String) RequestUtils.getSession().getAttribute("userImg");
	}
	public static String getRankName(final String rankName) {
		return (String) RequestUtils.getSession().getAttribute("rankName");
	}
	public static String getRankImg(final String rankImg) {
		return (String) RequestUtils.getSession().getAttribute("rankImg");
	}
	public static String getAdminId(final String adminId) {
		return (String) RequestUtils.getSession().getAttribute("adminId");
	}
	public static String getRankEarn(final String rankEarn) {
		return (String) RequestUtils.getSession().getAttribute("rankEarn");
	}
	public static String getCouponCount(final String couponCount) {
		return (String) RequestUtils.getSession().getAttribute("couponCount");
	}
	public static String getPoint(final String string) {
		return (String) RequestUtils.getSession().getAttribute("point");
	}

	
	
	public static void setUserId(final String userId) {
		RequestUtils.getSession().setAttribute("userID", userId);
	}
	public static void setUserEmail(final String userEmail) {
		RequestUtils.getSession().setAttribute("userEmail", userEmail);
		
	}
	public static void setUserImg(final String userImg) {
		RequestUtils.getSession().setAttribute("userImg", userImg);
	}
	
	public static void setRankName(final String rankName) {
		RequestUtils.getSession().setAttribute("rankName",rankName);
	}

	public static void setRankImg(final String rankImg) {
		RequestUtils.getSession().setAttribute("rankImg",rankImg);
	}
	
	public static void setAdminId(final String adminId) {
		RequestUtils.getSession().setAttribute("adminId",adminId);
	}
	
	public static void setRankEarn(final String rankEarn) {
		RequestUtils.getSession().setAttribute("rankEarn",rankEarn);
	}
	
	public static void setCouponCount(final String couponCount) {
		RequestUtils.getSession().setAttribute("couponCount",couponCount);
	}
	
	public static void setPoint(final String point) {
		RequestUtils.getSession().setAttribute("point",point);
	}


}
