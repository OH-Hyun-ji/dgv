package com.dgv.web.user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dgv.web.admin.vo.AdminEventVO;
import com.dgv.web.user.service.UserBoardService;

@Controller
public class UserEventController {
	
	@Autowired
	private UserBoardService userBoardService;
	
	@RequestMapping("/event.do")
	public String event(Model model) {
		 List<AdminEventVO> eventList = userBoardService.eventList();
		 model.addAttribute("eventList",eventList);
		return "/event/user_event";
	}
	
	@RequestMapping("/eventWinner.do")
	public String eventWinner() {
		return "/event/event_winner";
	}
	
	@RequestMapping("/eventEnd.do")
	public String eventEnd() {
		return "/event/event_end";
	}
}
