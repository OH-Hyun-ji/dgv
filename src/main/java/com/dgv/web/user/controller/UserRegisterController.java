package com.dgv.web.user.controller;

import javax.inject.Inject;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import com.dgv.web.user.service.UserService;
import com.dgv.web.user.vo.UserVO;

@Controller
public class UserRegisterController {
	
	private final UserService userService;
	
	@Inject
	public UserRegisterController(UserService userService) {
		this.userService = userService;
	}
	
	// 회원가입 페이지
	@RequestMapping(value = "/join.do", method = RequestMethod.GET)
	public String registerGET() throws Exception{
		return "/join/user_join";
	}

	
	
	// 회원가입 처리
	@RequestMapping(value ="/register.do", method = RequestMethod.POST)
	public String registerPOST(UserVO userVO, RedirectAttributes redirectAttributes)throws Exception{
		
		String hashedPw = BCrypt.hashpw(userVO.getUser_pw(), BCrypt.gensalt());
		userVO.setUser_pw(hashedPw);
		userService.register(userVO);
		redirectAttributes.addFlashAttribute("msg", "REGISTERED");
		
		return "/login/user_loginForm";
	}
	
	//회원가입 ID중복체크 
	@PostMapping("/join.do")
	@ResponseBody
	public String checkId(@RequestBody String id) {
		int checkNum = userService.checkId(id);
		
		if(checkNum > 0) {
			System.out.println("존재하는 아이디");
			return "NO";
		}else {
			System.out.println("존재하지 않는 아이디 이므로 회원가입 가능!!");
			return "YES";
		}
	}
}
