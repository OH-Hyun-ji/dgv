package com.dgv.web.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserBoardController {

	@RequestMapping("/board.do")
	public String userBoard() {
		return "/board/user_board_community";
	}
	
	@RequestMapping("/review.do")
	public String userReview() {
		return "/board/user_board_review";
	}
}
