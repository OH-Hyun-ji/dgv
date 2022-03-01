package com.dgv.web.admin.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.dgv.web.admin.common.AwsS3;
import com.dgv.web.admin.service.AdminMovieService;
import com.dgv.web.admin.vo.AdminActorVO;
import com.dgv.web.admin.vo.AdminAgeVO;
import com.dgv.web.admin.vo.AdminGenreVO;
import com.dgv.web.admin.vo.AdminGroupVO;
import com.dgv.web.admin.vo.CommonResultDto;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
@Controller
public class AdminMovieController {

	@Autowired
	private AdminMovieService adminMovieService;
	
	@Autowired
	private AwsS3 awsS3;
	

	//admin 장르/연령 관리페이지이동
	@RequestMapping("/adminManageMent.mdo")
	public String adminManagement(AdminGenreVO vo ,Model model , AdminAgeVO ageVo) {
		model.addAttribute("genreList",adminMovieService.genreList());
		model.addAttribute("ageList" ,adminMovieService.ageList());
		return "/movie/admin_movie_management";
	}
	
	//admin 장르 등록 페이지
	@RequestMapping("/adminGenre.mdo")
	public String adminGenre(AdminGenreVO vo) {
		
		return "/movie/admin_movie_genre_register";
	}
	//장르 등록후 처리
	@ResponseBody
	@PostMapping("/adminInsertGenre.mdo")
	public Result adminInsertGenre( @RequestBody AdminGenreVO vo) {
		int num=0;
		num = adminMovieService.insertGenre(vo);
		System.out.println("TEST :1"+ vo.getMovie_genre_name());
		if(num ==0) {
			return new Result(false);
		}else {
			return new Result(true);
		}
	}
	
	@Getter
	@Setter
	@RequiredArgsConstructor
	public static class Result {
		@JsonProperty("isSuccess")
		private final boolean isSuccess;
	}
	
	//admin 연령등록 페이지
	@RequestMapping("/adminAge.mdo")
	public String adminAge() {
		return "/movie/admin_movie_age_register";
	}
	
	//admin 연령등록 후 처리
	@PostMapping("/adminInsertAge.mdo")
	@ResponseBody
	public CommonResultDto adminInsertAge(@RequestPart("ageVo") AdminAgeVO ageVo, @RequestPart("imgFile") MultipartFile imgFile) {

		final UUID uuid = UUID.randomUUID();
		final String url = "age/" + uuid.toString() + ageVo.getMovie_age_img();
		final String path = "https://dgvworld.s3.ap-northeast-2.amazonaws.com/";
		ageVo.setMovie_age_img(path + url);
		final int num = adminMovieService.insertAge(ageVo);

		System.out.println("num : " + num);
		if (num == 0) {
			System.out.println("등록 실패");
			return CommonResultDto.fail();

		} else {
			try {
				InputStream is = imgFile.getInputStream();
				String contentType = imgFile.getContentType();
				long contentLength = imgFile.getSize();
				awsS3.upload(is, path, contentType, contentLength);

				System.out.println("등록 성공");

			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return CommonResultDto.success();
		}

	}
	
	//admin 감독/배우 관리 페이지
	@RequestMapping("/adminManager.mdo")
	public String adminManager(AdminGroupVO vo, Model model, AdminActorVO actorVo) {
		model.addAttribute("groupList",adminMovieService.groupList());
		model.addAttribute("actorList",adminMovieService.actorList());
		return "/movie/admin_movie_manager";
	}
	
	//그룹 등록후 처리 
	@PostMapping("/adminInsertGroup.mdo")
	@ResponseBody
	public String adminGroupInsert(@RequestBody AdminGroupVO vo) {
		int num = adminMovieService.insertGroup(vo);
		System.out.println("그룹 이름 : "+ vo.getMovie_group_name());
		
		Gson gson = new Gson();
		JsonObject jsonObject = new JsonObject();
				
		if(num ==0) {
			System.out.println("등록 실패");
			jsonObject.addProperty("msg", "FAIL");			
		}else {
			System.out.println("등록 성공");
			jsonObject.addProperty("msg", "SUCCESS");
		}
		
		String jsonResult= gson.toJson(jsonObject);
		
		return jsonResult;
		
	}
			
	//그룹관리
	@RequestMapping("/adminGroup.mdo")
	public String adminGroup(AdminGroupVO vo) {
		System.out.println("TEST 2: ");
		System.out.println("그룹 이름 : "+ vo.getMovie_group_name());
		return "/movie/admin_movie_group_register";
	}
	
	//감독/배우관리
	@RequestMapping("/adminActor.mdo")
	public String adminActor(AdminGroupVO vo, Model model) {
		model.addAttribute("groupCode",adminMovieService.groupList());
		return "/movie/admin_movie_actor_register";
	}
		
	@PostMapping("/adminInsertActor.mdo")
	@ResponseBody
	public CommonResultDto adminInsertActor(@RequestPart("actorVo") AdminActorVO actorVo, @RequestPart("imgFile") MultipartFile imgFile) {

		
		final UUID uuid= UUID.randomUUID();
		final String url = "parPeople/"+uuid.toString()+actorVo.getMovie_actor_img();
		final String path ="https://dgvworld.s3.ap-northeast-2.amazonaws.com/";
		actorVo.setMovie_actor_img(path+url);
		
		System.out.println("url : "+url);
		
		final int num =adminMovieService.insertActor(actorVo);
		System.out.println(actorVo.getMovie_actor_name());
		System.out.println(actorVo.getReg_id());
	
		
		if(num==0) {
	
			return CommonResultDto.fail();
		}else {
			try {
				InputStream is = imgFile.getInputStream();
				String contentType = imgFile.getContentType();
				long contentLength = imgFile.getSize();
				awsS3.upload(is, url, contentType, contentLength);
			
				}catch(IOException e) {
					e.printStackTrace();
				}
		}
		
		return CommonResultDto.success();
}
}
