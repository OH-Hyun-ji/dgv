package com.dgv.web.user.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dgv.web.admin.service.AdminMovieService;
import com.dgv.web.admin.service.AdminTheaterService;
import com.dgv.web.admin.vo.AdminAgeVO;
import com.dgv.web.admin.vo.AdminGenreVO;
import com.dgv.web.admin.vo.AdminMovieVO;
import com.dgv.web.admin.vo.AdminRegionVO;
import com.dgv.web.admin.vo.AdminSeatVO;
import com.dgv.web.admin.vo.AdminTheaterVO;
import com.dgv.web.admin.vo.AdminTimeVO;
import com.dgv.web.admin.vo.CommonResultDto;
import com.dgv.web.user.service.UserBoardService;
import com.dgv.web.user.vo.UserMapVO;
import com.dgv.web.user.vo.UserMoiveImgVO;
import com.dgv.web.user.vo.UserReserveVO;
import com.google.gson.Gson;

@Controller
public class UserReserveController {

	@Autowired
	private AdminMovieService adminMovieService;
	
	@Autowired
	private AdminTheaterService adminTheaterService;
	
	@Autowired
	private UserBoardService userBoardService;
	
	@GetMapping("/movieReserve.do")
	public String movieReserve(Model model,AdminMovieVO vo) {
		List<AdminMovieVO> movieList =adminMovieService.movieList();
			
			List<AdminAgeVO> ageList = adminMovieService.ageList();
			for(AdminMovieVO movieVo: movieList) {
				for(AdminAgeVO ageVo:ageList) {
					if(movieVo.getMovie_age_code() == ageVo.getMovie_age_num()) {
						movieVo.setAge_img(ageVo.getMovie_age_img());
					}
				}
			}
		vo.setMovie_num(-1);
		model.addAttribute("movieInfo", vo);
		model.addAttribute("movieList", movieList);
		model.addAttribute("cityList",adminTheaterService.selectCityList());
		
		return "/reserve/user_reserve";
	}
	@PostMapping("/movieReserve.do")
	public String movieReserveView(Model model, @RequestParam("movie_num") int num) {
		List<AdminMovieVO> movieList =adminMovieService.movieList();
		System.out.println("num = "+num);
		AdminMovieVO movieInfo = userBoardService.movieList(num);
		model.addAttribute("movieInfo",movieInfo);
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
	
	@PostMapping("/reserveSeat.do")
	public String reserveSeat(@ModelAttribute("reserveVO") UserReserveVO vo ,Model model) {
			//영화정보
			AdminMovieVO movieVo = userBoardService.movieList(vo.getMovie_num());
			model.addAttribute("movieName",movieVo.getMovie_title());
			model.addAttribute("movieList",movieVo );
			
			//지도정보(위치)
			UserMapVO mapVo = userBoardService.mapList(vo.getRegion_code());
			model.addAttribute("mapName",mapVo.getMap_name());
			
			//연령 정보
			AdminAgeVO ageVo = adminMovieService.ageListInfo(movieVo.getMovie_age_code());
			model.addAttribute("ageList",ageVo);
			
			//장르 정보
			AdminGenreVO genreVo = adminMovieService.genreListInfo(movieVo.getMovie_genre_code());
			model.addAttribute("genreList", genreVo);
			
			//극장 정보 
			AdminTheaterVO theaterVo = userBoardService.theaterListInfo(vo.getTheater_code());
			model.addAttribute("theaterName",theaterVo.getTheater_name());
			model.addAttribute("theaterList",theaterVo);
			
			//좌석 정보 
			AdminSeatVO seatVo = userBoardService.seatListInfo(vo.getTheater_code());
			int row = theaterVo.getTheater_max_row();
			int col = theaterVo.getTheater_max_column();
			model.addAttribute("seatAll",row*col);
			List<String> seatL = new ArrayList<String>();
			String[] seatStatus = (seatVo.getSeat_status()).split(",");
			for(int i=0; i<seatStatus.length;i++) {
				seatL.add(seatStatus[i]);
			}
			Gson gson =new Gson();
			
			model.addAttribute("seatStatus",gson.toJson(seatL));
			model.addAttribute("seatRemain",(row*col)-seatStatus.length);
			System.out.println("남은 좌석"+((row*col)-seatStatus.length));
			System.out.println("날짜 : "+vo.getReserve_date());
			System.out.println("시간 : "+vo.getMovie_time_start());
			model.addAttribute("date",vo.getReserve_date());
			model.addAttribute("time",vo.getMovie_time_start());
			model.addAttribute("row",row);
			model.addAttribute("col",col);
						
			System.out.println("/// : " +vo.toString());			
		return "/seat/user_seat";
	}
	@PostMapping("/theaterList.do")
	@ResponseBody
	public String theaterList(@RequestBody AdminTheaterVO theaterVo) {
		List<AdminTheaterVO> theaterList = userBoardService.theaterCodeList(theaterVo.getRegion_code());
		List<AdminTheaterVO> theaterL = new ArrayList<AdminTheaterVO>();
		List<AdminTimeVO> timeList = new ArrayList<AdminTimeVO>();
		
		
		for(AdminTheaterVO thVo : theaterList) {
			System.out.println("현재 상영관  "+ thVo.getTheater_name());
			AdminTimeVO  timeVo= userBoardService.timeStatusList(thVo.getTheater_code());
			System.out.println("bbb ");
			AdminSeatVO seatVo = userBoardService.seatListInfo(thVo.getTheater_code());
			thVo.setMovie_time_code(timeVo.getMovie_time_code());
			thVo.setMovie_time_start(timeVo.getMovie_time_start());
			thVo.setSeat_status(seatVo.getSeat_status());
		
		}
		
		Gson gson = new Gson();
		String tList =gson.toJson(theaterList);
		System.out.println("/?????");
		return tList;
	}
	
//	@PostMapping("/theaterTimeList.do")
//	@ResponseBody
//	public String theaterTimeList(@RequestBody AdminTimeVO vo,AdminTheaterVO theaterVo) {
//		String[] time = null;
//		List<AdminTimeVO> timeList= adminMovieService.timeList(vo.getRegion_code());
//		for(AdminTimeVO timeL :timeList) {
//			System.out.println("배열 나누고 난후 "+timeL.getTheater_code());
//			System.out.println(time[0]);
//			System.out.println(time[1]);
//			
//		}
//
//		
//		Gson gson = new Gson();
//		String timeTheaterList = gson.toJson(timeList);
//		return timeTheaterList;
//		
//		
//	}
	
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
	
	@RequestMapping("/movieVideo.do")
	public String movieVideo(@RequestParam("movie_video") String video,@RequestParam("movie_num") int num,Model model) {
		AdminMovieVO movieVo = userBoardService.movieList(num);
		UserMoiveImgVO imgVo = userBoardService.imgList(num);
		model.addAttribute("movieVo",movieVo);
		model.addAttribute("imgVo",imgVo);
		model.addAttribute("video",video);
		
		
		return "movie/user_movie_mp4";
	}

}
