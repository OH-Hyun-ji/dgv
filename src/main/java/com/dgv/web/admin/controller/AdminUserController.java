package com.dgv.web.admin.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dgv.web.admin.common.SMSMessage;
import com.dgv.web.admin.service.AdminMovieService;
import com.dgv.web.admin.service.AdminUserService;
import com.dgv.web.admin.vo.AdminMovieVO;
import com.dgv.web.admin.vo.AdminRankVO;
import com.dgv.web.admin.vo.AdminSMSListDTO;
import com.dgv.web.admin.vo.AdminSMSVO;
import com.dgv.web.admin.vo.CommonResultDto;
import com.dgv.web.user.service.UserBoardService;
import com.dgv.web.user.service.UserService;
import com.dgv.web.user.vo.UserDetailVO;
import com.dgv.web.user.vo.UserMapVO;
import com.dgv.web.user.vo.UserReserveVO;
import com.dgv.web.user.vo.UserVO;
import com.google.gson.Gson;

@Controller
public class AdminUserController {

	@Autowired
	private AdminUserService adminUserService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private UserBoardService userBoardService;
	
	@Autowired
	private AdminMovieService adminMovieService;
	
	@RequestMapping("groupSMS.mdo")
	public String groupGetSMS(String phoneList) {
		System.out.println("adminSMSListDTO  "+ phoneList);
		return "/user/admin_groupSMS";
	}
	
	@PostMapping("groupSMS.mdo")
	@ResponseBody
	public void groupSMS(@RequestBody AdminSMSVO vo) {
		System.out.println("adminSMSListDTO 오이가 없네 + ");
		
		
		String[] PhoneList = vo.getSms_user().split(",");
		
		
		SMSMessage smsMessage = new SMSMessage();
		
		for(String userPhone :PhoneList) {
			String[] arr = userPhone.split("-");
			String phone ="";
			for(String arrElement : arr) {
				phone +=arrElement;
				
			}
			smsMessage.sendGroup(vo.getSms_title(), vo.getSms_text(), phone);			
		}
		System.out.println("전송완료됬을걸???");
		
	}
	
	@RequestMapping("/userDetail.mdo")
	public String userDetail(@RequestParam("user_num") int num, Model model) {
		UserDetailVO detailVo = userService.userDetailVo(num);
		UserVO userVo=  adminUserService.userNumList(num);
		List<UserReserveVO> myReserveList = adminMovieService.userReserveList(userVo.getUser_id());
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
		
		model.addAttribute("myReserveList",myReserveList);
		model.addAttribute("userVo",userVo);
		model.addAttribute("detailVo",detailVo);
		
		return "/user/admin_user_details";
	}
	@PostMapping("/userStatusChange.mdo")
	@ResponseBody
	public CommonResultDto userStatusChange(@RequestBody UserVO vo) {
		int num = adminUserService.userStatus(vo);
		
		if(num==0)
			return CommonResultDto.fail();
		return CommonResultDto.success();
	}
	
	@RequestMapping("/userList.mdo")
	public String userList(UserVO vo, Model model) {
		List<UserVO> userList =adminUserService.userList();
		for(UserVO user :userList ) {
			for(UserDetailVO detailVo : user.getDetailVO()) {
				user.setUser_rank(detailVo.getUser_rank());
				user.setUser_point(detailVo.getUser_point());
			}
		}
		
		model.addAttribute("userList" ,userList);
		model.addAttribute("userListCount", adminUserService.userList().size());
		return "/user/admin_user_list";
	}
	
	@PostMapping("/userDelete.mdo")
	@ResponseBody
	public CommonResultDto userDelete(@RequestBody UserVO vo) {
		int num = adminUserService.userDelete(vo);
		System.out.println("num" + num);
		System.out.println("쿄쿄 : "+vo.getUser_id());
		
		if(num ==0) {
			System.out.println("삭제 실패!!");
			return CommonResultDto.fail();
		}else {
			System.out.println("삭제성공 !!");
			return CommonResultDto.success();
		}
		//return "/user/admin_user_list";
	}
	@RequestMapping("/rankChoice.mdo")
	public String rankChoice(@RequestParam("user_num")int num ,Model model)  {
		List<AdminRankVO> rankList = adminUserService.rankList();
		model.addAttribute("rankList",rankList);
		model.addAttribute("userNum",num);
		return  "/user/admin_user_rank_choice";
	}
	
	@PostMapping("/userRankUpdate.mdo")
	@ResponseBody
	public CommonResultDto userRankUpdate(@RequestBody UserDetailVO detailvo) {
		AdminRankVO vo = adminUserService.rankOneSelect(detailvo.getRank_code());
		detailvo.setUser_rank(vo.getRank_name());
		int num = adminUserService.userRankUpdate(detailvo);
		
		if(num ==0)
			return CommonResultDto.fail();
		return CommonResultDto.success();
		
	}
}
