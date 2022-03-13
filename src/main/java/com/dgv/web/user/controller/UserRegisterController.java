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
import com.dgv.web.admin.vo.CommonResultDto;
import com.dgv.web.user.service.UserService;
import com.dgv.web.user.vo.UserDetailVO;
import com.dgv.web.user.vo.UserVO;
import com.google.gson.Gson;

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
	public String registerPOST(UserVO userVO, UserDetailVO detailVo ,RedirectAttributes redirectAttributes){
		System.out.println("??????");
		String hashedPw = BCrypt.hashpw(userVO.getUser_pw(), BCrypt.gensalt());
		userVO.setUser_pw(hashedPw);
		
		int num =userService.register(userVO);
		detailVo.setUser_num(userVO.getUser_num());
		int detailNum = userService.userDetail(detailVo);
		
		redirectAttributes.addFlashAttribute("msg", "REGISTERED");
		
	
		 num += detailNum;
		if(num ==0 || num ==1 ) {
			System.out.println("회원가입 실패!!");
			
		}else {
			System.out.println("회원가입 성공!!");
			
		}
		
		return"/login/user_loginForm";
			
		
	}
	
	   //회원가입 ID중복체크 
	   @PostMapping("/join.do")
	   @ResponseBody
	   public CommonResultDto checkId(@RequestBody UserVO vo) {
	      int checkNum = userService.checkId(vo.getUser_id());
	      System.out.println("id :" + vo.getUser_id());
	      System.out.println("checkNum : "+ checkNum);
	      Gson gson = new Gson();
	   
	      
	      if(checkNum > 0) {
	         System.out.println("존재하는 아이디");
	         return CommonResultDto.fail(); //ret = N
	      }else {
	         System.out.println("존재하지 않는 아이디 이므로 회원가입 가능!!");
	         return CommonResultDto.success();
	      }
	  
	   }
	   
	   
	   //회원가입 이메일 중복체크 
	   @PostMapping("/join_email.do")
	   @ResponseBody
	   public CommonResultDto checkEmail(@RequestBody UserVO vo) {
	      int checkNum = userService.checkEmail(vo.getUser_email());
	      System.out.println("id :" + vo.getUser_email());
	      System.out.println("checkNum : "+ checkNum);
	      Gson gson = new Gson();
	   
	      
	      if(checkNum > 0) {
	         System.out.println("존재하는 이메일");
	         return CommonResultDto.fail(); //ret = N
	      }else {
	         System.out.println("존재하지 않는 이메일 이므로 회원가입 가능!!");
	         return CommonResultDto.success();
	      }
	  
	   }
	   
	   
	   
}
