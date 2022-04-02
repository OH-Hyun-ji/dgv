package com.dgv.web.admin.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.dgv.web.admin.common.AwsS3;
import com.dgv.web.admin.config.AWSConfiguration;
import com.dgv.web.admin.service.AdminMovieService;
import com.dgv.web.admin.service.AdminTheaterService;
import com.dgv.web.admin.service.FileUploadService;
import com.dgv.web.admin.service.FileUploadService.FileUploadResult;
import com.dgv.web.admin.vo.AdminActorVO;
import com.dgv.web.admin.vo.AdminAgeVO;
import com.dgv.web.admin.vo.AdminGenreVO;
import com.dgv.web.admin.vo.AdminGroupVO;
import com.dgv.web.admin.vo.AdminMovieVO;
import com.dgv.web.admin.vo.AdminRegionVO;
import com.dgv.web.admin.vo.AdminTheaterVO;
import com.dgv.web.admin.vo.AdminTimeVO;
import com.dgv.web.admin.vo.CommonResultDto;
import com.dgv.web.admin.vo.TimeDto;
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

	@Autowired
	private FileUploadService fileUploadService;

	@Autowired
	private AdminTheaterService adminTheaterService;

	// 상영시간 등록
	@PostMapping("/timeInsert.mdo")
	@ResponseBody
	public CommonResultDto timeInsert(@RequestBody AdminTimeVO timeVo) {
		int result = adminMovieService.timeCheckList(timeVo.getTheater_code());

		if (result == 0) {
			int num = adminMovieService.insertTime(timeVo);

			if (num == 0)
				return CommonResultDto.fail();
			return CommonResultDto.success();
		} else
			return CommonResultDto.exist();

	}

	// 상영관 시간 설정
	@RequestMapping("adminTime.mdo")
	public String theaterTime(@RequestParam("theater_code") int num, Model model) {
		AdminTheaterVO theaterVo = adminMovieService.theaterListInfo(num);

		List<AdminRegionVO> regionVo = adminTheaterService.selectRegionList();

		for (AdminRegionVO regionL : regionVo) {
			if (regionL.getRegion_code() == theaterVo.getRegion_code()) {
				theaterVo.setRegion_name(regionL.getRegion_name());
			}
		}
		System.out.println("지역 이름 :" + theaterVo.getRegion_name());
		model.addAttribute("theaterList", theaterVo);
		return "/movie/admin_time_register";
	}

	// admin 장르/연령 관리페이지이동
	@RequestMapping("/adminManageMent.mdo")
	public String adminManagement(AdminGenreVO vo, Model model, AdminAgeVO ageVo) {
		model.addAttribute("genreList", adminMovieService.genreList());
		model.addAttribute("genreListCount", adminMovieService.genreList().size());
		model.addAttribute("ageList", adminMovieService.ageList());
		model.addAttribute("ageListCount", adminMovieService.ageList().size());
		return "/movie/admin_movie_management";
	}

	// admin 장르 등록 페이지
	@RequestMapping("/adminGenre.mdo")
	public String adminGenre(AdminGenreVO vo) {

		return "/movie/admin_movie_genre_register";
	}

	// 장르 등록후 처리
	@ResponseBody
	@PostMapping("/adminInsertGenre.mdo")
	public Result adminInsertGenre(@RequestBody AdminGenreVO vo, HttpSession session) {
		int num = 0;
		String adminId = (String) session.getAttribute("adminID");
		vo.setReg_id(adminId);
		num = adminMovieService.insertGenre(vo);
		System.out.println("TEST :1" + vo.getMovie_genre_name());
		if (num == 0) {
			return new Result(false);
		} else {
			return new Result(true);
		}
	}

	@PostMapping("deleteGenre.mdo")
	@ResponseBody
	public CommonResultDto deleteGenre(@RequestBody AdminGenreVO vo) {
		int num = adminMovieService.deleteGenre(vo);
		if (num == 0)
			return CommonResultDto.fail();
		return CommonResultDto.success();
	}

	@PostMapping("deleteAge.mdo")
	@ResponseBody
	public CommonResultDto deleteAge(@RequestBody AdminAgeVO vo) {
		int num = adminMovieService.deleteAge(vo);

		if (num == 0)
			return CommonResultDto.fail();
		return CommonResultDto.success();
	}

	@Getter
	@Setter
	@RequiredArgsConstructor
	public static class Result {
		@JsonProperty("isSuccess")
		private final boolean isSuccess;
	}

	@RequestMapping("/genreUpdate.mdo")
	public String updateGenrePage(@RequestParam("movie_genre_code") int num, Model model) {
		AdminGenreVO genreVo = adminMovieService.genreListInfo(num);
		model.addAttribute("genreList", genreVo);
		return "/movie/admin_genre_update";
	}

	@PostMapping("/genreUpdate.mdo")
	@ResponseBody
	public CommonResultDto updateGenre(@RequestBody AdminGenreVO vo) {
		int num = adminMovieService.updateGenre(vo);

		if (num == 0) {
			System.out.println("장르 수정 실패");
			return CommonResultDto.fail();
		} else {
			System.out.println("장르 수정 성공");
		}
		return CommonResultDto.success();
	}

	// admin 연령등록 페이지
	@RequestMapping("/adminAge.mdo")
	public String adminAge() {
		return "/movie/admin_movie_age_register";
	}

	// 연령 수정페이지
	@RequestMapping("/updateAge.mdo")
	public String updateAge(@RequestParam("movie_age_num") int num, Model model) {
		AdminAgeVO ageVo = adminMovieService.ageListInfo(num);
		model.addAttribute("ageList", ageVo);
		return "/movie/admin_age_update";
	}

	@PostMapping("/updateAge.mdo")
	@ResponseBody
	public CommonResultDto updateAge(@RequestPart("ageVo") AdminAgeVO ageVo,
			@RequestPart("imgFile") MultipartFile multipartFile) {

		final UUID uuid = UUID.randomUUID();
		final String url = "age/" + uuid.toString() + ageVo.getMovie_age_img();
		final String path = AWSConfiguration.S3_URL;
		ageVo.setMovie_age_img(path + url);
		final int num = adminMovieService.updateAge(ageVo);

		if (num == 0) {
			return CommonResultDto.fail();
		} else {
			InputStream is;
			try {
				is = multipartFile.getInputStream();
				String contentType = multipartFile.getContentType();
				long contentSize = multipartFile.getSize();
				awsS3.upload(is, path, contentType, contentSize);
			} catch (IOException e) {
				e.printStackTrace();
			}

			return CommonResultDto.success();
		}
	}

	// admin 연령등록 후 처리
	@PostMapping("/adminInsertAge.mdo")
	@ResponseBody
	public CommonResultDto adminInsertAge(@RequestPart("ageVo") AdminAgeVO ageVo,
			@RequestPart("imgFile") MultipartFile imgFile) {

		final UUID uuid = UUID.randomUUID();
		final String url = "age/" + uuid.toString() + ageVo.getMovie_age_img();
		final String path = AWSConfiguration.S3_URL;
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
				awsS3.upload(is, url, contentType, contentLength);

				System.out.println("등록 성공");

			} catch (Exception e) {
				e.printStackTrace();
			}

			return CommonResultDto.success();
		}

	}

	// admin 감독/배우 관리 페이지
	@RequestMapping("/adminManager.mdo")
	public String adminManager(AdminGroupVO vo, Model model, AdminActorVO actorVo) {
		model.addAttribute("groupList", adminMovieService.groupList());
		model.addAttribute("groupListCount", adminMovieService.groupList().size());
		model.addAttribute("actorList", adminMovieService.actorList());
		model.addAttribute("actorListCount", adminMovieService.actorList().size());
		return "/movie/admin_movie_manager";
	}

	// 배우 삭제
	@PostMapping("deleteActor.mdo")
	@ResponseBody
	public CommonResultDto deleteActor(@RequestBody AdminActorVO vo) {
		int num = adminMovieService.deleteActor(vo);
		if (num == 0)
			return CommonResultDto.fail();
		return CommonResultDto.success();
	}

	@GetMapping("/groupUpdate.mdo")
	public String groupView(@RequestParam("movie_group_code") int num, Model model) {
		AdminGroupVO groupVO = adminMovieService.groupView(num);
		model.addAttribute("groupList", groupVO);
		System.out.println("dedd" + num);
		return "/movie/admin_group_update";
	}

	// 그룹 수정
	@PostMapping("/groupUpdate.mdo")
	@ResponseBody
	public CommonResultDto updateGroup(@RequestBody AdminGroupVO vo, Model model, HttpSession session) {
		System.out.println("post닷");
		String regId = (String) session.getAttribute("adminID");
		vo.setReg_id(regId);
		int num = adminMovieService.updateGroup(vo);
		if (num == 0) {
			System.out.println("실패");
			return CommonResultDto.fail();
		} else {
			System.out.println("성공");
			return CommonResultDto.success();
		}
	}

	// 그룹 삭제
	@PostMapping("deleteGroup.mdo")
	@ResponseBody
	public CommonResultDto deleteGroup(@RequestBody AdminGroupVO vo) {

		int num = adminMovieService.deleteGroup(vo);

		if (num == 0)
			return CommonResultDto.fail();
		return CommonResultDto.success();
	}

	// 그룹 등록후 처리
	@PostMapping("/adminInsertGroup.mdo")
	@ResponseBody
	public String adminGroupInsert(@RequestBody AdminGroupVO vo) {
		int num = adminMovieService.insertGroup(vo);
		System.out.println("그룹 이름 : " + vo.getMovie_group_name());

		Gson gson = new Gson();
		JsonObject jsonObject = new JsonObject();

		if (num == 0) {
			System.out.println("등록 실패");
			jsonObject.addProperty("msg", "FAIL");
		} else {
			System.out.println("등록 성공");
			jsonObject.addProperty("msg", "SUCCESS");
		}

		String jsonResult = gson.toJson(jsonObject);

		return jsonResult;

	}

	// 그룹관리
	@RequestMapping("/adminGroup.mdo")
	public String adminGroup(AdminGroupVO vo) {
		System.out.println("TEST 2: ");
		System.out.println("그룹 이름 : " + vo.getMovie_group_name());
		return "/movie/admin_movie_group_register";
	}

	// 감독/배우관리
	@RequestMapping("/adminActor.mdo")
	public String adminActor(AdminGroupVO vo, Model model) {
		model.addAttribute("groupList", adminMovieService.groupList());
		return "/movie/admin_movie_actor_register";
	}

	// 배우 상세보기
	@RequestMapping("adminActortUpdate.mdo")
	public String adminActortUpdate(@RequestParam("movie_actor_code") int num, Model model) {
		AdminActorVO actorVo = adminMovieService.actorListInfo(num);
		List<AdminGroupVO> groupVo = adminMovieService.groupList();
		for (AdminGroupVO group : groupVo) {
			if (actorVo.getMovie_group_code() == group.getMovie_group_code()) {
				actorVo.setMovie_group_name(group.getMovie_group_name());
			}
		}
		model.addAttribute("groupList", groupVo);
		model.addAttribute("actorList", actorVo);
		return "/movie/admin_actor_detail";
	}

//	@RequestMapping("/actorUpdate.mdo")
//	public String actorUpdate(@RequestParam("movie_actor_code")int num,Model model) {
//		AdminActorVO actorVo = adminMovieService.actorListInfo(num);
//		List<AdminGroupVO> groupVo =adminMovieService.groupList();
//		for(AdminGroupVO group:groupVo ) {
//			if(actorVo.getMovie_group_code()==group.getMovie_group_code()) {
//				actorVo.setMovie_group_name(group.getMovie_group_name());
//			}
//		}
//		model.addAttribute("groupList",groupVo);
//		model.addAttribute("actorList", actorVo);
//		return "/movie/admin_actor_update";
//	}
//	

	@PostMapping("/actorUpdate.mdo")
	@ResponseBody
	public CommonResultDto actorUpdate(@RequestPart("actorVo") AdminActorVO actorVo,
			@RequestPart("imgFile") MultipartFile imgFile, HttpSession session) {
		// 이미지
		final FileUploadService.FileUploadResult fileResult = fileUploadService.fileUpload(imgFile, "actor/",
				actorVo.getMovie_actor_img());
		if (!fileResult.isSuccess())
			return CommonResultDto.fail();

		actorVo.setMovie_actor_img(fileResult.getUrl());
		actorVo.setReg_id((String) session.getAttribute("adminID"));

		final int num = adminMovieService.updateActor(actorVo);

		if (num == 0)
			return CommonResultDto.fail();
		return CommonResultDto.success();

	}

	@PostMapping("/statusChange.mdo")
	@ResponseBody
	public CommonResultDto statusChange(@RequestBody AdminMovieVO vo) {
		int num = adminMovieService.StatusChange(vo);

		if (num == 0)
			return CommonResultDto.fail();
		return CommonResultDto.success();
	}

	@PostMapping("/adminInsertActor.mdo")
	@ResponseBody
	public CommonResultDto adminInsertActor(@RequestPart("actorVo") AdminActorVO actorVo,
			@RequestPart("imgFile") MultipartFile imgFile, HttpSession session) {

		final FileUploadService.FileUploadResult fileResult = fileUploadService.fileUpload(imgFile, "parPeople/",
				actorVo.getMovie_actor_img());

		actorVo.setReg_id((String) session.getAttribute("adminId"));

		final int num = adminMovieService.insertActor(actorVo);
		System.out.println(actorVo.getMovie_actor_name());
		System.out.println(actorVo.getReg_id());

		if (num == 0)
			return CommonResultDto.fail();
		return CommonResultDto.success();

	}
}
