package com.dgv.web.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminLoginController {

	@RequestMapping("/login.mdo")
	public String home() {
		System.out.println("dddddd");
		
		
	return "/login/admin_login";
	}
}
