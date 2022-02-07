package com.dgv.web.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminUserRankController {

	@RequestMapping("/userRank.mdo")
	public String userRank() {
		return "/user/admin_user_rank";
	}
	
	@RequestMapping("/userRankRegister.mdo")
	public String userRankRegister() {
		return "/user/admin_user_rank_register";
	}
}
