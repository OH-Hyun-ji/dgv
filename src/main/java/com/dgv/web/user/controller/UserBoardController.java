package com.dgv.web.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dgv.web.user.service.UserBoardService;
import com.dgv.web.user.vo.UserInquiryVO;

@Controller
public class UserBoardController {

	@Autowired
	private UserBoardService userBoardService;
	
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
	public String userNotice(Model model) {
		model.addAttribute("noticeList",  userBoardService.noticeList());
		return "/board/user_board_notice";
	}
	@RequestMapping("/oftenQna.do")
	public String oftenQna() {
		return "/board/user_often_qna";
		
	}
	
	@RequestMapping("/myQna.do")
	public String myQna(Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		System.out.println("session.getId() =" + session.getAttribute("userID"));
		System.out.println("session.getId() =" +session.getAttributeNames());
		String id = (String) session.getAttribute("userID");
		System.out.println("id "+id);
		model.addAttribute("userQnaOneList", userBoardService.userQnaOneList(id));
		model.addAttribute("userQnaCount",userBoardService.userQnaOneList(id).size());
		return "/board/user_one_qna";
	}
	
	@RequestMapping("/qnaRegister.do")
	public String qnaRegister() {
		return "/board/user_qna_register";
	}
	

	@PostMapping("/qnaInsert.do")
	public String qnaRegisterAction(UserInquiryVO vo) {
		int num = userBoardService.insertMyQna(vo);
		if(num ==0) {
			System.out.println("등록 실패");
		}else {
			System.out.println("등록 성공 ");
		}
		return "redirect:/myQna.do";
	}
	
}
