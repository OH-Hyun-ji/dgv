package com.dgv.web.admin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dgv.web.admin.service.AdminMovieService;
import com.dgv.web.admin.service.AdminUserService;
import com.dgv.web.admin.vo.AdminTermVO;
import com.dgv.web.admin.vo.CommonResultDto;

@Controller
public class AdminUserTermController {

	@Autowired
	private AdminUserService adminUserService;
	
	@Autowired
	private AdminMovieService adminMovieService;
	
	@PostMapping("deleteTerm.mdo")
	@ResponseBody
	public CommonResultDto deleteTerm(@RequestBody AdminTermVO termVo) {
		int num = adminMovieService.TermDelete(termVo);
		
		if(num==0)
			return CommonResultDto.fail();
		return CommonResultDto.success();
	}
	
	@PostMapping("termUpdate.mdo")
	@ResponseBody
	public CommonResultDto termUpdate(@RequestBody AdminTermVO termVo) {
		int num = adminMovieService.TermUpdate(termVo);
		
		if(num==0)
			return CommonResultDto.fail();
		return CommonResultDto.success();
	}
	
	@RequestMapping("TermDetail.mdo")
	public String TermDetail(@RequestParam("term_num")int num, Model model ) {
		AdminTermVO termVo = adminUserService.userTermNumVo(num);
		model.addAttribute("termVo",termVo);
		
		return"/user/admin_term_detail";
	}
	
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
