package com.dgv.web.user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dgv.web.admin.vo.AdminCityVO;
import com.dgv.web.admin.vo.AdminRegionVO;
import com.dgv.web.user.service.UserBoardService;
import com.google.gson.Gson;

@Controller
public class UserMovieController {

	@Autowired
	private UserBoardService userBoardService;
	
	@RequestMapping("/artHouse.do")
	public String artHouse() {
		return "/movie/user_movie_artHouse";
	}
	
	@RequestMapping("/arthouseVideo.do")
	public String artVideo() {
		return "/movie/user_movie_video";
	}
	
	@RequestMapping("/theater.do")
	public String theater(AdminCityVO vo , Model model) {
		Gson gson = new Gson();
		final List<AdminCityVO> cityL = userBoardService.cityTheater();
		
		final String cityList = gson.toJson(cityL);
		
		model.addAttribute("cityList",cityList);
		return "/movie/user_movie_theater";
	}
	
	@PostMapping("cityViewList.mdo")
	@ResponseBody
	public String  cityViewList(@RequestBody AdminRegionVO vo){
		List<AdminRegionVO> regionList = userBoardService.regionTheater(vo.getCity_code());
		System.out.println(regionList);
		Gson gson = new Gson();
		if(regionList.size() == 0 )
			return new String();
		String regionL = gson.toJson(regionList);
		return regionL;
		
	}
	
	@RequestMapping("/movieChart.do")
	public String movieChart() {
		return "/movie/user_movie_movieChart";
	}
	@RequestMapping("/movieDetail.do")
	public String movieDetail() {
		return "/movie/user_movie_movieDetail";
	}
	@RequestMapping("/movieActor.do")
	public String movieActor() {
		return "/movie/user_movie_actor";
	}
}
