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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.dgv.web.admin.config.RequestUtils;
import com.dgv.web.admin.service.AdminMovieService;
import com.dgv.web.admin.service.AdminUserService;
import com.dgv.web.admin.service.FileUploadService;
import com.dgv.web.admin.vo.AdminAgeVO;
import com.dgv.web.admin.vo.AdminCouponVO;
import com.dgv.web.admin.vo.AdminEventVO;
import com.dgv.web.admin.vo.AdminMovieVO;
import com.dgv.web.admin.vo.AdminParUserEventVO;
import com.dgv.web.admin.vo.AdminTheaterVO;
import com.dgv.web.admin.vo.CommonResultDto;
import com.dgv.web.user.service.UserBoardService;
import com.dgv.web.user.service.UserService;
import com.dgv.web.user.vo.MyPagePaging;
import com.dgv.web.user.vo.MyPagePagingVO;
import com.dgv.web.user.vo.UserCouponUseVO;
import com.dgv.web.user.vo.UserDetailVO;
import com.dgv.web.user.vo.UserMapVO;
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
   
   @Autowired
   private AdminUserService adminUserService;
   
   
   @RequestMapping("/pointLog.do")
   public String pointLog(Model model) {
	   String id = RequestUtils.getUserId("userID");
	   List<UserReserveVO> userMyPointLog = userBoardService.userMyPointLog(id);
	
	   model.addAttribute("userMyPointLog",userMyPointLog);
	   return"/myPage/user_myPage_pointLog";
   }
  
   @RequestMapping("/myReserveMovieDetail.do")
	public String myReserveMovieDetail(@RequestParam("reserve_code")int num, Model model,UserVO vo){
	   String id = RequestUtils.getUserId("userID");
	   UserReserveVO reserveVo = userBoardService.userReserveDetailView(num);
	   AdminMovieVO movieVo = userBoardService.movieList(reserveVo.getMovie_num());
	   AdminTheaterVO thVo = adminMovieService.theaterListInfo(reserveVo.getTheater_code());
	   UserMapVO mapVo = userBoardService.mapList(reserveVo.getRegion_code());
	
	   reserveVo.setMovie_title(movieVo.getMovie_title());
	   reserveVo.setMovie_img(movieVo.getMovie_img());
	   reserveVo.setTheater_name(thVo.getTheater_name());
	   reserveVo.setRegion_name(mapVo.getMap_name());
			
	   model.addAttribute("reserveVo",reserveVo);
	   
		return "/myPage/user_myPage_reserveDetail";
	}
    
   @RequestMapping("/myEventJoinDetail.do")
   public String myEventJoinDetail() {
	   return "/myPage/user_myPage_event_detail";
   }
   
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
   public String myPage(Model model,UserVO vo , MyPagePaging page) {
	   

		String id = RequestUtils.getUserId("userID");
		
		int total= userBoardService.myReserveCount(id);
		//user_num  추출
		vo.setUser_id(id);
		UserVO user = userService.login(vo);
		
		System.out.println("id "+id);
		// 예매내역 뽑기
		UserVO userVo=  adminUserService.userNumList(user.getUser_num());
//		List<UserReserveVO> myReserveList = adminMovieService.userReserveList(userVo.getUser_id());
		page.setUser_id(id);
		List<UserReserveVO> myReserveList = userBoardService.myPagePaging(page);
		List<AdminMovieVO> movieList = adminMovieService.movieList();
		for(AdminMovieVO movieVo:movieList ) {
			for(UserReserveVO reserveVo :myReserveList ) {
				if(movieVo.getMovie_num() == reserveVo.getMovie_num()) {
					UserMapVO mapVo = userBoardService.mapList(reserveVo.getRegion_code());
					reserveVo.setMovie_title(movieVo.getMovie_title());
					reserveVo.setTheater_name(mapVo.getMap_name());					
				}				
			}
		}
		//예매 페이징
		MyPagePagingVO pageMake = new MyPagePagingVO(total, page);
		model.addAttribute("pageMake",pageMake);
		
		//나의 이벤트 내역 
		List<AdminEventVO> parEventList = userBoardService.myJoinEvent(user.getUser_num());
		
		model.addAttribute("parEventList",parEventList);
		model.addAttribute("myReserveList",myReserveList);
		model.addAttribute("userVo",userVo);
		model.addAttribute("MyPageQnaOneList", userService.MyPageQnaOneList(id));
		model.addAttribute("MyPageQnaCount",userService.MyPageQnaOneList(id).size());
      return "/myPage/user_myPage";
   }
   
   @RequestMapping("/myPage_reserve.do")
   public String myPage_reserve(Model model,UserVO vo, MyPagePaging page) {
	   	String id =RequestUtils.getUserId("userID");
		int total= userBoardService.myReserveCount(id);
	
		//user_num  추출
		vo.setUser_id(id);
		UserVO user = userService.login(vo);
		
		System.out.println("id "+id);
		// 예매내역 뽑기
//		UserVO userVo=  adminUserService.userNumList(user.getUser_num());
//		List<UserReserveVO> myReserveList = adminMovieService.userReserveList(userVo.getUser_id());
		page.setUser_id(id);
		List<UserReserveVO> myReserveList = userBoardService.myPagePaging(page);
		List<AdminMovieVO> movieList = adminMovieService.movieList();
	  
	     DecimalFormat formatter =new DecimalFormat("###,###,###");
	     
	     for(AdminMovieVO movieVo:movieList ) {
				for(UserReserveVO reserveVo :myReserveList ) {
					if(movieVo.getMovie_num() == reserveVo.getMovie_num()) {
						UserMapVO mapVo = userBoardService.mapList(reserveVo.getRegion_code());
						reserveVo.setMovie_title(movieVo.getMovie_title());
						reserveVo.setTheater_name(mapVo.getMap_name());		
				    	String price = formatter.format(reserveVo.getReserve_price());
				    	reserveVo.setFomatter_price(price);

					}				
				}
			}
	 	
	     //예매율 
		double totalCount = adminMovieService.totalSum();
		List<UserReserveVO> reserveList = adminMovieService.totalPeopleCount();
		for(UserReserveVO reserveVo : reserveList) {
			for(AdminMovieVO movieVo : movieList) {
				if(reserveVo.getMovie_num()==movieVo.getMovie_num()) {				
					double totalPeople =  reserveVo.getTotal_people();
					double result =totalPeople/totalCount*100;
					String totalResult = String.format("%.1f", result);
					movieVo.setReservationRate(totalResult);
				}
			}
		}
	     MyPagePagingVO pageMake = new MyPagePagingVO(total, page);
	     
	     model.addAttribute("pageMake",pageMake);
	     model.addAttribute("userReserveList",myReserveList);
  
	     for(AdminMovieVO movieVo:movieList) {
	    	 AdminAgeVO ageVO = adminMovieService.ageListInfo(movieVo.getMovie_age_code());
	    	 movieVo.setAge_img(ageVO.getMovie_age_img());
	     }
	     model.addAttribute("movieList",movieList);
	     
      return "/myPage/user_myPage_reserve";
   }
   //나의 쿠폰 상세보기 
   @RequestMapping("/userMyCouponDetail.do")
   public String userMyCouponDetail(@RequestParam("coupon_num") int num,Model model) {
	   AdminCouponVO couponVo = userBoardService.myCouponVo(num);
	   
	   model.addAttribute("couponVo",couponVo);
	   
	   return "/myPage/user_myPage_couponDetail";
   }
   
   //나의 쿠폰 목록
   @RequestMapping("/myPage_coupon.do")
   public String myPage_coupon(Model model, UserCouponUseVO cuVo) {
	  String userId = RequestUtils.getUserId("userID");
	  cuVo.setUser_id(userId);
	  List<UserCouponUseVO> CouponUseSelect = userBoardService.CouponUseSelect(cuVo);
	  for(UserCouponUseVO couUseVo:CouponUseSelect ) {
		  AdminCouponVO couponVo = userBoardService.myCouponVo(couUseVo.getCoupon_num()); 
		  couUseVo.setCoupon_name(couponVo.getCoupon_name());
		  couUseVo.setCoupon_date(couponVo.getCoupon_date());
	  }
	  
	  model.addAttribute("CouponUseSelect",CouponUseSelect);
	   
      return "/myPage/user_myPage_coupon";
   }
   
   @RequestMapping("/myPage_event.do")
   public String myPage_event(Model model,UserVO vo ) {
	   
	   String id = RequestUtils.getUserId("userID");
		vo.setUser_id(id);
		
		UserVO user = userService.login(vo);
		List<AdminParUserEventVO> parEventList = userBoardService.participantList(user.getUser_num());
		for(AdminParUserEventVO parVo : parEventList) {
			AdminEventVO eventVo = userBoardService.eventNumVo(parVo.getEvent_code());
			parVo.setEvent_title(eventVo.getEvent_title());
			parVo.setEvent_end_date(eventVo.getEnd_date());
			parVo.setEvent_status(eventVo.getEvent_status());
			parVo.setEvent_check(eventVo.getEvent_check());
		}
		
		model.addAttribute("parEventList",parEventList);
      return "/myPage/user_myPage_event";
   }
   
   // 회원정보 수정 비밀번호 확인페이지
   @RequestMapping("/myPage_checkData.do")
   public String myPage_checkData() {
      return "/myPage/user_myPage_checkData";
   }
   
   @RequestMapping("/myPage_userMovie.do")
   public String myPage_userMovie(Model model,MyPagePaging page, UserVO vo) {
	   
	   String userId = RequestUtils.getUserId("userID");
	   int totalCount= userBoardService.myReserveCount(userId);
				
		vo.setUser_id(userId);
		UserVO user = userService.login(vo);
		
	//   List<UserReserveVO> myMovieList = userBoardService.userIdMovieReserveList(userId);
	   page.setUser_id(userId);
	   List<UserReserveVO> myMovieList = userBoardService.myPagePaging(page);
	   List<AdminMovieVO> movieList = adminMovieService.movieList();
	   
	   for(AdminMovieVO movieVo : movieList) {
		   for(UserReserveVO reserveVo : myMovieList) {
			    if(movieVo.getMovie_num()==reserveVo.getMovie_num()) {
					   reserveVo.setMovie_title(movieVo.getMovie_title());
					   reserveVo.setMovie_title_en(movieVo.getMovie_title_en());
					   reserveVo.setMovie_img(movieVo.getMovie_img()); 
					   
					   AdminTheaterVO theaterVo = userBoardService.theaterListInfo(reserveVo.getTheater_code());
					   reserveVo.setTheater_name(theaterVo.getTheater_name());
					   
					   UserMapVO mapVo = userBoardService.mapList(theaterVo.getRegion_code());
					   reserveVo.setRegion_name(mapVo.getMap_name());
					   
					   int total = reserveVo.getReserve_basic()+reserveVo.getReserve_student()+reserveVo.getReserve_old();
					   reserveVo.setTotal_people(total);
					    
					   AdminAgeVO ageVo = adminMovieService.ageListInfo(movieVo.getMovie_age_code());
					   reserveVo.setAge_name(ageVo.getMovie_age_name());
			    }
		    }
	   }
	   MyPagePagingVO pageMake = new MyPagePagingVO(totalCount, page);
	     
	   model.addAttribute("pageMake",pageMake);

	   model.addAttribute("myMovieList",myMovieList);
	   model.addAttribute("myMovieListCount",totalCount);
	   
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