package com.dgv.web.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserEventController {
	
	@RequestMapping("/event.do")
	public String event() {
		return "/event/user_event";
	}
}
