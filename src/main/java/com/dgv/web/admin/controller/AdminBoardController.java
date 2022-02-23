package com.dgv.web.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminBoardController {

	@RequestMapping("/adminNotice.mdo")
	public String adminNotice() {
		return "/board/admin_board_notice";
	}
	//공지사항 등록창 
	@RequestMapping("/adminNoticeRegister.mdo")
	public String adminNoticeRegister() {
		return "/board/admin_board_notice_register";
	}
	
	
	@RequestMapping("/adminEnquriy.mdo")
	public String adminEnquriy() {
		return "/board/admin_board_enquriy";
	}
	
	@RequestMapping("/adminAnswerOk.mdo")
	public String adminAnswer() {
		return "/board/admin_board_answerOk";
	}
	
	@RequestMapping("/adminChart.mdo")
	public String adminChart() {
		return "/movie/admin_movie_chart";
	}
	
	@RequestMapping("/adminBest.mdo")
	public String adminBest() {
		return "/movie/admin_movie_best";
	}
}
