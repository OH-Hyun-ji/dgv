package com.dgv.web.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserMainController {

	@RequestMapping("/dgvMain.do")
	public String dgvMain() {
		return"/main/user_main";
	}
}
