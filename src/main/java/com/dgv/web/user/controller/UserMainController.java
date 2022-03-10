package com.dgv.web.user.controller;

import java.util.List;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dgv.web.admin.common.S3KeyVO;
import com.dgv.web.admin.service.AdminMovieService;
import com.dgv.web.admin.vo.AdminAgeVO;
import com.dgv.web.admin.vo.AdminMovieVO;
import com.dgv.web.user.service.UserService;

@Controller
public class UserMainController {


	@Autowired
	private AdminMovieService adminMovieService;
	
	@RequestMapping("/dgvMain.do")
	public String dgvMain(Model model) {
		List<AdminMovieVO> movieList = adminMovieService.movieList();
		List<AdminAgeVO> ageList = adminMovieService.ageList();
		for(AdminMovieVO movie :  movieList) {
			for( AdminAgeVO age :ageList ) {
				if(movie.getMovie_age_code()==age.getMovie_age_num()) {
					movie.setAge_img(age.getMovie_age_img());
				}
			}
			System.out.println("???" + movie.getAge_img());
			System.out.println("???" + movie.getAge_img());
		}
		model.addAttribute("movieList",movieList);
		
		return"/main/user_main";
	}
}
