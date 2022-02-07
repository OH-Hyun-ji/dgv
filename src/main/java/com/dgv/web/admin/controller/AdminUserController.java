package com.dgv.web.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminUserController {

	@RequestMapping("/userList.mdo")
	public String userList() {
		return "/user/admin_user_list";
	}
}
