package com.dgv.web.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminBoardController {

	@RequestMapping("/adminNotice.mdo")
	public String adminNotice() {
		
		return "/board/admin_board_notice";
	}
	@RequestMapping("/adminEnquriy.mdo")
	public String adminEnquriy() {
		
		return "/board/admin_board_enquriy";
	}
}
