package com.dgv.web.user.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dgv.web.admin.service.AdminMovieService;
import com.dgv.web.admin.vo.AdminActorVO;
import com.dgv.web.admin.vo.AdminAgeVO;
import com.dgv.web.admin.vo.AdminCityVO;
import com.dgv.web.admin.vo.AdminGenreVO;
import com.dgv.web.admin.vo.AdminGroupVO;
import com.dgv.web.admin.vo.AdminMovieVO;
import com.dgv.web.admin.vo.AdminParVO;
import com.dgv.web.admin.vo.AdminRegionVO;
import com.dgv.web.user.service.UserBoardService;
import com.dgv.web.user.vo.Criteria;
import com.dgv.web.user.vo.PageVO;
import com.dgv.web.user.vo.UserMapVO;
import com.dgv.web.user.vo.UserMoiveImgVO;
import com.dgv.web.user.vo.UserReserveVO;
import com.dgv.web.user.vo.UserVO;
import com.google.gson.Gson;

@Controller
public class UserMovieController {

	@Autowired
	private UserBoardService userBoardService;
	
	@Autowired
	private AdminMovieService adminMovieService;
	
	@RequestMapping("/artHouse.do")
	public String artHouse(Model model) {
		List<AdminMovieVO> artHouseList = userBoardService.userArtHouseList();
		
		model.addAttribute("artHouseList",artHouseList);
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
	
	@RequestMapping("/endMovie.do")
	public String endMovie(Model model,Criteria cri) {
		int total = userBoardService.endTotal();
		cri.setAmount(userBoardService.getTotal());
		List<AdminMovieVO> movieList =  adminMovieService.endMovie(cri); 
		List<AdminAgeVO> ageList = adminMovieService.ageList();
		for(AdminMovieVO movieVo: movieList) {
			for(AdminAgeVO ageVo:ageList) {
				if(movieVo.getMovie_age_code() == ageVo.getMovie_age_num()) {
					movieVo.setAge_name(ageVo.getMovie_age_name());
				}
			}
		}
		PageVO pageMake = new PageVO(total, cri);
		model.addAttribute("pageMake",pageMake);
		model.addAttribute("url","/yetMovie.do");
		model.addAttribute("movieList",movieList);

		return "/movie/user_movie_movieChart";
	}
	
	@RequestMapping("/yetMovie.do")
	public String yetMovie(Model model,Criteria cri) {
		int total = userBoardService.yetTotal();
		cri.setAmount(userBoardService.getTotal());
		List<AdminMovieVO> movieList =  adminMovieService.yetMovie(cri); 
		List<AdminAgeVO> ageList = adminMovieService.ageList();
		for(AdminMovieVO movieVo: movieList) {
			for(AdminAgeVO ageVo:ageList) {
				if(movieVo.getMovie_age_code() == ageVo.getMovie_age_num()) {
					movieVo.setAge_name(ageVo.getMovie_age_name());
				}
			}
		}
		PageVO pageMake = new PageVO(total, cri);
		model.addAttribute("pageMake",pageMake);
		model.addAttribute("url","/yetMovie.do");
		model.addAttribute("movieList",movieList);
		
		return "/movie/user_movie_movieChart";
	}
	
	
	@RequestMapping("/movieChart.do")
	public String movieChart(Model model,Criteria cri) {
		List<AdminMovieVO> movieList =  adminMovieService.continueMovie(cri); 
		List<AdminAgeVO> ageList = adminMovieService.ageList();
		for(AdminMovieVO movieVo: movieList) {
			
			for(AdminAgeVO ageVo:ageList) {
				if(movieVo.getMovie_age_code() == ageVo.getMovie_age_num()) {
					movieVo.setAge_name(ageVo.getMovie_age_name());
				}
			}
		}
		int total = userBoardService.continueTotal();
		PageVO pageMake = new PageVO(total, cri);
		model.addAttribute("pageMake",pageMake);
		model.addAttribute("url","/movieChart.do");
		model.addAttribute("movieList",movieList);

		return "/movie/user_movie_movieChart";
	}
	
	@RequestMapping("/movieDetail.do")
	public String movieDetail(@RequestParam("movie_num") int num,Model model) {
		
		AdminMovieVO movieList =userBoardService.movieList(num);
		AdminAgeVO ageList =adminMovieService.ageListInfo(movieList.getMovie_age_code());
		AdminGenreVO genreList =adminMovieService.genreListInfo(movieList.getMovie_genre_code());
		UserMoiveImgVO imgList = userBoardService.imgList(num);
		List<AdminParVO> parList =userBoardService.parList(num);
		List<AdminParVO> parGroupList =userBoardService.distinctGroupList(num);
		List<AdminActorVO> actorList = new ArrayList<AdminActorVO>();
		List<AdminGroupVO> groupList = new ArrayList<AdminGroupVO>();
		
		//예매율
		double total = adminMovieService.totalSum();
		List<UserReserveVO> reserveList = adminMovieService.totalPeopleCount();
		for(UserReserveVO reserveVo : reserveList) {
			if(reserveVo.getMovie_num() == movieList.getMovie_num()) {
				int result =(int) (reserveVo.getTotal_people()/total*100);
				double resultPercent = result*0.01;
				movieList.setReservationRate(resultPercent);
			}
		}
		
		
		for(AdminParVO parG : parGroupList) {
			groupList.addAll(userBoardService.groupList(parG.getMovie_group_code()));
			
		}
		for(AdminParVO par : parList) {
			actorList.addAll(userBoardService.actorList(par.getMovie_actor_code()));	
			System.out.println("?? :" + actorList.size());
		}
		
		movieList.setAge_name(ageList.getMovie_age_name());
		movieList.setMovie_genre(genreList.getMovie_genre_name());
		
		Gson gson = new Gson();
		
		model.addAttribute("imgList",imgList);
		model.addAttribute("ageList",ageList);
		model.addAttribute("genreList",genreList);
		model.addAttribute("groupList",groupList);
		model.addAttribute("groupListCount",groupList.size());		
		model.addAttribute("actorList",actorList);
		model.addAttribute("parGroupList",parGroupList);
		model.addAttribute("movieList",movieList);
		return "/movie/user_movie_movieDetail";
	}
	@RequestMapping("/movieActor.do")
	public String movieActor(@RequestParam("movie_actor_code") int num , Model model) {
		AdminActorVO actorVo = adminMovieService.actorListInfo(num);
		AdminGroupVO groupVo = adminMovieService.groupView(actorVo.getMovie_group_code());
		//해당 배우가 참여한 영화 리스트 뽑기
		actorVo.setMovie_group_name(groupVo.getMovie_group_name());
		List<AdminParVO> parList = userBoardService.actorMovieList(actorVo.getMovie_actor_code());
		List<AdminMovieVO> movieList = new ArrayList<AdminMovieVO>();
		List<AdminAgeVO> ageList = adminMovieService.ageList();
		for(AdminParVO parVo :parList) {
			movieList.addAll(userBoardService.actorParMovieList(parVo.getMovie_num()));
			
		}
		for(AdminMovieVO movieVO:movieList) {
			for(AdminAgeVO ageVo :ageList) {
				if(movieVO.getMovie_age_code()==ageVo.getMovie_age_num()) {
					movieVO.setAge_name(ageVo.getMovie_age_name());
				}
			}
		}
		
		model.addAttribute("movieList",movieList);
		model.addAttribute("parList",parList);
		model.addAttribute("actorVo",actorVo);
		
		return "/movie/user_movie_actor";
	}
}
