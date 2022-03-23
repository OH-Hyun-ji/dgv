package com.dgv.web.admin.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.dgv.web.admin.config.RequestUtils;
import com.dgv.web.admin.service.AdminMovieService;
import com.dgv.web.admin.service.AdminTheaterService;
import com.dgv.web.admin.service.FileUploadService;
import com.dgv.web.admin.vo.AdminActorVO;
import com.dgv.web.admin.vo.AdminAgeVO;
import com.dgv.web.admin.vo.AdminCityTheaterVO;
import com.dgv.web.admin.vo.AdminCityVO;
import com.dgv.web.admin.vo.AdminGenreVO;
import com.dgv.web.admin.vo.AdminGroupVO;
import com.dgv.web.admin.vo.AdminMovieVO;
import com.dgv.web.admin.vo.AdminParVO;
import com.dgv.web.admin.vo.AdminRegionVO;
import com.dgv.web.admin.vo.AdminSeatVO;
import com.dgv.web.admin.vo.AdminTheaterVO;
import com.dgv.web.admin.vo.AdminTotalTheaterDto;
import com.dgv.web.admin.vo.BuilderTest;
import com.dgv.web.admin.vo.CommonResultDto;
import com.dgv.web.admin.vo.ParticipantDto;
import com.dgv.web.admin.vo.TheaterInfoDto;
import com.dgv.web.user.controller.Pagination;
import com.dgv.web.user.service.UserBoardService;
import com.dgv.web.user.vo.PageVO;
import com.dgv.web.user.vo.UserMapVO;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

@Controller
public class AdminTheaterController {

	@Autowired
	private AdminTheaterService adminTheaterService;
	
	@Autowired
	private AdminMovieService adminMovieService;
	
	@Autowired
	private UserBoardService userBoardService;
	
	@Autowired
	private FileUploadService fileUploadService;
	
	
	@PostMapping("deleteMovie.mdo")
	@ResponseBody
	public CommonResultDto deleteMovie(@RequestBody AdminMovieVO vo) {
		int num = adminMovieService.deleteMovie(vo);
		
		if(num ==0 )
			return CommonResultDto.fail();
		return CommonResultDto.success();
	}
	
	@RequestMapping("/movieList.mdo")
	public String movieList(AdminMovieVO vo,Model model,AdminGenreVO genreVo) {
		List<AdminGenreVO> genreList =adminMovieService.genreList();
		List<AdminMovieVO> movieList =adminMovieService.movieList();
		List<AdminAgeVO> ageList = adminMovieService.ageList();
		for(AdminMovieVO movieInfo : movieList) {
			for(AdminGenreVO genreInfo : genreList) {
				if(movieInfo.getMovie_genre_code()==genreInfo.getMovie_genre_code()) {
					movieInfo.setMovie_genre(genreInfo.getMovie_genre_name());
				}
			}
		}
		for(AdminMovieVO movieInfo : movieList) {
			for(AdminAgeVO ageInfo : ageList) {
				if(movieInfo.getMovie_age_code()==ageInfo.getMovie_age_num()) {
					movieInfo.setAge_img(ageInfo.getMovie_age_img());
				}
			}
		}
		
		int movieCount = adminMovieService.movieList().size();
		
		
		model.addAttribute("movieList",movieList);
		model.addAttribute("movieListCount",adminMovieService.movieList().size());
		
		return "/movie/admin_movie_list";
	}
	//영화등록 
	@RequestMapping("/movieRegister.mdo")
	public String movieRegister(Model model) {
		model.addAttribute("groupList",adminMovieService.groupList());
		model.addAttribute("ageList",adminMovieService.ageList());
		model.addAttribute("genreList",adminMovieService.genreList());
		model.addAttribute("actorList", adminMovieService.actorList());
		
		final List<AdminGroupVO> groupL=adminMovieService.groupList();
		final List<AdminActorVO> actorL =adminMovieService.actorList();
		final List<AdminCityVO> cityL = adminTheaterService.selectCityList();
		final List<AdminRegionVO> regionL = adminTheaterService.selectRegionList();
	
		final Gson gson = new Gson();
		
		final String groupList = gson.toJson(groupL);
		final String actorList = gson.toJson(actorL);
		final String cityList = gson.toJson(cityL);
		final String regionList = gson.toJson(regionL);
		
		model.addAttribute("groupList1",groupList);
		model.addAttribute("actorList1",actorList);
		model.addAttribute("cityList",cityList);
		model.addAttribute("regionList",regionList);
		
		
		return "/movie/admin_movie_register";
	}
	@PostMapping("lookingCode.mdo")
	@ResponseBody
	public String lookingCode(@RequestBody AdminCityVO cityVo,Model model) {
		List<AdminRegionVO> regionList =adminTheaterService.choiceRegion(cityVo.getCity_code());
		model.addAttribute("choiceRegionList",regionList);
		System.out.println("jsp -> city_code : "+ cityVo);
		Gson gson = new Gson();
		
		if(regionList.size() ==0)
			return new String();
		System.out.println("regionList : "+regionList);
		String regionL =gson.toJson(regionList);
		return regionL;
	}
	
	@PostMapping("lookingPar.mdo")
	@ResponseBody
	public String lookingPar(@RequestBody AdminActorVO vo  ) {
		List<AdminActorVO> actorList = adminMovieService.choiceActorList(vo.getMovie_group_code());
		System.out.println("par : "+actorList);
		Gson gson = new Gson();
		if(actorList.size() ==0)
			return new String();
		String actorL = gson.toJson(actorList);		
		return actorL;
	}
	
	@PostMapping("lookingTheater.mdo")
	@ResponseBody
	public String lookingTheater(@RequestBody AdminTheaterVO vo) {
		List<AdminTheaterVO> theaterList =adminMovieService.choiceTheaterList(vo.getRegion_code());
		
		Gson gson = new Gson();
		if(theaterList.size() ==0)
			return new String();
		String theaterL = gson.toJson(theaterList);
		return theaterL;
	}
	
	@PostMapping("/insertMovie.mdo")
	@ResponseBody
	public CommonResultDto insertMovie(HttpSession session, @RequestPart("movieVo") AdminMovieVO movieVO,@RequestPart("theaterInfoList") List<TheaterInfoDto> theaterInfoList , @RequestPart("parList") List<ParticipantDto> dtoList, @RequestPart MultipartFile imgFile) {
		
		// 1. 이미지 파일 s3 업
		final FileUploadService.FileUploadResult fileResult = fileUploadService.fileUpload(imgFile, "movie/", movieVO.getMovie_real_img());
		if(!fileResult.isSuccess())
			return CommonResultDto.fail();
		
		// 2. 영화 정보 insert
		movieVO.setMovie_img(fileResult.getUrl());
		movieVO.setReg_id(RequestUtils.getAdminId("adminId"));
		adminMovieService.insertMovie(movieVO);
		
		// 3. 관계자 정보 insert
		final int insertCount = dtoList.stream()
			.mapToInt(dto ->
				adminMovieService.insertPar(
					AdminParVO.builder()
						.movie_num(movieVO.getMovie_num())
						.movie_group_code(dto.getGroupCode())
						.movie_actor_code(dto.getParticipantCode())
						.reg_id((String)session.getAttribute("adminId"))
						.build() //객체를 만들겠다.
				)	
			).sum();
		//4.상영관 정보 insert
		final int count = theaterInfoList.stream()
				.mapToInt(til ->
					adminMovieService.insertCityTheater(
						AdminCityTheaterVO.builder()
							.movie_num(movieVO.getMovie_num())
							.city_code(til.getCityCode())
							.region_code(til.getReginCode())
							.theater_code(til.getTheaterCode())
							.build()						
					)					
				).sum();
		if(dtoList.size() != insertCount || theaterInfoList.size() !=count )
			return CommonResultDto.fail();
		
		return CommonResultDto.success();
								
	}
	
	@PostMapping("deleteTheater.mdo")
	@ResponseBody
	public CommonResultDto deleteTheater(@RequestBody AdminTheaterVO theaterVo) {
		int num = adminMovieService.deleteTheater(theaterVo.getTheater_code());
		
		if(num ==0)
			return CommonResultDto.fail();
		return CommonResultDto.success();
	}
	
	//admin극장관리로 이동 
	@RequestMapping("/adminTheater.mdo")
	public String movieTheater(AdminCityVO vo, Model model,AdminRegionVO regionVo ,AdminTheaterVO theaterVo) {
		System.out.println("TEST 1 : ");
		List<AdminTheaterVO> TheaterList = adminMovieService.selectTheater();
		List<AdminRegionVO>  RegionList =adminTheaterService.selectRegionList();
		for(AdminTheaterVO tvo : TheaterList) {
			for(AdminRegionVO rvo: RegionList) {
				if(tvo.getRegion_code()==rvo.getRegion_code()) {
					System.out.println("tvo region_code: "+tvo.getRegion_code() );
					System.out.println("rvo region_code: "+rvo.getRegion_code() );
					tvo.setRegion_name(rvo.getRegion_name());
				}
			}
		}
	
		
		
		model.addAttribute("adminCity", adminTheaterService.selectCityList());
		// 시티에 해당하는 극장 query
		model.addAttribute("adminRegion", adminTheaterService.selectRegionList());
		model.addAttribute("adminTheater",TheaterList);
		model.addAttribute("adminTheaterCount",adminMovieService.selectTheater().size());
		final List<AdminCityVO> testList =  adminTheaterService.adminTotalList();
		
		final Gson gson = new Gson();
		final String totalListJson = gson.toJson(testList);
		model.addAttribute("adminTotalList", testList);
		model.addAttribute("totalListJson", totalListJson);
		
		
		
		return "/movie/admin_movie_theater";
	}
	@PostMapping("/insertTheater.mdo")
	@ResponseBody
	public CommonResultDto insertTheater(@RequestBody AdminTheaterVO vo,AdminRegionVO regionVo,AdminSeatVO seatVo,UserMapVO mapVo) {
		//지역이름을 지역코드로 불러오고 
		AdminRegionVO regionCode= adminMovieService.regionList(vo.getRegion_name());
		System.out.println("지역코드 : " +regionCode.getRegion_code());
		System.out.println("좌표 "+ vo.getMap_x());
		//다시 코드 넣어주기
		vo.setRegion_code(regionCode.getRegion_code());
		int result = adminMovieService.insertTheater(vo);
		
		//좌석 활성화 insert
		seatVo.setRegion_code(vo.getRegion_code());
		seatVo.setTheater_code(vo.getTheater_code());
		seatVo.setSeat_status(vo.getSeat_status());
		int num = adminMovieService.insertSeat(seatVo);
		result += num;
		
		//지도정보 insert
		mapVo.setMap_x(vo.getMap_x());
		mapVo.setMap_y(vo.getMap_y());
		mapVo.setMap_name(vo.getMap_name());
		mapVo.setRegion_code(regionCode.getRegion_code());
		mapVo.setMap_address(vo.getMap_address());
		int mapInfo = adminMovieService.selectMap(mapVo.getMap_name());
		
		if(mapInfo == 0){
			int num1 = userBoardService.insertMap(mapVo);
			result += num1;
			if(result !=0 ) {
				return CommonResultDto.success();
			}else {			
				return CommonResultDto.fail();
			}
		}else {
			return CommonResultDto.success();
		}
		
	}
	
	

}