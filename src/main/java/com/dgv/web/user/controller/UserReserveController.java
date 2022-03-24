package com.dgv.web.user.controller;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
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
import com.dgv.web.admin.config.RequestUtils;
import com.dgv.web.admin.service.AdminMovieService;
import com.dgv.web.admin.service.AdminTheaterService;
import com.dgv.web.admin.vo.AdminAgeVO;
import com.dgv.web.admin.vo.AdminCouponVO;
import com.dgv.web.admin.vo.AdminGenreVO;
import com.dgv.web.admin.vo.AdminMovieVO;
import com.dgv.web.admin.vo.AdminRegionVO;
import com.dgv.web.admin.vo.AdminSeatVO;
import com.dgv.web.admin.vo.AdminTheaterVO;
import com.dgv.web.admin.vo.AdminTimeVO;
import com.dgv.web.admin.vo.CommonResultDto;
import com.dgv.web.user.service.UserBoardService;
import com.dgv.web.user.service.UserService;
import com.dgv.web.user.vo.UserCouponUseVO;
import com.dgv.web.user.vo.UserMapVO;
import com.dgv.web.user.vo.UserMoiveImgVO;
import com.dgv.web.user.vo.UserReserveVO;
import com.dgv.web.user.vo.UserVO;
import com.google.gson.Gson;
import com.siot.IamportRestClient.response.PaymentCancelDetail;


@Controller
public class UserReserveController {

	@Autowired
	private AdminMovieService adminMovieService;
	
	@Autowired
	private AdminTheaterService adminTheaterService;
	
	@Autowired
	private UserBoardService userBoardService;
	
	@Autowired
	private UserService userService;
	
	//pdf

	@RequestMapping("/pdfDownload.do")
	public String pdfDownload(@RequestParam("reserve_merchant_uid") String merchantUid,Model model) {

		List<String> list = new ArrayList<String>();
//		list.add("Java");
//		list.add("파이썬");
//		list.add("R");
//		list.add("C++");
//		list.add("자바스크립트");
//		list.add("Ruby");
//		list.add("스칼라");
//		list.add("클로져");
//		list.add("자바");
//		
//		//뷰에게 전달할 데이터 저장
//		model.addAttribute("list",list);
	
		
		UserReserveVO reserveVo = userBoardService.userReserveFinish(merchantUid);
		AdminMovieVO movieVo = userBoardService.movieList(reserveVo.getMovie_num());
		reserveVo.setMovie_title(movieVo.getMovie_title());
		DecimalFormat formatter = new DecimalFormat("$###,###,###");
		String price = formatter.format(reserveVo.getReserve_price());
		reserveVo.setFomatter_price(price);
		
		list.add("회원ID : "+reserveVo.getUser_id());
		list.add("예매번호 : "+reserveVo.getReserve_merchant_uid());
		list.add("영화제목 : "+reserveVo.getMovie_title());
		list.add("결제금액 : "+reserveVo.getFomatter_price());
		list.add("결제수단 : "+reserveVo.getReserve_method());
		if(reserveVo.getReserve_apply_num() == "" ||reserveVo.getReserve_apply_num() == null ||reserveVo.getReserve_apply_num().length()==0 ) {
			reserveVo.setReserve_apply_num("카드결제 x");
		}
		list.add("카드 승인번호 : "+reserveVo.getReserve_apply_num());
		list.add("결제일 : "+reserveVo.getReserve_date());
		
		
		model.addAttribute("list",list);
		
		//출력할 뷰 이름 리턴
		return "pdf";
	}
	
	
	
	
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
	//전체 눌렀을때
	@PostMapping("/movieAllChartView.do")
	@ResponseBody
	public String movieAllChartView(@RequestBody AdminMovieVO vo) {
		List<AdminMovieVO> movieList =adminMovieService.movieList();
		List<AdminAgeVO> ageList = adminMovieService.ageList();
		for(AdminMovieVO movieVo: movieList) {
			for(AdminAgeVO ageVo:ageList) {
				if(movieVo.getMovie_age_code() == ageVo.getMovie_age_num()) {
					movieVo.setAge_img(ageVo.getMovie_age_img());
				}
			}
		}
		Gson gson = new Gson();
		String movieTotalList = gson.toJson(movieList);
		
		return movieTotalList;
	}
	
	//아트 하우스 눌렀을때
	@PostMapping("/artChatList.do")
	@ResponseBody
	public String userArtHouseList(@RequestBody AdminMovieVO vo) {
		
		
		List<AdminMovieVO> userArtHouseList = userBoardService.userArtHouseList();
		List<AdminAgeVO> ageList = adminMovieService.ageList();
		
		for(AdminMovieVO movieVo :userArtHouseList) {
			for(AdminAgeVO ageVo:ageList) {
				if(movieVo.getMovie_age_code()==ageVo.getMovie_age_num()) {
					movieVo.setAge_img(ageVo.getMovie_age_img());
				}
			}
		}
		Gson gson = new Gson();
		String artList = gson.toJson(userArtHouseList);
		
		return artList;
	}
	
	@PostMapping("/seat.do")
	public String serat(@ModelAttribute UserReserveVO vo ,Model model) {
		
		System.out.println("post 방식");
		return "/seat/user_seat";
	}
	
	@PostMapping("/reserveSeat.do")
	public String reserveSeat(@ModelAttribute("reserveVo") UserReserveVO vo ,Model model,UserReserveVO reserveVO,UserCouponUseVO couponVo) {
			//유저정보 
			String userId =RequestUtils.getUserId("userID");
			UserVO userVo = userService.MyUserList(userId);
			model.addAttribute("userVo",userVo);
			
			//쿠폰 목록
			couponVo.setUser_id(userId);
			List<UserCouponUseVO> couponList = userBoardService.CouponUseSelect(couponVo);
			
			for(UserCouponUseVO coupon : couponList) {				
				AdminCouponVO couponInfo = userBoardService.myCouponVo(coupon.getCoupon_num());
				coupon.setCoupon_name(couponInfo.getCoupon_name());
				
			}
			model.addAttribute("couponList",couponList);
			
		
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
			//예약된좌석 
			reserveVO.setRegion_code(theaterVo.getRegion_code());
			reserveVO.setTheater_code(theaterVo.getTheater_code());
			
			List<String> reserveL = new ArrayList<String>();
			List<UserReserveVO> reserveVo = userBoardService.userReserveSeatStatus(reserveVO);
			for(UserReserveVO reser: reserveVo) {
				String[] reserveArr=(reser.getSeat_reservation()).split(",");
				for(int i=0;i<reserveArr.length;i++) {
					System.out.println("reserveArr : "+reserveArr[i]);
					reserveL.add(reserveArr[i]);
				}
				
			}
		
			
			model.addAttribute("reserveVo",gson.toJson(reserveL));
			System.out.println("/// : " +vo.toString());			
		return "/seat/user_seat";
	}
	
	@PostMapping("/userReservation.do")
	@ResponseBody
	public CommonResultDto userReservation(@RequestBody UserReserveVO reserveVo) {
	
		int num = userBoardService.userReserveInsert(reserveVo);
		
		if(num ==0)
			return CommonResultDto.fail();
		return CommonResultDto.success();
	}
	

	
	@PostMapping("/theaterList.do")
	@ResponseBody
	public String theaterList(@RequestBody AdminTheaterVO theaterVo) {
		List<AdminTheaterVO> theaterList = userBoardService.theaterCodeList(theaterVo.getRegion_code());
		List<AdminTheaterVO> theaterL = new ArrayList<AdminTheaterVO>();
		List<AdminTimeVO> timeList = new ArrayList<AdminTimeVO>();
		System.out.println("이건 나오나요");
		
		for(AdminTheaterVO thVo : theaterList) {
			System.out.println("현재 상영관  "+ thVo.getTheater_name());
			AdminTimeVO  timeVo= userBoardService.timeStatusList(thVo.getTheater_code());
			System.out.println("bbb ");
			AdminSeatVO seatVo = userBoardService.seatListInfo(thVo.getTheater_code());
			thVo.setMovie_time_code(timeVo.getMovie_time_code());
			thVo.setMovie_time_start(timeVo.getMovie_time_start());
			
			thVo.setSeat_status(seatVo.getSeat_status());
			System.out.println("영화 시간 : "+thVo.getMovie_time_start());
		
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
	
	@RequestMapping("userReserveResult.do")
	public String userReserveResult(@RequestParam("reserve_merchant_uid") String merchantUid , Model model) {
		UserReserveVO reserveVo = userBoardService.userReserveFinish(merchantUid);
		AdminMovieVO movieVo = userBoardService.movieList(reserveVo.getMovie_num());
		reserveVo.setMovie_title(movieVo.getMovie_title());
		
		model.addAttribute("reserveVo",reserveVo);
		
		
		return "/reserve/user_reserve_resultView";
	}

}
