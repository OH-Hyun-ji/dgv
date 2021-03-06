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
import com.dgv.web.admin.vo.AdminNoticeVO;
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
		}
		
		//예매율
		double total = adminMovieService.totalSum();
		List<UserReserveVO> reserveList = adminMovieService.totalPeopleCount();
		for(UserReserveVO reserveVo : reserveList) {
			for(AdminMovieVO movieVo : movieList) {
				if(reserveVo.getMovie_num()==movieVo.getMovie_num()) {				
					double totalPeople =  reserveVo.getTotal_people();
					double result =totalPeople/total*100;
					String totalResult = String.format("%.1f", result);
					movieVo.setReservationRate(totalResult);
				}
			}
		}
		
		//공지사항 
		AdminNoticeVO noticeVo = userBoardService.mainNotice();
		model.addAttribute("noticeVo",noticeVo);
		
		List<AdminEventVO> eventList =adminMovieService.continueEventSelect();
		model.addAttribute("eventList", eventList);
		model.addAttribute("movieList",movieList);
		
		return"/main/user_main";
	}
}
