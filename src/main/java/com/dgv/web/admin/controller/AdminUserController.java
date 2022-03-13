package com.dgv.web.admin.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dgv.web.admin.service.AdminUserService;
import com.dgv.web.admin.vo.AdminRankVO;
import com.dgv.web.admin.vo.CommonResultDto;
import com.dgv.web.user.service.UserService;
import com.dgv.web.user.vo.UserDetailVO;
import com.dgv.web.user.vo.UserVO;

@Controller
public class AdminUserController {

	@Autowired
	private AdminUserService adminUserService;
	
	
	@RequestMapping("/userList.mdo")
	public String userList(UserVO vo, Model model, HttpSession session) {
		model.addAttribute("userList" ,adminUserService.userList());
		model.addAttribute("userListCount", adminUserService.userList().size());
		return "/user/admin_user_list";
	}
	
	@PostMapping("/userDelete.mdo")
	@ResponseBody
	public int userDelete(@RequestBody UserVO vo) {
		int num = adminUserService.userDelete(vo);
		System.out.println("num" + num);
		System.out.println("쿄쿄 : "+vo.getUser_id());
		
		if(num ==0) {
			System.out.println("삭제 실패!!");
			return num;
		}else {
			System.out.println("삭제성공 !!");
			return num;
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
