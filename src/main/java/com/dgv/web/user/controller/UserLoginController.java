package com.dgv.web.user.controller;

import static org.junit.Assert.assertThat;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.dgv.web.admin.config.RequestUtils;
import com.dgv.web.admin.vo.CommonResultDto;
import com.dgv.web.user.service.UserService;
import com.dgv.web.user.vo.UserVO;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class UserLoginController {

	@Autowired
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
	@PostMapping("/login.do")
	@ResponseBody
	public String loginPOST(@RequestBody UserVO userVO, HttpSession session, Model model) {
		System.out.println("id : "+ userVO.getUser_id());
		System.out.println("pw : "+ userVO.getUser_pw());
		UserVO vo = userService.login(userVO);
		
		//System.out.println(BCrypt.checkpw(userVO.getUser_pw(), userId.getUser_pw()));
		System.out.println("TEST 1 : "+vo.getUser_pw() );
		Gson gson = new Gson();
		JsonObject jsonObject = new JsonObject();
		if(userVO.getUser_id().equals(vo.getUser_id())&&BCrypt.checkpw(userVO.getUser_pw(), vo.getUser_pw())) {
			System.out.println("로그인 성공!!");
			jsonObject.addProperty("msg", "SUCCESS");
			session.setAttribute("userID",vo.getUser_id());
			System.out.println(jsonObject);		
		}else { 
			System.out.println("로그인 실패");
			jsonObject.addProperty("msg", "FAIL");
			System.out.println(jsonObject);		
		}
		String jsonResult = gson.toJson(jsonObject);
		
		return jsonResult;
 	}
	
	@PostMapping("/kakaoLogin.do")
	@ResponseBody
	public CommonResultDto kakaoLogin(@RequestBody UserVO vo) {
		
		log.debug("debug!");
		UserVO userVo = userService.kakaoLogin(vo);
	
		if(userVo.getUser_email().equals(vo.getUser_email())) {
			System.out.println(userVo.getUser_email()+" 와 "+vo.getUser_email()+"는 같다.");
			//session.setAttribute("userID", userVo.getUser_id());
			RequestUtils.setUserId(userVo.getUser_id());
			RequestUtils.getUserId("userID");
			
			return CommonResultDto.success();
		}else {
			return CommonResultDto.fail();
		}
		
	}
	
	// 로그아웃 처리
	@RequestMapping("/logout.do")
	public String userLogout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return"redirect:loginForm.do";
	}
	
}
