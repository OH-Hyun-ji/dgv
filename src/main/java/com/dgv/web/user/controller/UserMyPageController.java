package com.dgv.web.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserMyPageController {

//  아직 CSS 적용중
//	@RequestMapping("/myPage.do")
//	public String mypage() {
//		return "/mypage/user_mypage";
//	}
	
	@RequestMapping("/informationUpdateChange.do")
	public String informationChange() {
		return "/mypage/user_mypage_informationupdatechange";
	}
	
	@RequestMapping("/informationUpdatePassword.do")
	public String informationUpdatePassword() {
		return "/mypage/user_mypage_informationupdatepassword";
	}
	
}

//참고하기
//package com.dgv.web.user.controller;
//
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//
//@Controller
//public class UserMovieController {
//
//	@RequestMapping("/artHouse.do")
//	public String artHouse() {
//		return "/movie/user_movie_artHouse";
//	}
//	
//	@RequestMapping("/arthouseVideo.do")
//	public String artVideo() {
//		return "/movie/user_movie_video";
//	}
//	
//	@RequestMapping("/theater.do")
//	public String theater() {
//		return "/movie/user_movie_theater";
//	}
//	
//	@RequestMapping("/movieChart.do")
//	public String movieChart() {
//		return "/movie/user_movie_movieChart";
//	}
//	@RequestMapping("/movieDetail.do")
//	public String movieDetail() {
//		return "/movie/user_movie_movieDetail";
//	}
//}