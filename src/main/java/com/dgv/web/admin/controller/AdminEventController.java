package com.dgv.web.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
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
	
	@PostMapping("/insertEvent.mdo")
	@ResponseBody
	public CommonResultDto insertEvent(@RequestPart("eventVo")AdminEventVO eventVo,@RequestPart MultipartFile imgFile ) {
		final FileUploadService.FileUploadResult fileResult = fileUploadService.fileUpload(imgFile, "event/", eventVo.getEvent_img());
		
		eventVo.setEvent_img(fileResult.getUrl());
		if(!fileResult.isSuccess())
			return CommonResultDto.fail();
		
		int num = adminMovieService.EventInsert(eventVo);
		
		if(num==0)
			return CommonResultDto.fail();
		return CommonResultDto.success();
					
		
	}
	
	
}
