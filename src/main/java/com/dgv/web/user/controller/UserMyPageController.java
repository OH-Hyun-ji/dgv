package com.dgv.web.user.controller;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dgv.web.admin.config.RequestUtils;
import com.dgv.web.admin.service.AdminMovieService;
import com.dgv.web.admin.service.AdminUserService;
import com.dgv.web.admin.service.FileUploadService;
import com.dgv.web.admin.vo.AdminAgeVO;
import com.dgv.web.admin.vo.AdminMovieVO;
import com.dgv.web.admin.vo.CommonResultDto;
import com.dgv.web.user.service.UserBoardService;
import com.dgv.web.user.service.UserService;
import com.dgv.web.user.vo.UserDetailVO;
import com.dgv.web.user.vo.UserReserveVO;
import com.dgv.web.user.vo.UserVO;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

import retrofit2.http.Multipart;

@Controller
public class UserMyPageController {
   
   @Autowired
   private UserService userService;
   @Autowired
   private UserBoardService userBoardService;
   
   @Autowired
   private AdminMovieService adminMovieService;
   
   @Autowired
   private FileUploadService fileUploadService;
   
   @PostMapping("/userMyPageTopInfo.do")
   @ResponseBody
   public String userMyPageTopInfo(@RequestBody UserVO vo,Model model) {
	   UserVO userVo = userService.MyUserList(vo.getUser_id());
	   model.addAttribute("userVo",userVo);
	   Gson gson = new Gson();
	   String userInfo = gson.toJson(userVo);
	   return userInfo;
   }
   @PostMapping("/profileImgInsert.do")
   @ResponseBody
   public CommonResultDto profileImgInsert(HttpSession session,@RequestPart("profileImg") UserDetailVO vo,@RequestPart("imgFile") MultipartFile imgFile) {
	   final FileUploadService.FileUploadResult fileResult = fileUploadService.fileUpload(imgFile, "profile/", vo.getUser_img());
	   
	   if(!fileResult.isSuccess()) {
		   return CommonResultDto.fail();
	   }
	   String img = (String) session.getAttribute("userImg");
	   System.out.println("img before: "+img);
	   vo.setUser_img(fileResult.getUrl());
	   String userId =RequestUtils.getUserId("userID");
	   UserVO userVo = userService.MyUserList(userId);
	   vo.setUser_num(userVo.getUser_num());
	   int num = userService.userProfileImg(vo);
	   RequestUtils.setUserImg(vo.getUser_img());
	   String img1 = (String) session.getAttribute("userImg");
	   System.out.println("img after : "+img);
	   if(num ==0)
		   return CommonResultDto.fail();
	   return CommonResultDto.success();
   }
   
   //마이페이지 프로필 수정
   @RequestMapping("/myProfile.do")
   public String myProfile() {
	   return "/myPage/user_myPage_profile";
   }
   //마이페이지 나의 문의 내역
   @RequestMapping("/myPage.do")
   public String myPage(Model model,HttpServletRequest request) {
	   HttpSession session = request.getSession();
		System.out.println("session.getId() =" + session.getAttribute("userID"));
		System.out.println("session.getId() =" +session.getAttributeNames());
		String id = (String) session.getAttribute("userID");
		System.out.println("id "+id);
		model.addAttribute("MyPageQnaOneList", userService.MyPageQnaOneList(id));
		model.addAttribute("MyPageQnaCount",userService.MyPageQnaOneList(id).size());
  
      return "/myPage/user_myPage";
   }
   
   @RequestMapping("/myPage_reserve.do")
   public String myPage_reserve(Model model) {
	   	String userId=RequestUtils.getUserId("userID");
	     List<UserReserveVO> userReserveList = userBoardService.userReserveMyPage(userId);
	  
	     DecimalFormat formatter =new DecimalFormat("###,###,###");
	     
	     for(UserReserveVO userReserveVO :userReserveList) {
	    	 AdminMovieVO movieVo = userBoardService.movieList(userReserveVO.getMovie_num());
	    	 userReserveVO.setMovie_title(movieVo.getMovie_title());
	    	 String price = formatter.format(userReserveVO.getReserve_price());
	    	 userReserveVO.setFomatter_price(price);
	     }
	     model.addAttribute("userReserveList",userReserveList);
	     
	     List<AdminMovieVO> movieList = adminMovieService.movieList();
	  
	     for(AdminMovieVO movieVo:movieList) {
	    	 AdminAgeVO ageVO = adminMovieService.ageListInfo(movieVo.getMovie_age_code());
	    	 movieVo.setAge_img(ageVO.getMovie_age_img());
	     }
	     model.addAttribute("movieList",movieList);
	     
      return "/myPage/user_myPage_reserve";
   }
   
   @RequestMapping("/myPage_coupon.do")
   public String myPage_coupon() {
      return "/myPage/user_myPage_coupon";
   }
   
   @RequestMapping("/myPage_event.do")
   public String myPage_event() {
      return "/myPage/user_myPage_event";
   }
   
   // 회원정보 수정 비밀번호 확인페이지
   @RequestMapping("/myPage_checkData.do")
   public String myPage_checkData() {
      return "/myPage/user_myPage_checkData";
   }
   
   @RequestMapping("/myPage_userMovie.do")
   public String myPage_userMovie() {
      return "/myPage/user_myPage_userMovie";
   }
   
   // 객체 생성, 주입
   @Inject
	public UserMyPageController(UserService userService) {
		this.userService = userService;
	}

	// 비밀번호 확인
	@PostMapping("/myPage_checkData.do")
	@ResponseBody
	public CommonResultDto loginPOST(@RequestBody UserVO vo, HttpSession session, Model model) {
		System.out.println("id : " + vo.getUser_id());
		System.out.println("pw : " + vo.getUser_pw());
		UserVO userId = userService.login(vo);

		System.out.println(BCrypt.checkpw(vo.getUser_pw(), userId.getUser_pw()));
		System.out.println("TEST 1 : " + userId.getUser_pw());
		
		if (vo.getUser_id().equals(userId.getUser_id()) && BCrypt.checkpw(vo.getUser_pw(), userId.getUser_pw())) {
			System.out.println("비밀번호 확인.");
			session.setAttribute("userID", userId.getUser_id());
			return CommonResultDto.success();
		} else {
			System.out.println("비밀번호를 다시 확인해 주세요.");
			return CommonResultDto.fail();
		}
	
	}
   
   
   
   //회원 개인정보변경 불러오기 부분
   @RequestMapping("/myPage_myData.do")
   public String myPage_myData(Model model,HttpServletRequest request) {
      
      HttpSession session = request.getSession();
      String id= (String) session.getAttribute("userID");
      System.out.println("세션" + id);
//      userService.MyUserData(id); -> 이거로 세션아이디에 맞는 정보를 받아오고 
//      UserVO userVo= (UserVO) userService.MyUserData(id);
      UserVO vo = userService.MyUserData(id);
      model.addAttribute("userData", vo);
      return "/myPage/user_myPage_myData";
   }

   //회원정보 수정
   @RequestMapping("/updateUser.do")
   @ResponseBody
	public CommonResultDto updateUser(@RequestBody UserVO userVO, RedirectAttributes redirectAttributes, HttpSession session){
		String hashedPw = BCrypt.hashpw(userVO.getUser_pw(), BCrypt.gensalt());
		userVO.setUser_pw(hashedPw);
		
		userVO.setUser_id((String) session.getAttribute("userID"));
		int num =userService.updateUser(userVO);
		redirectAttributes.addFlashAttribute("msg", "UPDATED");
		System.out.println("num =: "+ num);
		
		if(num ==0 ) {
			System.out.println("회원정보 수정 실패!!");
			return CommonResultDto.fail();
		}else {
			System.out.println("회원정보 수정 성공!!");
			return CommonResultDto.success();
		}
   }
   
   
   //회원 탈퇴
   @RequestMapping("/deleteUser.do")
   @ResponseBody
	public CommonResultDto deleteUser(@RequestBody UserVO userVO,HttpSession session){
		userVO.setUser_id((String) session.getAttribute("userID"));
		int num =userService.deleteUser(userVO);
		
		System.out.println("num =: "+ num);
		
		if(num == 0 ) {
			System.out.println("삭제 실패!!");
			return CommonResultDto.fail();
		}else {
			System.out.println("삭제 성공!!");
			return CommonResultDto.success();
		}
   }
}