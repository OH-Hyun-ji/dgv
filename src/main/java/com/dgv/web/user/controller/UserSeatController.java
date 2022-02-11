package com.dgv.web.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserSeatController {

	@RequestMapping("/seatReservation.do")
	public String seatView() {
		return "/seat/user_seat";
	}
	
}
