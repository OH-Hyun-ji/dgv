package com.dgv.web.user.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dgv.web.admin.service.AdminMovieService;
import com.dgv.web.admin.service.AdminTheaterService;
import com.dgv.web.admin.vo.AdminAgeVO;
import com.dgv.web.admin.vo.AdminMovieVO;
import com.dgv.web.admin.vo.AdminRegionVO;
import com.dgv.web.admin.vo.AdminTheaterVO;
import com.dgv.web.admin.vo.AdminTimeVO;
import com.dgv.web.admin.vo.CommonResultDto;
import com.google.gson.Gson;

@Controller
public class UserReserveController {

	@Autowired
	private AdminMovieService adminMovieService;
	
	@Autowired
	private AdminTheaterService adminTheaterService;
	
	@RequestMapping("/movieReserve.do")
	public String movieReserveView(Model model) {
		List<AdminMovieVO> movieList =adminMovieService.movieList();
		
		List<AdminAgeVO> ageList = adminMovieService.ageList();
		for(AdminMovieVO movieVo: movieList) {
			for(AdminAgeVO ageVo:ageList) {
				if(movieVo.getMovie_age_code() == ageVo.getMovie_age_num()) {
					movieVo.setAge_img(ageVo.getMovie_age_img());
				}
			}
		}
		
		
		model.addAttribute("movieList", movieList);
		model.addAttribute("cityList",adminTheaterService.selectCityList());
		return "/reserve/user_reserve";
	}
	@PostMapping("/theaterTimeList.do")
	@ResponseBody
	public String theaterTimeList(@RequestBody AdminTimeVO vo,AdminTheaterVO theaterVo) {
		String[] time = null;
		List<AdminTimeVO> timeList= adminMovieService.timeList(vo.getRegion_code());
		for(AdminTimeVO timeL :timeList) {
			time = (timeL.getMovie_time_start()).split("/");
			System.out.println("배열 나누고 난후 "+time.toString());
			System.out.println(time[0]);
			System.out.println(time[1]);
		}
		System.out.println("이건 나와서  :" + time);
		List<String> time_list = new ArrayList<String>();
		
		time_list.add(time[0]);
		
		
		Gson gson = new Gson();
		String timeTheaterList = gson.toJson(time);
		return timeTheaterList;
		
		
	}
	
	@PostMapping("/regionList.do")
	@ResponseBody
	public String regionListInfo(@RequestBody AdminRegionVO vo) {
		List<AdminRegionVO> regionList = adminTheaterService.choiceRegion(vo.getCity_code());
	
		Gson gson = new Gson();
		if(regionList.size() ==0) 
			return  new String();
		String regionL = gson.toJson(regionList);
		return regionL;
		
			
	}

}
