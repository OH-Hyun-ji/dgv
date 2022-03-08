package com.dgv.web.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dgv.web.user.vo.UserReserveVO;

@Controller
public class UserSeatController {

	@RequestMapping("/seatReservation.do")
	public String seatView() {
		return "/seat/user_seat";

	}
//	
//	@PostMapping("/reserveSeat.mdo")
//	@ResponseBody
//	public String reserveBasic(@RequestBody UserReserveVO vo ) {
//		
//	}
}
