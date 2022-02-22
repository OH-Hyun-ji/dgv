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
import com.google.gson.Gson;
import com.google.gson.JsonObject;

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
	@PostMapping("/register.do")
	@ResponseBody
	public String registerPOST(@RequestBody UserVO userVO, RedirectAttributes redirectAttributes){
		System.out.println("??????");
		String hashedPw = BCrypt.hashpw(userVO.getUser_pw(), BCrypt.gensalt());
		userVO.setUser_pw(hashedPw);
		
		int num =userService.register(userVO);
		redirectAttributes.addFlashAttribute("msg", "REGISTERED");
		
		Gson gson = new Gson();
		JsonObject jsonObject = new JsonObject();
		 
		if(num ==0 ) {
			System.out.println("회원가입 실패!!");
			jsonObject.addProperty("res", "FAIL");
			
		}else {
			System.out.println("회원가입 성공!!");
			jsonObject.addProperty("res", "SUCCESS");
			
		}
		
		String jsonResult = gson.toJson(jsonObject);
		
		System.out.println(jsonObject);
		return jsonResult;
		
		
		
	}
	
	//회원가입 ID중복체크 
	   @PostMapping("/join.do")
	   @ResponseBody
	   public String checkId(UserVO vo) {
	      int checkNum = userService.checkId(vo.getUser_id());
	      
	      Gson gson = new Gson();
	      JsonObject jsonObject = new JsonObject();
	      
	      if(checkNum > 0) {
	         System.out.println("존재하는 아이디");
	         jsonObject.addProperty("ret", "N");  //ret = N
	      }else {
	         System.out.println("존재하지 않는 아이디 이므로 회원가입 가능!!");
	         jsonObject.addProperty("ret", "Y");
	      }
	      
	      String jsonStr = gson.toJson(jsonObject);
	      

	      return jsonStr;
	   }
}
