package com.dgv.web.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
}
