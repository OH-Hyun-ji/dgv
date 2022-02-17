package com.dgv.web.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserLoginFormController {

	@RequestMapping("/login.do")
	public String login() {
		return"/login/user_login";
	}
}
