package com.dgv.web.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminMovieController {

	@RequestMapping("/movieList.mdo")
	public String movieList() {
		return "/movie/admin_movie_list";
	}
	
	@RequestMapping("/movieRegister.mdo")
	public String movieRegister() {
		return "/movie/admin_movie_register";
	}
	
}
