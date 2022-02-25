package com.dgv.web.admin.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dgv.web.admin.service.AdminUserService;
import com.dgv.web.user.vo.UserVO;

@Controller
public class AdminUserController {

	@Autowired
	private AdminUserService adminUserService;
	
	@RequestMapping("/userList.mdo")
	public String userList(UserVO vo, Model model) {
		model.addAttribute("userList" ,adminUserService.userList());
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
}
