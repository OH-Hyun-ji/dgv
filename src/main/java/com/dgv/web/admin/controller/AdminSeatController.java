package com.dgv.web.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminSeatController {

	@RequestMapping("/adminSeat.mdo")
	public String adminSeat() {
		return "/movie/admin_movie_seat";
	}
	
}
