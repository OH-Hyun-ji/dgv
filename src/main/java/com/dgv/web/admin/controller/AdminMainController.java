package com.dgv.web.admin.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dgv.web.admin.service.AdminCrawlerService;
import com.dgv.web.admin.service.AdminMovieService;
import com.dgv.web.admin.service.AdminUserService;
import com.dgv.web.admin.vo.AdminGenreVO;
import com.dgv.web.admin.vo.AdminMovieInfoVO;
import com.dgv.web.admin.vo.AdminMovieVO;
import com.dgv.web.user.service.UserBoardService;
import com.dgv.web.user.vo.UserReserveVO;
import com.dgv.web.user.vo.UserVO;

@Controller
public class AdminMainController {
	
	@Autowired
	private AdminMovieService adminMovieService;
	
	@Autowired AdminUserService adminUserService;
	
	@Autowired
	private UserBoardService userBoardService;
	
	@Autowired
	private AdminCrawlerService adminMovieInfoService;
	
	@RequestMapping("/insertMovie.mdo")
	public String insertMovie(AdminMovieInfoVO vo) throws IOException{
		System.out.println("아.... !!!");
		adminMovieInfoService.insertMovieInfo(vo);
		return "/main/admin_main";
	}
	
	@RequestMapping("/movie.mdo")
	public String insertMovie1(UserReserveVO vo,Model model) {
	
		
		//전체 회원수 
		List<UserVO> userList =adminUserService.userList();
		model.addAttribute("userList",userList.size());
		
		//전체 총 매출액 
		UserReserveVO reserveVO= adminMovieService.totalMyMoney();
		model.addAttribute("totalMyMoney",reserveVO.getFomatter_price());
		
		//영화 구매 순위 
		List<AdminMovieVO> movieList =adminMovieService.movieList();
		List<UserReserveVO> bestMovieList = adminMovieService.bestMovieList();
		List<UserReserveVO> totalPeopleCount = adminMovieService.totalPeopleCount();
		
		for(UserReserveVO bestVo : bestMovieList) {
			for(AdminMovieVO movieVo : movieList) {
				if(bestVo.getMovie_num() == movieVo.getMovie_num()) {
					bestVo.setMovie_title(movieVo.getMovie_title());
					bestVo.setMovie_img(movieVo.getMovie_img());

				}
			}
		}
		for(UserReserveVO bestVo :bestMovieList) {
			for(UserReserveVO peopleVo : totalPeopleCount) {
				if(bestVo.getMovie_num()==peopleVo.getMovie_num()) {
					bestVo.setTotal_people(peopleVo.getTotal_people());
				}
			}
		}
		model.addAttribute("bestMovieList",bestMovieList);
		// 일별 매출 통계
		int today = 0;
		Calendar cal = Calendar.getInstance();
		String format = "yyyy-MM-dd";
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		List<Integer> dataList = new ArrayList<Integer>();

		System.out.println("//////////////////////////////////////");
		
		int j = 0;
		for (int i = 0; i < 6; i++) {
			cal.add(cal.DATE, j);
			System.out.println(" j : "+j);
			System.out.println("cal : "+cal);
			
			String date = sdf.format(cal.getTime());
			System.out.println("date : "+date);
			Date sqlDate = Date.valueOf(date);
			
			
			
			vo.setRese_date(sqlDate);
			int count = adminMovieService.beforeChartCheck(vo);
				if (count != 0) {
					today = adminMovieService.areaChart(vo);
				} else { //null 막기위해 
					today = 0;
				}
///////////////////////////////////////////////////////////////////////////////////////////	
			if(i != 0){
				j= -1;
			}
			System.out.println("sqlDate" +sqlDate+"i : "+i+"today : "+today);
			dataList.add(i, today);
			j=-1;
		}
		model.addAttribute("dataList",dataList);
		
		//영화 장르별 통계
		List<AdminMovieVO> totalMovieList = adminMovieService.BarChartGenreInfo();
		
		for(AdminMovieVO movieVo : totalMovieList) {
			AdminGenreVO genreVo = adminMovieService.genreListInfo(movieVo.getMovie_genre_code());
			movieVo.setMovie_genre_name(genreVo.getMovie_genre_name());
		}
		
		System.out.println("");
		
		
		model.addAttribute("totalMovieList",totalMovieList);
		
		
		return "/main/admin_main";
	}

	
}
