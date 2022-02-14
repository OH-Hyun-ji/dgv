package com.dgv.web.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserMyPageController {
	
	@RequestMapping("/mypage.do")
	public String mypage() {
		return "/mypage/user_mypage";
	}
	
}

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