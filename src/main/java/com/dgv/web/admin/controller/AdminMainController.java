package com.dgv.web.admin.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dgv.web.admin.service.AdminMovieInfoService;
import com.dgv.web.admin.vo.AdminMovieInfoVO;

@Controller
public class AdminMainController {

	private AdminMovieInfoService adminMovieInfoService;
	
	@RequestMapping("/insertMovie.mdo")
	public String insertMovie(AdminMovieInfoVO vo) throws IOException{
		System.out.println("��� !!!");
		adminMovieInfoService.insertMovieInfo(vo);
		return "/main/admin_main";
	}
	
	@RequestMapping("/movie.mdo")
	public String insertMovie1() {
		System.out.println("��� !!!");
		
		return "/main/admin_main";
	}

	
}
