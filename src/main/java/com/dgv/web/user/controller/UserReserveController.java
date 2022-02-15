package com.dgv.web.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserReserveController {

	@RequestMapping("/movieReserve.do")
	public String movieReserveView() {
		return "/reserve/user_reserve";
	}
	
}
