package com.dgv.web.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserMyPageController {

 
	@RequestMapping("/myPage.do")
	public String mypage() {
		return "/myPage/user_myPage";
	}
	
	@RequestMapping("/myPage_reserve.do")
	public String myPage_reserve() {
		return "/myPage/user_myPage_reserve";
	}
	
	@RequestMapping("/myPage_coupon.do")
	public String myPage_coupon() {
		return "/myPage/user_myPage_coupon";
	}
	
	@RequestMapping("/myPage_event.do")
	public String myPage_event() {
		return "/myPage/user_myPage_event";
	}
	
	@RequestMapping("/myPage_checkData.do")
	public String myPage_checkData() {
		return "/myPage/user_myPage_checkData";
	}
	
	@RequestMapping("/myPage_myData.do")
	public String myPage_myData() {
		return "/myPage/user_myPage_myData";
	}
	
}
