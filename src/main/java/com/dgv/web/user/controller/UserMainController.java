package com.dgv.web.user.controller;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dgv.web.admin.common.S3KeyVO;
import com.dgv.web.user.service.UserService;

@Controller
public class UserMainController {

	
	@RequestMapping("/dgvMain.do")
	public String dgvMain() {
	
		
		return"/main/user_main";
	}
}
