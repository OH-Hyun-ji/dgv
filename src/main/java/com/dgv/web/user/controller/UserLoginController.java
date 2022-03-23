package com.dgv.web.user.controller;

import java.io.IOException;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dgv.web.admin.config.RequestUtils;
import com.dgv.web.admin.service.AdminUserService;
import com.dgv.web.admin.vo.AdminRankVO;
import com.dgv.web.admin.vo.CommonResultDto;
import com.dgv.web.user.service.UserService;
import com.dgv.web.user.vo.UserDetailVO;
import com.dgv.web.user.vo.UserVO;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class UserLoginController {

	@Autowired
	private UserService userService;

	@Autowired
	private AdminUserService adminUserService;
	
	@Autowired
	private JavaMailSenderImpl mailSender;

	private int count;
	// 로그인 페이지
	@RequestMapping(value = "/loginForm.do", method = RequestMethod.GET)
	public String loginGET(@ModelAttribute("userVo") UserVO userVo) {
		return "/login/user_loginForm";
	}

	// 로그인 처리
	@PostMapping("/login.do")
	@ResponseBody
	public String loginPOST(@RequestBody UserVO userVO, Model model) {
		System.out.println("id : " + userVO.getUser_id());
		System.out.println("pw : " + userVO.getUser_pw());
		UserVO vo = userService.login(userVO);

		// System.out.println(BCrypt.checkpw(userVO.getUser_pw(), userId.getUser_pw()));
		System.out.println("TEST 1 : " + vo.getUser_pw());
		Gson gson = new Gson();
		JsonObject jsonObject = new JsonObject();
		if(vo.getUser_status()) {
			if (userVO.getUser_id().equals(vo.getUser_id()) && BCrypt.checkpw(userVO.getUser_pw(), vo.getUser_pw())) {
				System.out.println("로그인 성공!!");
				jsonObject.addProperty("msg", "SUCCESS");
	
				UserDetailVO detailVo = userService.userDetailVo(vo.getUser_num());
				RequestUtils.setUserId(vo.getUser_id());
				RequestUtils.setUserEmail(vo.getUser_email());
				RequestUtils.getUserId("userID");
				System.out.println("세션 : "+RequestUtils.getUserId("userID"));
				if (detailVo.getUser_img().length() > 3) {
					RequestUtils.setUserImg(detailVo.getUser_img());
				} else {
					RequestUtils.setUserImg("0");
				}
				if (detailVo.getUser_rank().length() > 2) {
					AdminRankVO rankVo = adminUserService.rankNameSelect(detailVo.getUser_rank());
					detailVo.setRank_img(rankVo.getRank_img());
					RequestUtils.setRankImg(detailVo.getRank_img());
					RequestUtils.setRankName(detailVo.getUser_rank());
					System.out.println(detailVo.getRank_img());
					System.out.println(detailVo.getUser_rank());
				}else {
					RequestUtils.setRankImg("0");
					RequestUtils.setRankName("0");
				}
				
	
				// session.setAttribute("userID",vo.getUser_id());
				System.out.println(jsonObject);
			} else {
					
					System.out.println("inner count "+ count);
					if(count == 4){
						int num = userService.userStatus(vo);
						if(num == 0)
						System.out.println("비활성 실패");
						System.out.println("계정이 비활성화 되었습니다.");
						jsonObject.addProperty("msg", "STATUS");
						String jResult=gson.toJson(jsonObject);
						return jResult;
					}
				System.out.println("count : "+count);
				System.out.println("로그인 실패");
				jsonObject.addProperty("msg", "FAIL");
				System.out.println(jsonObject);
				count++;
			}
			String jsonResult = gson.toJson(jsonObject);
	
			return jsonResult;
		}else {
			System.out.println("비활성화 계정입니다. ");
			jsonObject.addProperty("msg", "STATUS");
			String jResult=gson.toJson(jsonObject);
			return jResult;
		}
	}

	@PostMapping("/kakaoLogin.do")
	@ResponseBody
	public CommonResultDto kakaoLogin(@RequestBody UserVO vo) {

		log.debug("debug!");
		UserVO userVo = userService.kakaoLogin(vo);

		if (userVo.getUser_email().equals(vo.getUser_email())) {
			System.out.println(userVo.getUser_email() + " 와 " + vo.getUser_email() + "는 같다.");
			UserDetailVO detailVo = userService.userDetailVo(userVo.getUser_num());
			if (detailVo.getUser_img().length() > 3) {
				RequestUtils.setUserImg(detailVo.getUser_img());
			} else {
				RequestUtils.setUserImg("0");
			}
			if (detailVo.getUser_rank().length() > 2) {
				AdminRankVO rankVo = adminUserService.rankNameSelect(detailVo.getUser_rank());
				detailVo.setRank_img(rankVo.getRank_img());
				RequestUtils.setRankImg(detailVo.getRank_img());
				RequestUtils.setRankName(detailVo.getUser_rank());
				System.out.println(detailVo.getRank_img());
				System.out.println(detailVo.getUser_rank());
			} else {
				RequestUtils.setRankImg("0");
				RequestUtils.setRankName("0");
			}
			// session.setAttribute("userID", userVo.getUser_id());
			RequestUtils.setUserId(userVo.getUser_id());
			RequestUtils.setUserEmail(userVo.getUser_email());
			RequestUtils.getUserId("userID");

			return CommonResultDto.success();
		} else {
			return CommonResultDto.fail();
		}

	}

	// 로그아웃 처리
	@RequestMapping("/logout.do")
	public String userLogout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:loginForm.do";
	}

	// 아이디 찾기
	@PostMapping("/find_userId.do")
	@ResponseBody
	public String findId(@RequestBody UserVO userVO) {
		System.out.println("email :" + userVO.getUser_email());
		UserVO vo = userService.findId(userVO);
		Gson gson = new Gson();

		String userId = gson.toJson(vo);

		return userId;
	}

	// 아이디 찾기
	@RequestMapping("/find_id.do")
	public String findId() {

		return "/login/user_find_id";
	}

	
	
	
	// 비밀번호 찾기
	@RequestMapping("/find_password.do")
	public String findPassword() {

		return "/login/user_find_password";
	}

	// 비밀번호 찾기 (인증번호 확인)
	@RequestMapping("/find_auth.do")
	public String findAuth() {
		
		return "/login/user_find_auth";
	}

	//새 비밀번호 변경 
	@PostMapping("/changeMyPw.do")
	@ResponseBody 
	public CommonResultDto changeMyPw(@RequestBody UserVO userVo,RedirectAttributes redirectAttributes) {
		
		String hashedPw = BCrypt.hashpw(userVo.getUser_pw(), BCrypt.gensalt());
		userVo.setUser_pw(hashedPw);
		userVo.setUser_email(RequestUtils.getUserEmail("userEmail"));
		int numCheck = userService.newPassword(userVo);
		
		if(numCheck == 0)
			return CommonResultDto.fail();
		return CommonResultDto.success();
	}
	
	
	// 새 비밀번호 수정페이지
	@RequestMapping("/find_updatePassword.do")
	public String updatePassword() {
		
		return "/login/user_find_updatePassword";
	}
		

	
	// 인증번호 발송
	@PostMapping("/send_auth.do")
	@ResponseBody
	public String pw_auth(@RequestBody UserVO userVo, HttpSession session) throws IOException {

		UserVO vo = userService.selectMember(userVo.getUser_email());

		if (vo != null) {
			Random r = new Random();
			int num = r.nextInt(888888)+111111; // 랜덤난수설정
			
			System.out.println("NUM : "+ num);
			String authNum = String.valueOf(num);
				session.setAttribute("auth", authNum);
				RequestUtils.setUserEmail(userVo.getUser_email());

				String tomail = userVo.getUser_email(); // 받는사람
				String title = "[DGV] 비밀번호변경 인증 이메일 입니다";
				String content = System.getProperty("line.separator") + "안녕하세요 회원님"
						+ System.getProperty("line.separator") + "DGV 회원님 비밀번호 변경을 위한 인증번호는 " + num + " 입니다."
						+ System.getProperty("line.separator"); //

				try {
					MimeMessage message = mailSender.createMimeMessage();
					MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "utf-8");

				//	messageHelper.setFrom(setfrom);
					messageHelper.setTo(tomail);
					messageHelper.setSubject(title);
					messageHelper.setText(content);

					mailSender.send(message);
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}
		
				Gson gson = new Gson();
				
			return authNum;
		}
		return new String();
	}

	
	
	// 이메일 인증번호 확인
	@PostMapping("authNumberCheck.do")
	@ResponseBody
	public CommonResultDto authNumberCheck(@RequestBody UserVO userVo, HttpSession session) {
		
		String numAuth = (String)session.getAttribute("auth");
		System.out.println("numAuth"+ numAuth);
		System.out.println("user_auth"+ userVo.getUser_auth());
		
		//userVo.setUser_auth(numAuth);
		if(numAuth.equals(userVo.getUser_auth())) {
			System.out.println("인증이 성공함 ");
			return CommonResultDto.success();
		}else {
			System.out.println("인증실패");
			return CommonResultDto.fail();
		}
	}
	
//	// 새 비밀번호 설정
//	@RequestMapping(value = "/pw_new.me", method = RequestMethod.POST)
//	public String pw_new(UserVO vo, HttpSession session) throws IOException{
//		int result = userService.newPassword(vo);
//		if(result == 1) {
//			return "jj/loginForm";
//		}
//		else {
//			System.out.println("pw_update"+ result);
//			return "YM/pw_new";
//		}
//	}
	
	
	
	
}
