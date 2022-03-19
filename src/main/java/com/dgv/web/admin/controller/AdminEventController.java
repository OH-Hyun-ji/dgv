package com.dgv.web.admin.controller;

import java.awt.print.Book;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.dgv.web.admin.config.RequestUtils;
import com.dgv.web.admin.service.AdminMovieService;
import com.dgv.web.admin.service.FileUploadService;
import com.dgv.web.admin.vo.AdminEventVO;
import com.dgv.web.admin.vo.CommonResultDto;

@Controller
public class AdminEventController {
	
	@Autowired
	private AdminMovieService adminMovieService;
	
	@Autowired
	private FileUploadService fileUploadService;

	//종료된이벤트
	@RequestMapping("endEventList.mdo")
	public String endEventSelect(Model model) {
		List<AdminEventVO> eventList = adminMovieService.endEventSelect();
		for(AdminEventVO eventVo : eventList) {
			adminMovieService.eventCheck(eventVo);
			System.out.println("상태 ㅣ: "+ eventVo.getEvent_check());
			
		}
		model.addAttribute("eventList",eventList);
		return "/board/admin_event_list";
	}
	//진행중인 이벤트 
	@RequestMapping("continueList.mdo")
	public String continueList(Model model) {
		List<AdminEventVO> eventList = adminMovieService.continueEventSelect();
		model.addAttribute("eventList",eventList);
		return "/board/admin_event_list";
	}
	
	//전체 이벤트 목록 
	@RequestMapping("/adminEventList.mdo")
	public String adminEventList(Model model) {
		List<AdminEventVO> eventList = adminMovieService.EventSelect();
		model.addAttribute("eventList",eventList);
		
		return "/board/admin_event_list";
	}
	
	@RequestMapping("/eventRegisterPage.mdo")
	public String eventRegisterPage() {
		return "/board/admin_event_register";
	}
	
	@PostMapping("/changeEventStatus.mdo")
	@ResponseBody
	public CommonResultDto changeEventStatus(@RequestBody AdminEventVO vo) {
		
		int num = adminMovieService.eventAdminUpdate(vo);
		
		
		if(num ==0 )
			return CommonResultDto.fail();
		return CommonResultDto.success();
	}
	
	@PostMapping("/insertEvent.mdo")
	@ResponseBody
	public CommonResultDto insertEvent(@RequestPart("eventVo")AdminEventVO eventVo,@RequestPart MultipartFile imgFile ,@RequestPart MultipartFile imgFile1) {
		final FileUploadService.FileUploadResult fileResult = fileUploadService.fileUpload(imgFile, "event/", eventVo.getEvent_img());
		final FileUploadService.FileUploadResult fileResult1 = fileUploadService.fileUpload(imgFile1, "event/", eventVo.getEvent_text_img());
		
		eventVo.setEvent_img(fileResult.getUrl());
		eventVo.setEvent_text_img(fileResult1.getUrl());
		
		if(!fileResult.isSuccess())
			return CommonResultDto.fail();
		
		
		int num = adminMovieService.EventInsert(eventVo);
		
		if(num==0)
			return CommonResultDto.fail();
		return CommonResultDto.success();
					
		
	}
	
	
}
