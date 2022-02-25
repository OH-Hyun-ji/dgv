package com.dgv.web.user.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dgv.web.user.service.UserService;
import com.dgv.web.user.vo.UserVO;

@Controller
public class UserLoginController {

	private final UserService userService;

	// @RequestMapping("/login.do")
//	public String login() {
//		return "/login/user_login";
//	}
	@Inject
	public UserLoginController(UserService userService) {
		this.userService = userService;
	}

	// 로그인 페이지
	@RequestMapping(value = "/loginForm.do", method = RequestMethod.GET)
	public String loginGET(@ModelAttribute("userVo") UserVO userVo) {
		return "/login/user_loginForm";
	}

	// 로그인 처리
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String loginPOST(UserVO userVO, HttpSession httpSession, Model model) throws Exception {
		UserVO userVo = userService.login(userVO);
		if (userVo == null || !BCrypt.checkpw(userVO.getUser_pw(), userVo.getUser_pw())) {
			System.out.println("로그인 실패");
			return "/login/user_loginForm";
		} else {
			httpSession.setAttribute("userId", userVO.getUser_id());
			model.addAttribute("user", userVo);
			model.addAttribute("userId", userVO.getUser_id());
			model.addAttribute("userName", userVo.getUser_name());
			System.out.println("로그인 성공");
			 return "/login/user_login";
		}
	}
}
