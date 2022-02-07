package com.dgv.web.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminUserTermController {

	@RequestMapping("/userTermList.mdo")
	public String userTermList() {
		return"/user/admin_user_terms";
	}
	
	@RequestMapping("userTermRegister.mdo")
	public String userTermRegister() {
		return "/user/admin_user_terms_resiter";
	}
	
	
}
