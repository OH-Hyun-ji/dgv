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

import com.dgv.web.admin.service.AdminMovieService;
import com.dgv.web.admin.service.AdminTheaterService;
import com.dgv.web.admin.service.FileUploadService;
import com.dgv.web.admin.vo.AdminActorVO;
import com.dgv.web.admin.vo.AdminCityVO;
import com.dgv.web.admin.vo.AdminGroupVO;
import com.dgv.web.admin.vo.AdminMovieVO;
import com.dgv.web.admin.vo.AdminParVO;
import com.dgv.web.admin.vo.AdminRegionVO;
import com.dgv.web.admin.vo.AdminTheaterVO;
import com.dgv.web.admin.vo.AdminTotalTheaterDto;
import com.dgv.web.admin.vo.BuilderTest;
import com.dgv.web.admin.vo.CommonResultDto;
import com.dgv.web.admin.vo.ParticipantDto;
import com.google.gson.Gson;

@Controller
public class AdminTheaterController {

	@Autowired
	private AdminTheaterService adminTheaterService;
	
	@Autowired
	private AdminMovieService adminMovieService;
	
	@Autowired
	private FileUploadService fileUploadService;
	
	@RequestMapping("/movieList.mdo")
	public String movieList() {
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
	public List<AdminRegionVO> lookingCode(@RequestBody AdminCityVO cityVo,Model model) {
		List<AdminRegionVO> regionList =adminTheaterService.choiceRegion(cityVo.getCity_code());
		model.addAttribute("choiceRegionList",regionList);
		if(regionList.size() ==0)
			return new ArrayList<AdminRegionVO>();
		return regionList;
	}
	
	@PostMapping("/insertMovie.mdo")
	@ResponseBody
	public CommonResultDto insertMovie(HttpSession session, @RequestPart("movieVo") AdminMovieVO movieVO, @RequestPart("parList") List<ParticipantDto> dtoList, @RequestPart MultipartFile imgFile) {
		
		// 1. 이미지 파일 s3 업
		final FileUploadService.FileUploadResult fileResult = fileUploadService.fileUpload(imgFile, "movie/", movieVO.getMovie_real_img());
		if(!fileResult.isSuccess())
			return CommonResultDto.fail();
		
		// 2. 영화 정보 insert
		movieVO.setMovie_img(fileResult.getUrl());
		adminMovieService.insertMovie(movieVO);
		
		// 3. 관계자 정보 insert
		final int insertCount = dtoList.stream()
			.mapToInt(dto ->
				adminMovieService.insertPar(
					AdminParVO.builder()
						.movie_num(movieVO.getMovie_num())
						.movie_group_code(dto.getGroupCode())
						.movie_actor_code(dto.getParticipantCode())
						.reg_id((String)session.getAttribute("adminID"))
						.build() //객체를 만들겠다.
				)	
			).sum();
		
		if(dtoList.size() != insertCount)
			return CommonResultDto.fail();
		
		return CommonResultDto.success();
								
	}
	
	
	//admin극장관리로 이동 
	@RequestMapping("/adminTheater.mdo")
	public String movieTheater(AdminCityVO vo, Model model,AdminRegionVO regionVo) {
		System.out.println("TEST : 1");
		model.addAttribute("adminCity", adminTheaterService.selectCityList());
		// 시티에 해당하는 극장 query
		model.addAttribute("adminRegion", adminTheaterService.selectRegionList());
		
		final List<AdminCityVO> testList =  adminTheaterService.adminTotalList();
		
		final Gson gson = new Gson();
		final String totalListJson = gson.toJson(testList);
		model.addAttribute("adminTotalList", testList);
		model.addAttribute("totalListJson", totalListJson);
		
		
		
		return "/movie/admin_movie_theater";
	}
	@PostMapping("/insertTheater.mdo")
	@ResponseBody
	public CommonResultDto insertTheater(@RequestBody AdminTheaterVO vo,AdminRegionVO regionVo) {
		//지역이름을 지역코드로 불러오고 
		AdminRegionVO regionCode= adminMovieService.regionList(vo.getRegion_name());
		System.out.println("지역코드 : " +regionCode.getRegion_code());
		//다시 코드 넣어주기
		vo.setRegion_code(regionCode.getRegion_code());
		int result = adminMovieService.insertTheater(vo);
		if(result !=0 ) {
			return CommonResultDto.success();
		}else {			
			return CommonResultDto.fail();
		}
	}
	
	

}