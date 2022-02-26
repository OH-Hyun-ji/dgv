package com.dgv.web.admin.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.dgv.web.admin.service.AdminTheaterService;
import com.dgv.web.admin.vo.AdminCityVO;
import com.dgv.web.admin.vo.AdminGenreVO;
import com.dgv.web.admin.vo.AdminRegionVO;
import com.dgv.web.admin.vo.AdminTheaterLocationVO;
import com.dgv.web.admin.vo.AdminTheaterVO;
import com.google.gson.Gson;

@Controller
public class AdminTheaterController {

	@Autowired
	private AdminTheaterService adminTheaterService;
	
	
	@RequestMapping("/movieList.mdo")
	public String movieList() {
		return "/movie/admin_movie_list";
	}
	
	@RequestMapping("/movieRegister.mdo")
	public String movieRegister() {
		return "/movie/admin_movie_register";
	}
	//admin극장관리로 이동 
	@RequestMapping("/adminTheater.mdo")
	public String movieTheater(AdminCityVO vo, Model model,AdminRegionVO regionVo) {
		System.out.println("TEST : 1");
		model.addAttribute("adminCity", adminTheaterService.selectCityList(vo));
		// 시티에 해당하는 극장 query
		model.addAttribute("adminRegion", adminTheaterService.selectRegionList(regionVo));
		
		final List<AdminCityVO> testList =  adminTheaterService.adminTotalList();
		
		final Gson gson = new Gson();
		final String totalListJson = gson.toJson(testList);
		model.addAttribute("adminTotalList", testList);
		model.addAttribute("totalListJson", totalListJson);
		
		return "/movie/admin_movie_theater";
	}

}