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
import com.dgv.web.admin.vo.AdminEventVO;
import com.dgv.web.admin.vo.AdminMovieVO;
import com.dgv.web.user.service.UserBoardService;
import com.dgv.web.user.service.UserService;
import com.dgv.web.user.vo.UserReserveVO;

@Controller
public class UserMainController {


	@Autowired
	private AdminMovieService adminMovieService;
	
	@Autowired
	private UserBoardService userBoardService;
	
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
		
		//예매율
		double total = adminMovieService.totalSum();
		List<UserReserveVO> reserveList = adminMovieService.totalPeopleCount();
		for(UserReserveVO reserveVo : reserveList) {
			for(AdminMovieVO movieVo : movieList) {
				if(reserveVo.getMovie_num()==movieVo.getMovie_num()) {				
					int result = (int) (reserveVo.getTotal_people()/total*100);
					System.out.println("result : "+result);
					double resultPercent = result*0.01;
					System.out.println("resultPercent : "+ resultPercent);
					movieVo.setReservationRate(resultPercent);
				}
			}
		}
		List<AdminEventVO> eventList =userBoardService.eventList();
		
		model.addAttribute("eventList",eventList);
		model.addAttribute("movieList",movieList);
		
		return"/main/user_main";
	}
}
