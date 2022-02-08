package com.dgv.web.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserMovieController {

	@RequestMapping("/artHouse.do")
	public String artHouse() {
		return "/movie/user_movie_artHouse";
	}
	
	@RequestMapping("/arthouseVideo.do")
	public String artVideo() {
		return "/movie/user_movie_video";
	}
	
	@RequestMapping("/theater.do")
	public String theater() {
		return "/movie/user_movie_theater";
	}
}
