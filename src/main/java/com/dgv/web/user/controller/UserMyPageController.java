package com.dgv.web.user.controller;

import java.util.List;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dgv.web.user.service.UserService;
import com.dgv.web.user.vo.UserVO;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

@Controller
public class UserMyPageController {
   
   @Autowired
   private UserService userService;

 
   @RequestMapping("/myPage.do")
   public String myPage(Model model,HttpServletRequest request) {
      
      HttpSession session = request.getSession();
      String id= (String) session.getAttribute("userID");
      System.out.println("세션" + id);
      UserVO vo = userService.MyUserList(id);
      model.addAttribute("userList", vo);

      return "/myPage/user_myPage";
   }
   
   @RequestMapping("/myPage_reserve.do")
   public String myPage_reserve(Model model,HttpServletRequest request) {
	      HttpSession session = request.getSession();
	      String id= (String) session.getAttribute("userID");
	      System.out.println("세션" + id);
	      UserVO vo = userService.MyUserList(id);
	      model.addAttribute("userList", vo);
      return "/myPage/user_myPage_reserve";
   }
   
   @RequestMapping("/myPage_coupon.do")
   public String myPage_coupon() {
      return "/myPage/user_myPage_coupon";
   }
   
   @RequestMapping("/myPage_event.do")
   public String myPage_event() {
      return "/myPage/user_myPage_event";
   }
   
   // 회원정보 수정 비밀번호 확인페이지
   @RequestMapping("/myPage_checkData.do")
   public String myPage_checkData() {
      return "/myPage/user_myPage_checkData";
   }
   
   // 객체 생성, 주입
   @Inject
	public UserMyPageController(UserService userService) {
		this.userService = userService;
	}

	// 비밀번호 확인
	@PostMapping("/myPage_checkData.do")
	@ResponseBody
	public String loginPOST(@RequestBody UserVO vo, HttpSession session, Model model) {
		System.out.println("id : " + vo.getUser_id());
		System.out.println("pw : " + vo.getUser_pw());
		UserVO userId = userService.login(vo);

		System.out.println(BCrypt.checkpw(vo.getUser_pw(), userId.getUser_pw()));
		System.out.println("TEST 1 : " + userId.getUser_pw());
		Gson gson = new Gson();
		JsonObject jsonObject = new JsonObject();
		if (vo.getUser_id().equals(userId.getUser_id()) && BCrypt.checkpw(vo.getUser_pw(), userId.getUser_pw())) {
			System.out.println("비밀번호 확인.");
			jsonObject.addProperty("msg", "SUCCESS");
			session.setAttribute("userID", userId.getUser_id());
			System.out.println(jsonObject);
		} else {
			System.out.println("비밀번호를 다시 확인해 주세요.");
			jsonObject.addProperty("msg", "FAIL");
			System.out.println(jsonObject);
		}
		String jsonResult = gson.toJson(jsonObject);

		return jsonResult;
	}
   
   
   
   //회원 개인정보변경 불러오기 부분
   @RequestMapping("/myPage_myData.do")
   public String myPage_myData(Model model,HttpServletRequest request) {
      
      HttpSession session = request.getSession();
      String id= (String) session.getAttribute("userID");
      System.out.println("세션" + id);
//      userService.MyUserData(id); -> 이거로 세션아이디에 맞는 정보를 받아오고 
//      UserVO userVo= (UserVO) userService.MyUserData(id);
      UserVO vo = userService.MyUserData(id);
      model.addAttribute("userData", vo);
      return "/myPage/user_myPage_myData";
   }

   //회원정보 수정
   @RequestMapping("/updateUser.do")
   @ResponseBody
	public String updateUser(@RequestBody UserVO userVO, RedirectAttributes redirectAttributes, HttpSession session){
		String hashedPw = BCrypt.hashpw(userVO.getUser_pw(), BCrypt.gensalt());
		userVO.setUser_pw(hashedPw);
		
		userVO.setUser_id((String) session.getAttribute("userID"));
		int num =userService.updateUser(userVO);
		redirectAttributes.addFlashAttribute("msg", "UPDATED");
		Gson gson = new Gson();
		System.out.println("num =: "+ num);
		JsonObject jsonObject =new JsonObject();
		
		if(num ==0 ) {
			System.out.println("회원정보 수정 실패!!");
			jsonObject.addProperty("msg", "FAIL");
		}else {
			System.out.println("회원정보 수정 성공!!");
			jsonObject.addProperty("msg", "SUCCESS");
		}
		
		String result = gson.toJson(jsonObject);
		
		return result;
   }
}