package com.dgv.web.user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dgv.web.admin.service.AdminMovieService;
import com.dgv.web.admin.vo.AdminAgeVO;
import com.dgv.web.admin.vo.AdminCityVO;
import com.dgv.web.admin.vo.AdminMovieVO;
import com.dgv.web.admin.vo.AdminRegionVO;
import com.dgv.web.user.service.UserBoardService;
import com.dgv.web.user.vo.UserMapVO;
import com.dgv.web.user.vo.UserVO;
import com.google.gson.Gson;

@Controller
public class UserMovieController {

	@Autowired
	private UserBoardService userBoardService;
	
	@Autowired
	private AdminMovieService adminMovieService;
	
	@RequestMapping("/artHouse.do")
	public String artHouse() {
		return "/movie/user_movie_artHouse";
	}
	
	@RequestMapping("/arthouseVideo.do")
	public String artVideo(Model model) {
		List<AdminMovieVO> movieList = adminMovieService.movieList();
		List<AdminAgeVO> ageList = adminMovieService.ageList();
		for(AdminMovieVO movieVo: movieList) {
			for(AdminAgeVO ageVo:ageList) {
				if(movieVo.getMovie_age_code() == ageVo.getMovie_age_num()) {
					movieVo.setAge_name(ageVo.getMovie_age_name());
				}
			}
		}
		model.addAttribute("movieList",movieList);
		return "/movie/user_movie_video";
	}
	
	@RequestMapping("/theater.do")
	public String theater(AdminCityVO vo , Model model) {
		Gson gson = new Gson();
		final List<AdminCityVO> cityL = userBoardService.cityTheater();
		
		
	//	final String cityList = gson.toJson(cityL);
		
		model.addAttribute("cityList",cityL);
		return "/movie/user_movie_theater";
	}
	//지도
	@PostMapping("/mapRegion.do")
	@ResponseBody
	public String mapRegion(@RequestBody UserMapVO vo) {
		UserMapVO mapVo = userBoardService.mapList(vo.getRegion_code());
		Gson gson = new Gson();
		String result = gson.toJson(mapVo);
		return result;
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
	public String movieChart(Model model) {
		List<AdminMovieVO> movieList = adminMovieService.movieList();
		List<AdminAgeVO> ageList = adminMovieService.ageList();
		for(AdminMovieVO movieVo: movieList) {
			for(AdminAgeVO ageVo:ageList) {
				if(movieVo.getMovie_age_code() == ageVo.getMovie_age_num()) {
					movieVo.setAge_name(ageVo.getMovie_age_name());
				}
			}
		}
		model.addAttribute("movieList",movieList);
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
