package com.dgv.web.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserJoinController {
	
	@RequestMapping("/join.do")
	public String join() {
		return "/join/user_join";
	}
}
