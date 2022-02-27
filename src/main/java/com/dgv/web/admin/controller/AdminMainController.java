package com.dgv.web.admin.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dgv.web.admin.service.AdminCrawlerService;
import com.dgv.web.admin.vo.AdminMovieInfoVO;

@Controller
public class AdminMainController {
	
	@Autowired
	private AdminCrawlerService adminMovieInfoService;
	
	@RequestMapping("/insertMovie.mdo")
	public String insertMovie(AdminMovieInfoVO vo) throws IOException{
		System.out.println("아.... !!!");
		adminMovieInfoService.insertMovieInfo(vo);
		return "/main/admin_main";
	}
	
	@RequestMapping("/movie.mdo")
	public String insertMovie1() {
		System.out.println("등록!!!");
		
		return "/main/admin_main";
	}

	
}
