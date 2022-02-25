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
	
	/////고객센터 //////
	@RequestMapping("/serviceCenter.do")
	public String serviceCenter() {
		return "/board/user_service_center";
	}
	
	@RequestMapping("/notice.do")
	public String userNotice() {
		return "/board/user_board_notice";
	}
	@RequestMapping("/oftenQna.do")
	public String oftenQna() {
		return "/board/user_often_qna";
	}@RequestMapping("/myQna.do")
	public String myQna() {
		return "/board/user_one_qna";
	}
}
