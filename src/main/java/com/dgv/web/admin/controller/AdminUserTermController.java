package com.dgv.web.admin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dgv.web.admin.service.AdminUserService;
import com.dgv.web.admin.vo.AdminTermVO;
import com.dgv.web.admin.vo.CommonResultDto;

@Controller
public class AdminUserTermController {

	@Autowired
	private AdminUserService adminUserService;
	
	@RequestMapping("/userTermList.mdo")
	public String userTermList(AdminTermVO vo,Model model) {
		model.addAttribute("termList", adminUserService.termList());
		model.addAttribute("termListCount", adminUserService.termList().size());
		return"/user/admin_user_terms";
	}
	
	@RequestMapping("/userTermRegister.mdo")
	public String userTermRegister() {
		return "/user/admin_user_terms_register";
	}
	
	@PostMapping("/termInsert.mdo")
	@ResponseBody
	public CommonResultDto termInsert(@RequestBody AdminTermVO vo,HttpSession session) {
		String regId=(String) session.getAttribute("adminID");
		vo.setReg_id(regId);
		System.out.println("regId " +regId);
		int num = adminUserService.termInsert(vo);
		
		if(num ==0)
			return CommonResultDto.fail();
		return CommonResultDto.success();
	}
	

}
