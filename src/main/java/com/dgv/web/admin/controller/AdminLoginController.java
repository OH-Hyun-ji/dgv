package com.dgv.web.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.dgv.web.admin.service.AdminUserService;
import com.dgv.web.admin.vo.AdminVO;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

@Controller

public class AdminLoginController {

	@Autowired
	private AdminUserService adminUserService;
	
	@RequestMapping("/login.mdo")
	public String adminLoginPage() {
		return "/login/admin_login";
	}
	
	@PostMapping("/loginCheck.mdo")
	@ResponseBody
	public String adminLogin(@RequestBody AdminVO vo, Model model, HttpSession session) {
		System.out.println("관리자 로그인 처리");
		AdminVO adminId = adminUserService.adminLogin(vo.getAdmin_id());
		
		Gson gson = new Gson();
		JsonObject jsonObject = new JsonObject();
		if(vo.getAdmin_id().equals(adminId.getAdmin_id())&&vo.getAdmin_passwd().equals(adminId.getAdmin_passwd())) {
			System.out.println("로그인 성공!!");
			jsonObject.addProperty("msg", "SUCCESS");
			session.setAttribute("adminID", adminId.getAdmin_name());
			System.out.println(jsonObject);		
		}else {
			System.out.println("로그인 실패");
			jsonObject.addProperty("msg", "FAil");
			System.out.println(jsonObject);		
		}
		String jsonResult = gson.toJson(jsonObject);
		
		return jsonResult;
	}
	@RequestMapping("/logout.mdo")
	public String adminLogout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return"redirect:login.mdo";
	}
}
